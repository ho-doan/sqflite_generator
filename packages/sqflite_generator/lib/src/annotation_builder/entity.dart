import 'package:analyzer/dart/element/element.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:sqflite_generator/src/annotation_builder/column.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';
import 'package:sqflite_generator/src/annotation_builder/index.dart';
import 'package:sqflite_generator/src/annotation_builder/primary_key.dart';
import 'package:sqflite_generator/src/annotation_builder/property.dart';

class AEntity {
  final String? name;
  final List<AColumn> columns;
  final List<AForeignKey> foreignKeys;
  final List<APrimaryKey> primaryKeys;
  final List<AIndex> indices;
  final String className;
  String get extensionName => '${className}Query';

  String get rawCreateTable {
    final all = [
      ...primaryKeys.map(
        (e) => e.rawCreate(
          autoId: e.auto,
          isId: true,
          isIds: primaryKeys.length > 1,
          isFore: foreignKeys.any((f) => e.nameDefault == f.nameDefault),
        ),
      ),
      ...columns.map((e) => e.rawCreate()),
      ...indices.map((e) => e.rawCreate()),
      ...foreignKeys.map((e) => e.rawCreate()),
      primaryKeys.rawCreate(foreignKeys),
      ...foreignKeys.map((e) => e.rawCreateForeign),
    ].where((e) => e.isNotEmpty);
    return 'CREATE TABLE IF NOT EXISTS $className(\n\t\t${all.join(',\n\t\t\t')}\n\t)';
  }

  String get rawFromDB {
    return [
      aPs.map(
        (e) {
          if (e.rawFromDB) {
            return '${e.nameDefault}: ${e.dartType}.fromDB(json)';
          }
          if (e.dartType.toString().contains('DateTime')) {
            return '${e.nameDefault}: DateTime.fromMillisecondsSinceEpoch(json[\'${e.nameFromDB}\'] as int? ?? -1,)';
          }
          if (e.dartType.isDartCoreBool) {
            return '${e.nameDefault}: (json[\'${e.nameFromDB}\'] as int?) == 1';
          }
          return '${e.nameDefault}: json[\'${e.nameFromDB}\'] as ${e.dartType}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawToDB {
    return [
      aPs.map(
        (e) {
          if (e.rawFromDB) {
            return '\'${e.nameToDB}\': ${e.defaultSuffix}.id';
          }
          if (e.dartType.toString().contains('DateTime')) {
            return '\'${e.nameToDB}\': ${e.defaultSuffix}.millisecondsSinceEpoch';
          }
          return '\'${e.nameToDB}\':${e.nameDefault}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawGetAll {
    return [
      '(await database.rawQuery(',
      '\'\'\'SELECT \${\$createSelect($defaultSelectClass)} FROM $className ${className.toSnakeCase()}',
      ...aFores,
      '\'\'\') as List<Map>).map($className.fromDB).toList()'
    ].join('\n');
  }

  String get rawFindOne {
    return [
      'final res = (await database.rawQuery(\'\'\'',
      'SELECT ',
      '\${\$createSelect(select)}',
      ' FROM $className ${className.toSnakeCase()}',
      'WHERE ${_whereDB.join(' AND ')}',
      ...aFores,
      '\'\'\',',
      _whereStaticArgs,
      ') as List<Map>);',
      'return res.isNotEmpty? $className.fromDB(res.first) : null;'
    ].join('\n');
  }

  String delete(bool isStatic) {
    return [
      'await database.rawQuery(\'\'\'DELETE FROM $className ${className.toSnakeCase()} WHERE ${_whereDB.join(' AND ')}\'\'\',',
      isStatic ? _whereStaticArgs : _whereArgs,
      ');'
    ].join('');
  }

  String get deleteAll {
    return [
      'DELETE * FROM $className',
    ].join('\n');
  }

  const AEntity({
    this.name,
    required this.columns,
    required this.foreignKeys,
    required this.primaryKeys,
    required this.indices,
    required this.className,
  });

  factory AEntity.fromElement(ClassElement element) {
    final fields = element.fields.cast<FieldElement>();

    final cons = element.constructors.where((e) => !e.isFactory);
    final fs = <FieldFormalParameterElement>[
      for (final s in cons)
        ...s.parameters
            .whereType<FieldFormalParameterElement>()
            .cast()
            .toList(),
    ];
    final ss = <SuperFormalParameterElement>[
      for (final s in cons)
        ...s.parameters
            .whereType<SuperFormalParameterElement>()
            .cast()
            .toList(),
    ];
    final indies = AIndexX.fields(fields, element.displayName);
    final primaries = APrimaryKeyX.fields(fields, element.displayName);
    final fores = AForeignKeyX.fields(fields, element.displayName, ss);

    return AEntity(
      className: element.displayName,
      columns: AColumnX.fields(
        fields,
        element.displayName,
        [...fs, ...ss],
        primaries,
        indies,
        fores,
      ),
      foreignKeys: fores,
      primaryKeys: primaries,
      indices: indies,
    );
  }
}

extension AUpdate on AEntity {
  List<String> rawUpdate([AProperty? parent]) {
    if (parent != null) {
      return ['await ${parent.defaultSuffix}.update(database);'];
    }
    return {
      for (final fore in foreignKeys) ...fore.entityParent.rawUpdate(fore),
      'return await database.update(\'$className\',toDB(), '
          'where: "${_whereDB.join(' AND ')}",'
          ' whereArgs: [${_whereArgs.join(' , ')}]);',
    }.toList();
  }
}

extension AInsert on AEntity {
  String rawInsert([AProperty? ps]) {
    final fieldsRaw = aPs.map((e) => e.nameToDB).join(',\n');

    if (ps != null) {
      return 'final \$${className.toCamelCase()}Id = await ${ps.defaultSuffix}.insert(database);';
    }

    final fieldsValue = aPs.map((e) {
      if (e.rawFromDB) {
        if (e is AForeignKey) {
          return '\$${e.entityParent.className.toCamelCase()}Id';
        }
      }
      if (ps != null) return '$ps.${e.nameDefault}';
      return e.nameDefault;
    }).join(',');

    return [
      ...foreignKeys.map(
        (e) => e.entityParent.rawInsert(e),
      ),
      '''final \$${className.toCamelCase()}Id = await database.rawInsert(\'\'\'INSERT OR REPLACE INTO $className ($fieldsRaw) 
       VALUES(${List.generate(fFields.length, (index) => '?').join(', ')})\'\'\',
       [
        $fieldsValue,
       ]
      );''',
      if (ps == null) 'return \$${className.toCamelCase()}Id;'
    ].join('\n');
  }
}

extension AQuery on AEntity {
  String get selectClassName => '\$${className}SelectArgs';
  String get defaultSelectClass => '\$default';
  String get whereClassName => '\$${className}WhereArgs';
  List<String> get aFieldNames {
    return [
      ...primaryKeys,
      ...columns,
      ...indices,
      ...foreignKeys,
    ].map((e) => e.nameToDB).toList();
  }

  List<String> get aFores {
    return [
      for (final e in foreignKeys)
        ' INNER JOIN ${e.entityParent.className} ${e.entityParent.className.toSnakeCase()}'
            ' ON ${e.entityParent.className.toSnakeCase()}.${e.entityParent.primaryKeys.first.nameToDB}'
            ' = ${className.toSnakeCase()}.${e.name?.toSnakeCase()}'
    ];
  }

  List<AProperty> get aPs {
    return {
      for (final e in primaryKeys) e.nameDefault: e,
      for (final e in foreignKeys) e.nameDefault: e,
      for (final e in columns) e.nameDefault: e,
      for (final e in indices) e.nameDefault: e,
    }.values.toList();
  }

  List<String> get $check {
    return [
      for (final item in aPs)
        item is AForeignKey
            ? '${item.nameDefault}?.\$check == true'
            : '${item.nameDefault} == true'
    ];
  }
}

extension AParam on AEntity {
  Parameter get selectArgs => Parameter((p) => p
    ..name = 'select'
    ..type = refer('$selectClassName?')
    ..named = true
    ..required = false);
  Parameter get databaseArgs => Parameter((p) => p
    ..name = 'database'
    ..type = refer('Database'));
  Parameter get fromArgs => Parameter((p) => p
    ..name = 'json'
    ..type = refer('Map'));
  List<Parameter> get keysRequiredArgs => [
        for (final key in keys)
          if (key is AForeignKey)
            for (final k in key.entityParent.keys)
              if (k is AForeignKey)
                for (final sk in key.entityParent.keys)
                  Parameter((p) => p
                    ..name = '${k.nameDefault}_${sk.nameDefault}'.toCamelCase()
                    ..type = refer(sk.dartType.toString()))
              else
                Parameter((p) => p
                  ..name = '${key.nameDefault}_${k.nameDefault}'.toCamelCase()
                  ..type = refer(k.dartType.toString()))
          else
            Parameter((p) => p
              ..name = key.nameDefault
              ..type = refer(key.dartType.toString()))
      ];
  List<Parameter> get fieldOptionalArgs => [
        for (final item in aPs)
          Parameter((f) => f
            ..name = item.nameDefault
            ..named = true
            ..required = false
            ..toThis = true)
      ];
}

extension AFields on AEntity {
  List<Field> get fFields => [
        for (final item in aPs)
          Field(
            (f) => f
              ..name = item.nameDefault
              ..modifier = FieldModifier.final$
              ..type = refer(item is AForeignKey
                  ? '${item.entityParent.selectClassName}?'
                  : 'bool?'),
          ),
      ];
  List<Field> get selectFields => [
        for (final item in aPs)
          Field((f) => f
            ..name = item.nameDefault
            ..modifier = FieldModifier.final$
            ..type = refer(item is AForeignKey
                ? '${item.entityParent.selectClassName}?'
                : 'bool?'))
      ];
  List<Field> get whereFields => [
        for (final item in aPs)
          Field((f) => f
            ..name = item.nameDefault
            ..modifier = FieldModifier.final$
            ..type = refer(item is AForeignKey
                ? '\$${item.entityParent.className}WhereArgs?'
                : '${item.dartType.toString().replaceFirst('?', '')}?'))
      ];
  List<AProperty> get keys {
    return [
      for (final item in primaryKeys)
        foreignKeys
                .firstWhereOrNull((e) => e.nameDefault == item.nameDefault) ??
            item
    ];
  }

  List<String> get _whereArgs {
    return [
      for (final key in keys)
        if (key is AForeignKey)
          for (final item in key.entityParent.keys)
            '${key.defaultSuffix}.${item.nameToDB}'
        else
          key.nameToDB
    ];
  }

  List<String> get _whereStaticArgs =>
      _whereArgs.map((e) => e.toCamelCase()).toList();

  List<String> get _whereDB {
    return [for (final key in keys) '${key.nameToDB} = ?'];
  }
}
