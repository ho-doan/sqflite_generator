import 'package:analyzer/dart/element/element.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:sqflite_generator/src/annotation_builder/column.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';
import 'package:sqflite_generator/src/annotation_builder/index.dart';
import 'package:sqflite_generator/src/annotation_builder/primary_key.dart';
import 'package:sqflite_generator/src/annotation_builder/property.dart';

class AEntity {
  final APropertyArgs args;
  final List<AColumn> columns;
  final List<AForeignKey> foreignKeys;
  final List<APrimaryKey> primaryKeys;
  final List<AIndex> indices;
  final String className;
  final String classType;
  final List<String> parentClassName;
  String get extensionName => '${classType}Query';

  List<AProperty> rawCreateTablePS(AColumn? ps) {
    return [
      ...primaryKeys,
      ...columns
          .where((e) => !e.alters.any((e) => e.type == AlterTypeGen.add))
          .where((e) => e.nameDefault != ps?.nameDefault),
      ...indices,
      ...foreignKeys.where((e) => !e.dartType.isDartCoreList),
    ];
  }

  Map<int, List<String>> get rawAlterTable {
    final lst = [
      ...primaryKeys,
      ...columns,
      ...indices,
      ...foreignKeys.where((e) => !e.dartType.isDartCoreList).map((e) => e),
    ];
    final map = <int, List<String>>{};
    for (final item in lst.map((e) => e.rawUpdate())) {
      for (final e in item.entries) {
        if (map.containsKey(e.key)) {
          map[e.key]!.addAll(e.value);
        } else {
          map[e.key] = e.value;
        }
      }
    }
    for (final item in lst) {
      // TODO(hodoan): check
      // if (item is AColumn &&
      //     item.alters.any((e) => e.type == AlterTypeGen.drop)) {
      //   final version =
      //       item.alters.firstWhere((e) => e.type == AlterTypeGen.drop).version;

      //   final raws = <String>[
      //     for (final item in foreignKeys)
      //       if (item.entityParent != null) ...[
      //         "'''${item.entityParent!.rawCreateTable(null, '_new')}'''",
      //         "'INSERT INTO ${item.entityParent!.className}_new(${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')})SELECT ${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')} FROM ${item.entityParent!.className};'",
      //         "'DROP TABLE ${item.entityParent!.className};'",
      //         // "'ALTER TABLE ${item.entityParent!.className}_new RENAME TO ${item.entityParent!.className};'",
      //       ],
      //     "'''${rawCreateTable(item, '_new')}'''",
      //     "'INSERT INTO ${className}_new(${rawCreateTablePS(item).map((e) => e.nameToDB).join(',')})SELECT ${rawCreateTablePS(item).map((e) => e.nameToDB).join(',')} FROM $className;'",
      //     "'DROP TABLE $className;'",
      //     "'ALTER TABLE ${className}_new RENAME TO $className;'",
      //     for (final item in foreignKeys)
      //       if (item.entityParent != null) ...[
      //         "${item.entityParent!.extensionName}.createTable",
      //         "'INSERT INTO ${item.entityParent!.className}(${item.entityParent!.rawCreateTablePS(null).map(
      //               (e) => e.args.fieldNames.join('_').toSnakeCase(),
      //             ).join(',')})SELECT ${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')} FROM ${item.entityParent!.className}_new;'",
      //         "'DROP TABLE ${item.entityParent!.className}_new;'",
      //       ],
      //   ];

      //   if (map.containsKey(version)) {
      //     map[version]!.addAll(raws);
      //   } else {
      //     map[version] = raws;
      //   }
      // }
    }
    return map;
  }

  String get rawFromDB {
    return [
      for (final e in properties())
        if (e is AIndex)
          '${e.nameDefault}: json[\'\${childName}${e.nameFromDB}\'] as ${e.dartType}'
        else if (e is AColumn)
          () {
            if (e.dartType.toString().contains('DateTime')) {
              return '${e.nameDefault}: DateTime.fromMillisecondsSinceEpoch(json[\'\${childName}${e.nameFromDB}\'] as int? ?? -1,)';
            } else if (e.dartType.isDartCoreBool) {
              return '${e.nameDefault}: (json[\'\${childName}${e.nameFromDB}\'] as int?) == 1';
            } else if (e.converter != null) {
              return '${e.nameDefault}: const ${(e).converter}().fromJson(json[\'\${childName}${e.nameFromDB}\'] as String?)';
            } else {
              return '${e.nameDefault}: json[\'\${childName}${e.nameFromDB}\'] as ${e.dartType}';
            }
          }()
        else if (e is APrimaryKey && e.args.parentClassNames.sublist(1).isEmpty)
          '${e.nameDefault}: json[\'\${childName}${e.nameFromDB}\'] as ${e.dartType}',
      for (final key in primaryKeys.where(
          (e) => foreignKeys.map((e) => e.nameDefault).contains(e.nameDefault)))
        '${key.nameDefault}: ${key.entityParent?.className}'
            '.fromDB(json,lst,\'${key.args.fieldNames.join('_').toSnakeCase()}_\')',
      for (final key in foreignKeys.where((e) =>
          !primaryKeys.map((e) => e.nameDefault).contains(e.nameDefault)))
        if (key.dartType.isDartCoreList)
          '${key.nameDefault}: lst.map((e)=>${key.entityParent?.className}.fromDB(e,[])).toList()'
        else
          ' ${key.nameDefault}: ${key.entityParent?.className == className ? 'childStep > 0 ? null :' : ''}'
              '${key.entityParent?.className}'
              '.fromDB(json,lst,\'${key.nameDefault.toSnakeCase()}_\'${key.entityParent?.className == className ? ',1' : ''})',
    ].join(',\n');
  }

  String get rawToDB {
    return [
      for (final item in keysNew)
        '\'${item.$2.args.fieldNames.join('_').toSnakeCase()}\': ${item.$2.args.fieldNames.join('?.')}',
      for (final item in indices) '\'${item.nameToDB}\': ${item.nameDefault}',
      for (final item in columns)
        if (item.dartType.toString().contains('DateTime'))
          '\'${item.nameToDB}\': ${item.nameDefault}?.millisecondsSinceEpoch'
        else if (item.dartType.isDartCoreBool)
          '\'${item.nameToDB}\': (${item.nameDefault} ?? false) ? 1 : 0'
        else if (item.converter != null)
          '\'${item.nameToDB}\': const ${(item).converter}().toJson(${item.nameDefault})'
        else
          '\'${item.nameToDB}\':${item.nameDefault}',
      for (final k in foreignKeys.where((e) =>
          !primaryKeys.map((e) => e.nameDefault).contains(e.nameDefault)))
        if (!k.dartType.isDartCoreList)
          for (final key
              in k.entityParent!.primaryKeys.expand((e) => e.expanded2()))
            '\'${key.args.fieldNames.join('_').toSnakeCase()}\': ${key.args.fieldNames.join('?.')}',
    ].join(',\n');
  }

  String get rawGetAll {
    return [
      '''
        String whereStr = '';
        if (where != null &&
            where.isNotEmpty &&
            whereOr != null &&
            whereOr.isNotEmpty) {
          final s = [...whereOr,where];
          whereStr = s.whereSql;
        } else if (whereOr != null && whereOr.isNotEmpty) {
          whereStr = whereOr.whereSql;
        } else if (where != null && where.isNotEmpty) {
          whereStr = where.whereSql;
        }
      ''',
      'final sql = \'\'\'SELECT \${\$createSelect(select)} FROM $className ${className.toSnakeCase()}',
      '\${const $setClassNameExternal(\'\',\'\').leftJoin(\'${className.toSnakeCase()}\')}',
      '\${whereStr.isNotEmpty ? whereStr : \'\'}',
      "\${(orderBy ?? {}).isNotEmpty ? 'ORDER BY \${(orderBy ?? {}).map((e) => '\${e.field.field.replaceFirst(RegExp('^_'), '')} \${e.type}').join(',')}' : ''}",
      "\${limit != null ? 'LIMIT \$limit' : ''}",
      "\${offset != null ? 'OFFSET \$offset' : ''}",
      "''';",
      "if (kDebugMode) { print('get all $className \$sql'); }",
      'final mapList = (await database.rawQuery(sql) as List<Map>);',
      'return mapList.groupBy(((m) => [${keysNew.map((e) => 'm[$setClassNameExternal.${e.$2.args.fieldNames.join('_').toCamelCase()}.nameCast]').join(',')}]))'
          '.values.map((e)=>$classType.fromDB(e.first,e)).toList();',
    ].join('\n');
  }

  String get countSelect {
    return [
      'final mapList = (await database.rawQuery(',
      '\'\'\'SELECT count(*) as ns_count FROM $className',
      '\'\'\') as List<Map>);',
      'return mapList.first[\'ns_count\'] as int;',
    ].join('\n');
  }

  String get topSelect {
    return 'getAll(database,select: select,where: where,whereOr: whereOr,orderBy: orderBy,limit: top,)';
  }

  String get rawFindOne {
    return [
      'final res = (await database.rawQuery(\'\'\'',
      'SELECT ',
      '\${\$createSelect(select)}',
      ' FROM $className ${className.toSnakeCase()}',
      '\${const $setClassNameExternal(\'\',\'\').leftJoin(\'${className.toSnakeCase()}\')}',
      'WHERE ${_whereDB.join(' AND ')}',
      '\'\'\',',
      _whereStaticArgs,
      ') as List<Map>);',
      'if (res.isEmpty) return null;',
      'final mapList = res.groupBy((e)=>[${keysNew.map((e) => 'e[$setClassNameExternal.${e.$2.args.fieldNames.join('_').toCamelCase()}.nameCast]').join(',')}]).values.first;',
      'return $classType.fromDB(mapList.first,mapList);',
    ].join('\n');
  }

  String delete(bool isStatic) {
    return [
      'await database.rawQuery(\'\'\'DELETE * FROM $className ${className.toSnakeCase()} WHERE ${_whereDB.join(' AND ')}\'\'\',',
      isStatic ? _whereStaticArgs : _whereArgs,
      ');'
    ].join('');
  }

  String get deleteAll {
    return [
      'DELETE * FROM $className',
    ].join('\n');
  }

  const AEntity._({
    required this.args,
    this.parentClassName = const [],
    required this.columns,
    required this.foreignKeys,
    required this.primaryKeys,
    required this.indices,
    required this.className,
    required this.classType,
  });

  static AEntity? of(
    ClassElement element,
    APropertyArgs args,
    List<String> parentClassName, [
    int step = 0,
  ]) {
    if (step > 9) return null;
    return AEntity._fromElement(
        element,
        args.copyWithByEntity(
          parentClassName: element.displayName,
        ),
        parentClassName,
        step);
  }

  factory AEntity._fromElement(
    ClassElement element,
    APropertyArgs args,
    List<String> parentClassName,
    int step,
  ) {
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
    final indies = AIndexX.fields(
      fields,
      args,
      element.displayName,
      parentClassName,
      step + 1,
    );
    final fores = AForeignKeyX.fields(
      step + 1,
      args,
      fields,
      element.displayName,
      parentClassName,
      ss,
    );

    final primaries = APrimaryKeyX.fields(
      fields,
      args,
      element.displayName,
      parentClassName,
      step + 1,
      fores,
    );

    return AEntity._(
      parentClassName: parentClassName,
      className: element.displayName.replaceFirst('\$', ''),
      classType: element.displayName,
      columns: AColumnX.fields(
        step + 1,
        fields,
        element.displayName,
        parentClassName,
        args,
        [...fs, ...ss],
        primaries,
        indies,
        fores,
      ),
      args: args,
      foreignKeys: fores,
      primaryKeys: primaries,
      indices: indies,
    );
  }
}

extension AEntityBase on AEntity {
  List<AProperty> properties() {
    if (parentClassName.length > (9 / 3)) return [];
    final alls = [
      for (final e in aPs)
        if (e is APrimaryKey &&

            /// primary key of child self
            /// ```
            /// class A{
            ///   @primaryKey
            ///   final A? child;
            /// }
            /// ```
            /// result [true]
            !e.args.parentClassNames.sublist(1).contains(className)) ...[
          for (final f in e.expanded2()) f,
        ] else if (e is AColumn)
          e
        else if (e is AIndex)
          e
    ];
    return alls;
  }

  /// [newName] is for rename table
  String rawCreateTable([AColumn? ps, String? newName]) {
    final alls = [
      for (final e in aPs.where((e) => e.version < 2))
        if (e is APrimaryKey &&

            /// primary key of child self
            /// ```
            /// class A{
            ///   @primaryKey
            ///   final A? child;
            /// }
            /// ```
            /// result [true]
            !e.args.parentClassNames.sublist(1).contains(className)) ...[
          /// default version is 1
          ...e.expanded2().map(
                (e) => e.rawCreate(
                  newName: newName,
                  autoId: e.auto,
                  isId: true,
                  isIds: primaryKeys.length > 1,
                ),
              ),
        ] else if (e is AColumn) ...[
          e.rawCreate(newName: newName),
        ] else if (e is AIndex) ...[
          e.rawCreate(newName: newName),
        ] else if (e is AForeignKey &&

            /// foreign key of child self not primary key
            /// ```
            /// class A{
            ///   @primaryKey
            ///   @ForeignKey(name: 'A')
            ///   final A? child;
            /// }
            /// -> false
            /// ```
            !primaryKeys.map((e) => e.nameDefault).contains(e.nameDefault)) ...[
          ...e.entityParent!.primaryKeys.expand(
            (f) => f.expanded2().map(
                  (k) => k.rawCreate(newName: newName),
                ),
          ),
        ],
      if (primaryKeys.length > 1)
        'PRIMARY KEY (${primaryKeys.expand(
              (e) => e.expanded2(),
            ).map(
              (e) => e.args.fieldNames.join('_').toSnakeCase(),
            ).toList().join(',')})',
      for (final k in foreignKeys)
        k.rawCreateForeign(
          k.entityParent!.primaryKeys
              .expand((e) => e.expanded2())
              .map(
                (m) => m.args.fieldNames.join('_').toSnakeCase(),
              )
              .join(','),
          k.entityParent!.primaryKeys
              .expand((e) => e.expanded2())
              .map((e) => e.args.fieldNames.sublist(1).join('_').toSnakeCase())
              .join(','),
        ),
    ].where((e) => e != null);

    return 'CREATE TABLE IF NOT EXISTS $className${newName ?? ''}(\n\t\t\t${alls.join(',\n\t\t\t')}\n\t)';
  }

  AForeignKey? fKWithoutPK(AForeignKey f) {
    if (primaryKeys.map((e) => e.nameDefault).contains(f.nameDefault)) {
      return null;
    }
    return f;
  }
}

extension on APrimaryKey {
  List<APrimaryKey> expanded2() {
    final lst = <APrimaryKey>[];
    if (entityParent == null) {
      lst.add(this);
    } else {
      lst.addAll([
        ...entityParent!.primaryKeys.expand(
          (e) => e.expanded2(),
        ),
      ]);
    }
    return lst;
  }
}

extension AUpdate on AEntity {
  String get name => className.replaceFirst('\$', '');
  List<String> rawUpdate([AProperty? parent]) {
    if (parent?.dartType.isDartCoreList ?? false) {
      return [];
    }
    if (parent != null) {
      return ['await ${parent.defaultSuffix}.update(database);'];
    }
    return {
      for (final fore in foreignKeys)
        ...fore.entityParent?.rawUpdate(fore) ?? <String>[],
      'return await database.update(\'$className\',toDB(), '
          'where: "${_whereDBUpdate.join(' AND ')}",'
          ' whereArgs: [${_whereArgs.join(' , ')}]);',
    }.toList();
  }
}

extension AInsert on AEntity {
  String rawInsert([AForeignKey? ps]) {
    if (ps?.dartType.isDartCoreList ?? false) {
      return 'await Future.wait(${ps!.nameDefault}.map((e) => e.insert(database)));';
    }
    final fieldsRaw = [
      ...properties()
          // .whereNot((e) => e is AForeignKey && e.dartType.isDartCoreList)
          .map((e) => e.args.fieldNames.join('_').toSnakeCase())
          .toList(),
      for (final e in foreignKeys.where((e) =>
          !e.dartType.isDartCoreList &&
          !primaryKeys.map((e) => e.nameDefault).contains(e.nameDefault)))
        ...e.entityParent!.primaryKeys
            .expand((e) => e.expanded2())
            .map((m) => m.args.fieldNames.join('_').toSnakeCase()),
    ].join(',\n');

    if (ps != null) {
      // final \$${'${className}Id_${ps.nameDefault}'.toCamelCase()} =
      return 'await ${ps.defaultSuffix}.insert(database);';
    }

    final fieldsValue = [
      for (final key in keysNew) key.$2.args.fieldNames.join('?.'),
      for (final item in columns)
        if (item.dartType.toString().contains('DateTime'))
          '${item.defaultSuffix}.millisecondsSinceEpoch'
        else if (item.converter != null)
          'const ${item.converter}().toJson(${item.nameDefault})'
        else
          item.nameDefault,
      for (final k in foreignKeys.where((e) =>
          !e.dartType.isDartCoreList &&
          !primaryKeys.map((e) => e.nameDefault).contains(e.nameDefault)))
        ...k.entityParent!.primaryKeys
            .expand((e) => e.expanded2())
            .map((m) => m.args.fieldNames.join('?.')),
    ];

    return [
      ...foreignKeys.where((e) => !e.dartType.isDartCoreList).map(
            (e) => e.entityParent?.rawInsert(e),
          ),
      '''final \$id = await database.rawInsert(\'\'\'INSERT OR REPLACE INTO $className ($fieldsRaw) 
       VALUES(${List.generate(fieldsValue.length, (index) => '?').join(', ')})\'\'\',
       [
        ${fieldsValue.join(',\n')},
       ]
      );''',
      if (ps == null) 'return \$id;'
    ].join('\n');
  }
}

extension AForeignKeyXYZ on List<AForeignKey> {
  bool duplicated(AForeignKey v) {
    return where((e) => e.typeNotSuffix == v.typeNotSuffix).length > 1;
  }
}

extension AQuery on AEntity {
  String get setClassName => '\$${className}SetArgs';
  String get setClassNameExternal => '${className}SetArgs';
  String get setClassNameExternal2 => '${className}Set';
  String get defaultSelectClass => '\$default';
  List<String> get aFieldNames {
    return [
      ...primaryKeys,
      ...columns,
      ...indices,
      ...foreignKeys,
    ].map((e) => e.nameToDB).toList();
  }

  List<AProperty> get aPs {
    return [
      ...primaryKeys,
      ...foreignKeys,
      ...columns,
      ...indices,
    ];
  }
}

extension AParam on AEntity {
  Parameter get selectArgs => Parameter((p) => p
    ..name = 'select'
    ..type = refer('Set<WhereModel<dynamic, $setClassNameExternal2>>?')
    ..named = true
    ..required = false);
  Parameter get whereArgs => Parameter((p) => p
    ..name = 'where'
    ..type = refer('Set<WhereResult<dynamic, $setClassNameExternal2>>?')
    ..named = true
    ..required = false);
  Parameter get whereOrArgs => Parameter((p) => p
    ..name = 'whereOr'
    ..type = refer('List<Set<WhereResult>>?')
    ..named = true
    ..required = false);
  Parameter get orderByArgs => Parameter((p) => p
    ..name = 'orderBy'
    ..type = refer('Set<OrderBy<$setClassName>>?')
    ..named = true
    ..required = false);
  Parameter get limitArgs => Parameter((p) => p
    ..name = 'limit'
    ..type = refer('int?')
    ..named = true
    ..required = false);
  Parameter get topArgs => Parameter((p) => p
    ..name = 'top'
    ..type = refer('int')
    ..named = true
    ..required = true);
  Parameter get offsetArgs => Parameter((p) => p
    ..name = 'offset'
    ..type = refer('int?')
    ..named = true
    ..required = false);
  Parameter get selectChildArgs => Parameter((p) => p
    ..name = 'childName'
    ..type = refer('String')
    ..defaultTo = Code('\'\'')
    ..named = false
    ..required = false);
  Parameter get selectChildStepArgs => Parameter((p) => p
    ..name = 'childStep'
    ..type = refer('int')
    ..defaultTo = Code('0')
    ..named = false
    ..required = false);
  Parameter get databaseArgs => Parameter((p) => p
    ..name = 'database'
    ..type = refer('Database'));
  Parameter get fromArgs => Parameter((p) => p
    ..name = 'json'
    ..type = refer('Map'));
  Parameter get fromArgsList => Parameter((p) => p
    ..name = 'lst'
    ..type = refer('List<Map>'));
  List<Parameter> get keysRequiredArgs => [
        for (final key in keysNew)
          Parameter((p) => p
            ..name = key.$2.args.fieldNames.join('_').toCamelCase()
            ..type = refer(key.$2.dartType.toString()))
      ];
  List<Parameter> get setOptionalArgs => [
        Parameter(
          (f) => f
            ..name = 'self'
            ..defaultTo = Code('\'\'')
            ..named = true
            ..toSuper = true,
        ),
        Parameter(
          (f) => f
            ..name = 'name'
            ..required = true
            ..named = true
            ..toSuper = true,
        ),
        Parameter(
          (f) => f
            ..name = 'nameCast'
            ..named = true
            ..required = true
            ..toSuper = true,
        ),
        Parameter(
          (f) => f
            ..name = 'model'
            ..named = true
            ..required = true
            ..toSuper = true,
        ),
      ];
  List<Parameter> get setOptionalArgsExternal => [
        Parameter(
          (f) => f
            ..name = 'self'
            ..toThis = true,
        ),
        Parameter(
          (f) => f
            ..name = 'self2'
            ..toThis = true,
        ),
      ];
  List<Parameter> get setOptionalArgsChild => [
        Parameter(
          (f) => f
            ..name = 'self'
            ..defaultTo = Code('\'\'')
            ..named = true
            ..toSuper = true,
        ),
        Parameter(
          (f) => f
            ..name = 'name'
            ..required = true
            ..named = true
            ..toSuper = true,
        ),
        Parameter(
          (f) => f
            ..name = 'nameCast'
            ..named = true
            ..required = true
            ..toSuper = true,
        ),
        Parameter(
          (f) => f
            ..name = 'model'
            ..named = true
            ..required = true
            ..toSuper = true,
        ),
      ];
  List<Parameter> get fieldOptionalQuery => [
        Parameter(
          (f) => f
            ..name = 'name'
            ..named = true
            ..required = true
            ..toThis = true,
        ),
        Parameter(
          (f) => f
            ..name = 'nameCast'
            ..named = true
            ..required = true
            ..toThis = true,
        ),
      ];
}

extension AFields on AEntity {
  List<Field> get setFieldsExternal => [
        Field(
          (f) => f
            ..name = 'self'
            ..modifier = FieldModifier.final$
            ..type = refer('String'),
        ),
        Field(
          (f) => f
            ..name = 'self2'
            ..modifier = FieldModifier.final$
            ..type = refer('String'),
        ),
      ];

  List<Field> get queryFields => [
        Field(
          (f) => f
            ..name = 'name'
            ..modifier = FieldModifier.final$
            ..type = refer('String'),
        ),
        Field(
          (f) => f
            ..name = 'nameCast'
            ..modifier = FieldModifier.final$
            ..type = refer('String'),
        ),
      ];

  List<(String, APrimaryKey)> get keysNew {
    return [
      for (final e in primaryKeys)
        if (

            /// primary key of child self
            /// ```
            /// class A{
            ///   @primaryKey
            ///   final A? child;
            /// }
            /// ```
            /// result [true]
            !e.args.parentClassNames
                .sublist(1)
                .map((e) => e.toCamelCase())
                .contains(className.toCamelCase())) ...[
          ...[
            for (final f in e.expanded2())
              if (!e.dartType.isDartCoreList) (e.nameDefault, f),
          ],
        ],
    ];
  }

  List<String> get _whereArgs {
    return [
      for (final key in keysNew) key.$2.args.fieldNames.join('?.'),
    ];
  }

  List<String> get _whereStaticArgs =>
      _whereArgs.map((e) => e.replaceFirst('this.', '').toCamelCase()).toList();

  List<String> get _whereDB {
    return [
      for (final key in keysNew)
        '${className.toSnakeCase()}.${key.$2.args.fieldNames.join('_')} = ?'
    ];
  }

  List<String> get _whereDBUpdate {
    return [
      for (final key in keysNew)
        '${key.$2.args.fieldNames.join('_').toSnakeCase()} = ?'
    ];
  }
}
