import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:change_case/change_case.dart';
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
        ),
      ),
      ...columns.map((e) => e.rawCreate()),
      ...indices.map((e) => e.rawCreate()),
      ...foreignKeys.map((e) => e.rawCreate()),
      primaryKeys.rawCreate,
      ...foreignKeys.map((e) => e.rawCreateForeign),
    ].where((e) => e.isNotEmpty);
    return 'CREATE TABLE IF NOT EXISTS $className(\n\t\t${all.join(',\n\t\t\t')}\n\t)';
  }

  String get rawFromDB {
    return [
      [
        ...primaryKeys,
        ...columns,
        ...indices,
        ...foreignKeys,
      ].lst.map(
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
      [
        ...primaryKeys,
        ...columns,
        ...indices,
        ...foreignKeys,
      ].lst.map(
        (e) {
          if (e.rawFromDB) {
            return '\'${e.nameToDB}\': ${e.nameDefault}.id';
          }
          if (e.dartType.toString().contains('DateTime')) {
            if (e.dartType.nullabilitySuffix == NullabilitySuffix.question) {
              return '\'${e.nameToDB}\': ${e.nameDefault}?.millisecondsSinceEpoch';
            }
            return '\'${e.nameToDB}\': ${e.nameDefault}.millisecondsSinceEpoch';
          }
          return '\'${e.nameToDB}\':${e.nameDefault}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawFindAll {
    final fields = [
      ...[
        ...primaryKeys,
        ...columns,
        ...indices,
        ...foreignKeys,
      ].lst,
      ...[
        for (final item in foreignKeys)
          ...[
            ...item.entityParent.primaryKeys,
            ...item.entityParent.columns,
            ...item.entityParent.indices,
            ...item.entityParent.foreignKeys,
          ].lst,
      ],
    ]
        .map((e) =>
            '${e.className.toSnakeCase()}.${e.nameToDB} as ${e.nameFromDB}')
        .join(',\n');

    final fores = foreignKeys.map((e) {
      return ' INNER JOIN ${e.entityParent.className} ${e.entityParent.className.toSnakeCase()}'
          ' ON ${e.entityParent.className.toSnakeCase()}.${e.entityParent.primaryKeys.first.nameToDB}'
          ' = ${className.toSnakeCase()}.${e.name?.toSnakeCase()}';
    }).toList();

    return [
      'SELECT $fields FROM $className ${className.toSnakeCase()}',
      ...fores
    ].join('\n');
  }

  String get rawFindOne {
    final fields = [
      ...[
        ...[
          ...primaryKeys,
          ...columns,
          ...indices,
          ...foreignKeys,
        ].lst,
        ...[
          for (final item in foreignKeys)
            ...[
              ...item.entityParent.primaryKeys,
              ...item.entityParent.columns,
              ...item.entityParent.indices,
              ...item.entityParent.foreignKeys,
            ].lst,
        ],
      ].map((e) =>
          '${e.className.toSnakeCase()}.${e.nameToDB} as ${e.nameFromDB}'),
      'WHERE ${className.toSnakeCase()}.${primaryKeys.first.nameToDB} = ?'
    ].join(',\n');

    final fores = foreignKeys.map((e) {
      return ' INNER JOIN ${e.entityParent.className} ${e.entityParent.className.toSnakeCase()}'
          ' ON ${e.entityParent.className.toSnakeCase()}.${e.entityParent.primaryKeys.first.nameToDB}'
          ' = ${className.toSnakeCase()}.${e.name?.toSnakeCase()}';
    }).toList();

    return [
      'SELECT $fields FROM $className ${className.toSnakeCase()}',
      ...fores
    ].join('\n');
  }

  String get delete {
    return [
      'DELETE FROM $className ${className.toSnakeCase()} WHERE ${primaryKeys.map((e) => '${e.nameToDB} = ?').join(' AND ')}',
    ].join('\n');
  }

  String get deleteAll {
    return [
      'DELETE * FROM $className',
    ].join('\n');
  }

  String rawInsert([String? parent]) {
    final fields = [
      ...primaryKeys,
      ...columns,
      ...indices,
      ...foreignKeys,
    ].lst;
    final fieldsRaw = fields.map((e) => e.nameToDB).join(',\n');

    if (parent != null) {
      return 'final \$${className.toCamelCase()}Id = await $parent.insert(database);';
    }

    final fieldsValue = fields.map((e) {
      if (e.rawFromDB) {
        // TODO(hodoan): hard id
        if (parent != null) return '$parent.${e.nameDefault}.id';
        if (e is AForeignKey) {
          return '\$${e.entityParent.className.toCamelCase()}Id';
        }
      }
      if (parent != null) return '$parent.${e.nameDefault}';
      return e.nameDefault;
    }).join(',');

    return [
      ...foreignKeys.map(
        (e) => e.entityParent.rawInsert(e.nameDefault),
      ),
      '''final \$${className.toCamelCase()}Id = await database.rawInsert(\'\'\'INSERT OR REPLACE INTO $className ($fieldsRaw) 
       VALUES(${List.generate(fields.length, (index) => '?').join(', ')})\'\'\',
       [
        $fieldsValue,
       ]
      );''',
      if (parent == null) 'return \$${className.toCamelCase()}Id;'
    ].join('\n');
  }

  List<String> rawUpdate([String? parent]) {
    return {
      for (final fore in foreignKeys)
        ...fore.entityParent.rawUpdate('model.${fore.nameDefault}'),
      'await database.update(\'$className\',${parent ?? 'model'}.toDB());',
    }.toList();
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
