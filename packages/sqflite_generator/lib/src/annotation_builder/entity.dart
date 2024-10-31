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
  final List<AColumn> columns;
  final List<AForeignKey> foreignKeys;
  final List<APrimaryKey> primaryKeys;
  final List<AIndex> indices;
  final String className;
  final String classType;
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
      ...primaryKeys.map((e) => e),
      ...columns.map((e) => e),
      ...indices.map((e) => e),
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
      if (item is AColumn &&
          item.alters.any((e) => e.type == AlterTypeGen.drop)) {
        final version =
            item.alters.firstWhere((e) => e.type == AlterTypeGen.drop).version;

        final raws = <String>[
          for (final item in foreignKeys)
            if (item.entityParent != null) ...[
              "'''${item.entityParent!.rawCreateTable(null, '_new')}'''",
              "'INSERT INTO ${item.entityParent!.className}_new(${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')})SELECT ${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')} FROM ${item.entityParent!.className};'",
              "'DROP TABLE ${item.entityParent!.className};'",
              // "'ALTER TABLE ${item.entityParent!.className}_new RENAME TO ${item.entityParent!.className};'",
            ],
          "'''${rawCreateTable(item, '_new')}'''",
          "'INSERT INTO ${className}_new(${rawCreateTablePS(item).map((e) => e.nameToDB).join(',')})SELECT ${rawCreateTablePS(item).map((e) => e.nameToDB).join(',')} FROM $className;'",
          "'DROP TABLE $className;'",
          "'ALTER TABLE ${className}_new RENAME TO $className;'",
          for (final item in foreignKeys)
            if (item.entityParent != null) ...[
              "${item.entityParent!.extensionName}.createTable",
              "'INSERT INTO ${item.entityParent!.className}(${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')})SELECT ${item.entityParent!.rawCreateTablePS(null).map((e) => e.nameToDB).join(',')} FROM ${item.entityParent!.className}_new;'",
              "'DROP TABLE ${item.entityParent!.className}_new;'",
            ],
        ];

        if (map.containsKey(version)) {
          map[version]!.addAll(raws);
        } else {
          map[version] = raws;
        }
      }
    }
    return map;
  }

  String get rawFromDB {
    return [
      aPs.map(
        (e) {
          if (e is AForeignKey) {
            if (!e.dartType.isDartCoreList) {
              return '${e.nameDefault}:${e.entityParent?.className}.fromDB(json,[])';
            }
            return '${e.nameDefault}: lst.map((e)=>${e.entityParent?.className}.fromDB(e,[])).toList()';
          }
          if (e.rawFromDB) {
            return '${e.nameDefault}: ${e.dartType}.fromDB(json,${e is AForeignKey ? e.subSelect(foreignKeys.duplicated(e)) : '\'\''})';
          }
          if (e.dartType.toString().contains('DateTime')) {
            return '${e.nameDefault}: DateTime.fromMillisecondsSinceEpoch(json[\'\${childName}${e.nameFromDB}\'] as int? ?? -1,)';
          }
          if (e.dartType.isDartCoreBool) {
            return '${e.nameDefault}: (json[\'${e.nameFromDB}\'] as int?) == 1';
          }
          if (e is AColumn && e.converter != null) {
            return '${e.nameDefault}: const ${e.converter}().fromJson(json[\'\${childName}${e.nameFromDB}\'] as String?)';
          }
          return '${e.nameDefault}: json[\'\${childName}${e.nameFromDB}\'] as ${e.dartType}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawToDB {
    return [
      aPs
          .map(
            (e) {
              if (e is AForeignKey) {
                if (!e.dartType.isDartCoreList) {
                  return '\'${e.nameToDB}\': ${e.defaultSuffix}.${e.entityParent?.primaryKeys.firstOrNull?.nameDefault}';
                }
                return '';
              }
              if (e.dartType.toString().contains('DateTime')) {
                return '\'${e.nameToDB}\': this.${e.defaultSuffix}.millisecondsSinceEpoch';
              }
              if (e.dartType.isDartCoreBool) {
                return '\'${e.nameDefault}\': (this.${e.nameDefault} ?? false) ? 1 : 0';
              }
              if (e is AColumn && e.converter != null) {
                return '\'${e.nameToDB}\': const ${e.converter}().toJson(this.${e.nameDefault})';
              }
              return '\'${e.nameToDB}\':this.${e.nameDefault}';
            },
          )
          .where((e) => e.isNotEmpty)
          .join(','),
      ','
    ].join();
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
      ...aFores,
      '\${whereStr.isNotEmpty ? whereStr : \'\'}',
      "\${(orderBy ?? {}).isNotEmpty ? 'ORDER BY \${(orderBy ?? {}).map((e) => '\${e.field.field} \${e.type}').join(',')}' : ''}",
      "\${limit != null ? 'LIMIT \$limit' : ''}",
      "\${offset != null ? 'OFFSET \$offset' : ''}",
      "''';",
      "if (kDebugMode) { print('get all $className \$sql'); }",
      'final mapList = (await database.rawQuery(sql) as List<Map>);',
      'return mapList.groupBy(((m) => m[$extensionName.${aPsAll.first.name}.nameCast]))'
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
      ...aFores,
      'WHERE ${_whereDB.join(' AND ')}',
      '\'\'\',',
      _whereStaticArgs,
      ') as List<Map>);',
      'return res.isNotEmpty? $classType.fromDB(res.first,res) : null;'
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

  const AEntity._({
    required this.columns,
    required this.foreignKeys,
    required this.primaryKeys,
    required this.indices,
    required this.className,
    required this.classType,
  });

  static AEntity? of(ClassElement element, [int step = 0]) {
    if (step > 5) return null;
    return AEntity._fromElement(element, step);
  }

  factory AEntity._fromElement(ClassElement element, int step) {
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
    final indies = AIndexX.fields(fields, element.displayName, step + 1);
    final fores =
        AForeignKeyX.fields(step + 1, fields, element.displayName, ss);

    final primaries = APrimaryKeyX.fields(
      fields,
      element.displayName,
      step + 1,
      fores,
    );

    return AEntity._(
      className: element.displayName.replaceFirst('\$', ''),
      classType: element.displayName,
      columns: AColumnX.fields(
        step + 1,
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

extension AEntityBase on AEntity {
  /// `dart
  /// class A{
  ///   @primaryKey
  ///   final B? child;
  /// }
  ///
  /// class B{
  ///   @primaryKey
  ///   final int? id;
  ///   @primaryKey
  ///   final int? id2;
  /// }
  /// `
  List<KeyModel> treePrimaryKeys({
    String self = '',
    APrimaryKey? selfKey,
  }) {
    return [
      for (final item in primaryKeys)
        if (item.entityParent != null)
          KeyModel(
            self: selfKey ?? item,
            children: [
              ...item.entityParent!.treePrimaryKeys(
                self: '${self}_${item.entityParent!.className}'.replaceFirst(
                  RegExp('^_'),
                  '',
                ),
                selfKey: selfKey ?? item,
              ),
            ],
            property: item,
          )
        else
          KeyModel(
            self: selfKey ?? item,
            nameSelf: '${self}_${item.nameToDB}'.replaceFirst(RegExp('^_'), ''),
            property: item,
          ),
    ];
  }

  List<KeyModel> treePrimaryKeysWithoutFore({
    String self = '',
  }) {
    return [
      for (final item in primaryKeys.where(
        (e) => !foreignKeys.map((e) => e.nameDefault).contains(e.nameDefault),
      ))
        if (item.entityParent != null)
          KeyModel(
            children: [
              ...item.entityParent!.treePrimaryKeys(
                self: '${self}_${item.entityParent!.className}'.replaceFirst(
                  RegExp('^_'),
                  '',
                ),
              ),
            ],
            property: item,
          )
        else
          KeyModel(
            nameSelf: '${self}_${item.nameToDB}'.replaceFirst(RegExp('^_'), ''),
            property: item,
          ),
    ];
  }

  /// `dart
  /// class A{
  ///   @primaryKey
  ///   final B? child;
  /// }
  ///
  /// class B{
  ///   @primaryKey
  ///   final int? id;
  ///   @primaryKey
  ///   final int? id2;
  /// }
  /// `
  /// result [b_id, b_id2]
  List<KeyModel> expandedPrimaryKeys(
      [List<KeyModel>? child, String self = '']) {
    final lst = <KeyModel>[];
    for (final item in child ?? treePrimaryKeys(self: self)) {
      if (item.name != null) lst.add(item);
      if (item.children != null && item.children!.isNotEmpty) {
        lst.addAll(expandedPrimaryKeys(item.children));
      }
    }
    return lst;
  }

  List<KeyModel> expandedPrimaryKeysWithoutFore(
      [List<KeyModel>? child, String self = '']) {
    final lst = <KeyModel>[];
    for (final item in child ?? treePrimaryKeys(self: self)) {
      if (item.name != null) lst.add(item);
      if (item.children != null && item.children!.isNotEmpty) {
        lst.addAll(expandedPrimaryKeysWithoutFore(item.children));
      }
    }
    return lst;
  }

  List<KeyModel> expandedColumns() {
    final lst = <KeyModel>[];
    for (final item in columns) {
      lst.add(KeyModel(property: item, nameSelf: item.nameToDB));
    }
    return lst;
  }

  List<KeyModel> expandedIndices() {
    final lst = <KeyModel>[];
    for (final item in indices) {
      lst.add(KeyModel(property: item, nameSelf: item.nameToDB));
    }
    return lst;
  }

  /// `dart
  /// class A{
  ///   @primaryKey
  ///   final B? child;
  ///   @ForeignKey(name: 'B')
  ///   @primaryKey
  ///   final B? parent;
  ///   @ForeignKey(name: 'B')
  ///   final B? child;
  /// }
  ///
  /// class B{
  ///   @primaryKey
  ///   final int? id;
  ///   @primaryKey
  ///   final int? id2;
  /// }
  /// `
  /// result [child_b_id, child_b_id2]
  List<KeyModel> expandedForeignKeysWithoutPri() {
    final lst = <KeyModel>[];
    for (final item in foreignKeys) {
      if (!treePrimaryKeys()
          .map((e) => e.property.nameDefault)
          .contains(item.nameDefault)) {
        if (item.entityParent?.className == className) {
          lst.addAll(expandedPrimaryKeys(null, item.nameDefault));
        } else {
          lst.addAll(
              item.entityParent?.expandedPrimaryKeys(null, item.nameDefault) ??
                  []);
        }
      }
    }
    return lst;
  }

  /// `dart
  /// class A{
  ///   @primaryKey
  ///   final B? child;
  ///   @ForeignKey(name: 'B')
  ///   @primaryKey
  ///   final B? parent;
  ///   @ForeignKey(name: 'B')
  ///   final B? child;
  /// }
  ///
  /// class B{
  ///   @primaryKey
  ///   final int? id;
  ///   @primaryKey
  ///   final int? id2;
  /// }
  /// `
  /// result [child_b_id, child_b_id2,parent_b_id,parent_b_id2]
  List<KeyModel> expandedForeignKeysAll() {
    final lst = <KeyModel>[];
    for (final item in foreignKeys) {
      if (item.entityParent?.className == className) {
        lst.add(
          KeyModel(
            property: item,
            nameSelf: item.nameDefault,
            children: expandedPrimaryKeys(null, item.nameDefault),
            selfIs: true,
          ),
        );
      } else {
        lst.add(
          KeyModel(
            property: item,
            nameSelf: item.nameDefault,
            children: item.entityParent
                    ?.expandedPrimaryKeys(null, item.nameDefault) ??
                [],
          ),
        );
      }
    }
    return lst;
  }

  List<KeyModel> expandedForeignKeysAllForSelect() {
    final lst = <KeyModel>[];
    final self = foreignKeys
        .firstWhereOrNull((e) => e.entityParent?.className == className);
    if (self != null) {
      lst.add(
        KeyModel(
          property: self,
          nameSelf: self.nameDefault,
          children: expandedPrimaryKeysWithoutFore(null, self.nameDefault),
          selfIs: true,
        ),
      );
    }
    for (final item in foreignKeys) {
      if (item.entityParent?.className == className) {
        lst.add(
          KeyModel(
            property: item,
            nameSelf: item.nameDefault,
            children: expandedPrimaryKeys(null, item.nameDefault),
            selfIs: true,
            nameSelfGen: item.nameDefault,
          ),
        );
      } else {
        lst.add(
          KeyModel(
            property: item,
            nameSelf: item.nameDefault,
            children: item.entityParent
                    ?.expandedPrimaryKeys(null, item.nameDefault) ??
                [],
          ),
        );
      }
    }
    return lst;
  }

  /// PRIMARY KEY(product_id, client_id)
  String rawCreatePrimaryKeys() {
    final mKeys = expandedPrimaryKeys();
    if (mKeys.length < 2) return '';
    final keys = mKeys.map((e) => e.name).join(', ');
    return 'PRIMARY KEY($keys)';
  }

  List<KeyModel> get aMPall => [
        ...expandedPrimaryKeysWithoutFore(),
        ...expandedColumns(),
        ...expandedIndices(),
        ...expandedForeignKeysAllForSelect(),
      ];

  /// [newName] is for rename table
  String rawCreateTable([AColumn? ps, String? newName]) {
    final all = [
      /// primary keys
      ...expandedPrimaryKeys().map(
        (e) {
          return e.property.rawCreate(
            e.name,
            autoId: e.self?.auto ?? false,
            isId: true,
            isIds: primaryKeys.length > 1,
          );
        },
      ),

      /// columns
      ...expandedColumns()
          .where(
              (e) => !e.property.alters.any((e) => e.type == AlterTypeGen.add))
          .where((e) => e.property.nameDefault != ps?.nameDefault)
          .map((e) => e.property.rawCreate(e.name)),

      /// indices
      ...expandedIndices().map((e) => e.property.rawCreate(e.name)),

      /// foreign keys
      ...expandedForeignKeysWithoutPri()
          .where((e) => !e.property.dartType.isDartCoreList)
          .map((e) => e.property.rawCreate(e.name)),

      /// primary keys
      /// PRIMARY KEY(product_id, client_id)
      rawCreatePrimaryKeys(),

      /// foreign keys
      if (newName == null)
        ...expandedForeignKeysAll().map((e) {
          final fore = e.property as AForeignKey;
          return fore.rawCreateForeign(
              e.children?.expanded().map((e) => e.name).join(',') ?? '',
              e.children
                      ?.expandedDefaultKeyName(e.selfIs)
                      .map((f) => e.selfIs
                          ? f.property.nameFromDB
                          : f.property.nameDefault)
                      .join(',') ??
                  '');
          // return e.property.rawCreateForeign(e.name);
        }),
      // if (newName == null) ...foreignKeys.map((e) => e.rawCreateForeign),
    ].where((e) => e != null && e.isNotEmpty);
    return 'CREATE TABLE IF NOT EXISTS $className${newName ?? ''}(\n\t\t\t${all.join(',\n\t\t\t')}\n\t)';
  }

  List<KeyModel> primaryKeysForDebug({String self = ''}) {
    return [
      for (final item in primaryKeys)
        if (item.entityParent != null)
          KeyModel(
            children: [
              ...item.entityParent!.primaryKeysForDebug(
                self: '${self}_${item.entityParent!.className}'.replaceFirst(
                  RegExp('^_'),
                  '',
                ),
              ),
            ],
            property: item,
          )
        else
          KeyModel(
            nameSelf: '${self}_${item.nameToDB}'
                .replaceFirst(RegExp('^_'), '')
                .toSnakeCase(),
            property: item,
          ),
    ];
  }

  String rawDebug([AColumn? ps, String? newName]) {
    final all = [...aMPall].map((e) =>
        '${e.nameSelfGen ?? ''} ${e.children?.expanded().map((e) => e.name).join(',') ?? e.property.nameFromDB}');
    return all.join(',\n');
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
    final fieldsRaw = aPs
        .whereNot((e) => e is AForeignKey && e.dartType.isDartCoreList)
        .map((e) => e.nameToDB)
        .join(',\n');

    if (ps != null) {
      return 'final \$${'${className}Id_${ps.nameDefault}'.toCamelCase()} = await ${ps.defaultSuffix}.insert(database);';
    }

    final fieldsValue = aPs.map((e) {
      if (e is AForeignKey) {
        if (e.dartType.isDartCoreList) {
          return null;
        }
        return '\$${'${e.entityParent?.className}Id_${e.nameDefault}'.toCamelCase()}';
      }
      if (ps != null) return '$ps.${e.nameDefault}';
      if (e is AColumn && e.converter != null) {
        print('======= ${e.converter} ${e.nameDefault} ${e.className}');
        if (e.dartType.toString().contains('DateTime')) {
          return 'this.${e.defaultSuffix}.millisecondsSinceEpoch';
        }
        return 'const ${e.converter}().toJson(this.${e.nameDefault})';
      }
      return 'this.${e.nameDefault}';
    }).where((e) => e != null);

    return [
      ...foreignKeys.where((e) => !e.dartType.isDartCoreList).map(
            (e) => e.entityParent?.rawInsert(e),
          ),
      '''final \$id = await database.rawInsert(\'\'\'INSERT OR REPLACE INTO $className ($fieldsRaw) 
       VALUES(${List.generate(fieldsValue.length, (index) => '?').join(', ')})\'\'\',
       [
        ${fieldsValue.join(',')},
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
  String get defaultSelectClass => '\$default';
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
        if (e.dartType.isDartCoreList)
          () {
            final property = e.entityParent?.aPs.firstWhereOrNull(
                (e) => e.dartType.toString().$rq == className);
            return property != null
                ? ' LEFT JOIN ${e.entityParent?.name} ${'${e.nameDefault}_${e.joinAsStr(foreignKeys.duplicated(e)).toSnakeCase()}'}'
                    ' ON ${'${e.nameDefault}_${e.joinAsStr(foreignKeys.duplicated(e)).toSnakeCase()}'}.${property.nameToDB}'
                    ' = ${className.toSnakeCase()}.${primaryKeys.first.nameToDB}'
                : '';
          }()
        else
          ' LEFT JOIN ${e.entityParent?.name} ${e.joinAsStr(foreignKeys.duplicated(e))}'
              ' ON '
              '${e.entityParent?.primaryKeys.map((f) => '${e.joinAsStr(foreignKeys.duplicated(e))}.'
                  // TODO(hodoan): aforeignkeys
                  '${() {
                    final aPsChild = e.entityParent?.aPs ?? <AProperty>[];
                    final fChild = aPsChild.firstWhereOrNull(
                            (e) => e.nameDefault == f.nameDefault) ??
                        f;
                    return fChild.nameToDB;
                  }()} '
                  '= ${className.toSnakeCase()}.${e.name?.toSnakeCase()}').join(' AND ')}'
      // '${e.joinAsStr(foreignKeys.duplicated(e))}.${e.entityParent?.primaryKeys.first.nameToDB}'
      // ' = ${className.toSnakeCase()}.${e.name?.toSnakeCase()}'
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

  List<({String name, String? field, AProperty p, String nameCast})>
      get aPsAll {
    return [
      for (final item in aPs)
        if (item is AForeignKey) ...[
          for (final sItem in item.entityParent?.aPs ?? <AProperty>[])
            if (!sItem.dartType.toString().contains(className))
              () {
                return (sItem is AForeignKey)
                    ? (
                        name: '${() {
                          if (sItem.className.toLowerCase() ==
                              item.nameDefault.toLowerCase()) {
                            return sItem.className;
                          }
                          return '${sItem.className}_${item.nameDefault}';
                        }()}_${sItem.nameDefault}'
                            .toCamelCase(),
                        p: sItem,
                        field: sItem.className.contains(className)
                            ? item.nameDefault.toSnakeCase()
                            : null,
                        nameCast: sItem.nameFromDB,
                      )
                    : (
                        name: '${() {
                          if (sItem.className.toLowerCase() ==
                              item.nameDefault.toLowerCase()) {
                            return sItem.className;
                          }
                          return '${sItem.className}_${item.nameDefault}';
                        }()}_${sItem.nameDefault}'
                            .toCamelCase(),
                        p: sItem,
                        field: sItem.className.contains(className)
                            ? item.nameDefault.toSnakeCase()
                            : null,
                        nameCast: sItem.nameFromDB,
                      );
              }()
        ] else
          (
            name: item.nameDefault,
            p: item,
            field: null,
            nameCast: item.nameFromDB,
          ),
    ];
  }

  List<({String name, String? field, AProperty p})> get aPsPri {
    return [
      for (final item in aPs)
        if (item is APrimaryKey) (name: item.nameDefault, p: item, field: null),
    ];
  }

  List<String> get $check {
    return [for (final item in aPsAll) '${item.name} == true'];
  }
}

extension AParam on AEntity {
  Parameter get selectArgs => Parameter((p) => p
    ..name = 'select'
    ..type = refer('Set<$setClassName>?')
    ..named = true
    ..required = false);
  Parameter get whereArgs => Parameter((p) => p
    ..name = 'where'
    ..type = refer('Set<WhereResult>?')
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
        for (final key in keys)
          if (key is AForeignKey)
            for (final k in key.entityParent?.keys ?? <AProperty>[])
              if (k is AForeignKey)
                for (final sk in key.entityParent?.keys ?? <AProperty>[])
                  Parameter((p) => p
                    ..name = '${k.nameDefault}_${sk.nameDefault}'.toCamelCase()
                    ..type = refer(sk.dartType.toString()))
              else
                Parameter((p) => p
                  ..name = '${key.nameDefault}_${k.nameDefault}'.toCamelCase()
                  ..type = refer(k.dartType.toString()))
          else
            Parameter((p) => p
              ..name = key.nameDefault.toCamelCase()
              ..type = refer(key.dartType.toString()))
      ];
  List<Parameter> get setOptionalArgs => [
        Parameter(
          (f) => f
            ..name = 'self'
            ..defaultTo = Code('\'\'')
            ..named = true
            ..toThis = true,
        ),
        Parameter(
          (f) => f
            ..name = 'name'
            ..required = true
            ..named = true
            ..toThis = true,
        ),
        Parameter(
          (f) => f
            ..name = 'nameCast'
            ..named = true
            ..required = true
            ..toThis = true,
        ),
        Parameter(
          (f) => f
            ..name = 'model'
            ..named = true
            ..required = true
            ..toThis = true,
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
  List<Field> get setFields => [
        Field(
          (f) => f
            ..name = 'self'
            ..modifier = FieldModifier.final$
            ..type = refer('String'),
        ),
        Field(
          (f) => f
            ..name = 'name'
            ..modifier = FieldModifier.final$
            ..type = refer('String'),
        ),
        Field(
          (f) => f
            ..name = 'model'
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

  List<Field> get selectFields => [
        for (final item in aPsAll)
          Field(
            (f) => f
              ..name = item.name
              ..modifier = FieldModifier.final$
              ..type = refer('bool?'),
          )
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
          for (final item in key.entityParent?.keys ?? <AProperty>[])
            '${key.defaultSuffix}.${item.nameDefault}'
        else
          'this.${key.nameDefault}'
    ];
  }

  List<String> get _whereStaticArgs =>
      _whereArgs.map((e) => e.replaceFirst('this.', '').toCamelCase()).toList();

  List<String> get _whereDB {
    return [
      for (final key in keys) '${className.toSnakeCase()}.${key.nameToDB} = ?'
    ];
  }

  List<String> get _whereDBUpdate {
    return [for (final key in keys) '${key.nameToDB} = ?'];
  }
}

class KeyModel {
  final String? name;
  final List<KeyModel>? children;
  final AProperty property;
  final APrimaryKey? self;
  final bool selfIs;
  final String? nameSelfGen;

  KeyModel({
    this.nameSelfGen,
    String? nameSelf,
    this.children,
    required this.property,
    this.self,
    this.selfIs = false,
  }) : name = nameSelf?.toSnakeCase();

  @override
  String toString() => '$name $children $property';
}

extension KeyModelX on List<KeyModel> {
  List<KeyModel> expanded() {
    return [
      for (final item in this)
        if (item.children == null || item.children!.isEmpty)
          item
        else
          ...item.children!.expanded(),
    ];
  }

  List<KeyModel> expandedDefaultKeyName(bool selfIs) {
    return [
      for (final item in this)
        if (item.children != null &&
            item.children!.isNotEmpty &&
            selfIs &&
            item.children!.first.name != null)
          item
        else if (item.children == null || item.children!.isEmpty)
          item
        else
          ...item.children!.expanded(),
    ];
  }
}
