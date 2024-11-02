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
      aPss(false).map(
        (e) {
          if (e.property is AForeignKey) {
            if (!e.property.dartType.isDartCoreList) {
              return '${e.property.nameDefault}:${(e.property as AForeignKey).entityParent?.className}.fromDB(json,[])';
            }
            return '${e.property.nameDefault}: lst.map((e)=>${(e.property as AForeignKey).entityParent?.className}.fromDB(e,[])).toList()';
          }
          if (e.property is APrimaryKey &&
              (e.property as APrimaryKey).entityParent != null) {
            return '${e.property.nameDefault}: ${e.property.dartType}'
                '.fromDB(json,${e is AForeignKey ? (e.property as AForeignKey).subSelect(foreignKeys.duplicated(e.property as AForeignKey)) : '\'\''})';
          }
          if (e.property.rawFromDB) {
            return '${e.property.nameDefault}: ${e.property.dartType}'
                '.fromDB(json,${e is AForeignKey ? (e.property as AForeignKey).subSelect(foreignKeys.duplicated(e.property as AForeignKey)) : '\'\''})';
          }
          if (e.property.dartType.toString().contains('DateTime')) {
            return '${e.property.nameDefault}: DateTime.fromMillisecondsSinceEpoch(json[\'\${childName}${e.property.nameFromDB}\'] as int? ?? -1,)';
          }
          if (e.property.dartType.isDartCoreBool) {
            return '${e.property.nameDefault}: (json[\'${e.property.nameFromDB}\'] as int?) == 1';
          }
          if (e.property is AColumn &&
              (e.property as AColumn).converter != null) {
            return '${e.property.nameDefault}: const ${(e.property as AColumn).converter}().fromJson(json[\'\${childName}${e.property.nameFromDB}\'] as String?)';
          }

          return '${e.property.nameDefault}: json[\'\${childName}${e.property.nameFromDB}\'] as ${e.property.dartType}';
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
    List<String> parentClassName, [
    int step = 0,
  ]) {
    if (step > 9) return null;
    return AEntity._fromElement(element, parentClassName, step);
  }

  factory AEntity._fromElement(
    ClassElement element,
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
      element.displayName,
      parentClassName,
      step + 1,
    );
    final fores = AForeignKeyX.fields(
      step + 1,
      fields,
      element.displayName,
      parentClassName,
      ss,
    );

    final primaries = APrimaryKeyX.fields(
      fields,
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
  List<KeyModel> _treePrimaryKeys({
    String self = '',
    APrimaryKey? selfKey,
  }) {
    return [
      for (final item in primaryKeys)
        KeyModel._ofPrimaryKey(
          item,
          self: self,
          selfKey: selfKey,
        )
    ];
  }

  // List<KeyModel> _treePrimaryKeysWithoutFore({
  //   String self = '',
  // }) {
  //   return [
  //     for (final item in primaryKeys.where(
  //       (e) => !foreignKeys.map((e) => e.nameDefault).contains(e.nameDefault),
  //     ))
  //       KeyModel.ofPrimaryKey(
  //         item,
  //         self: self,
  //         withoutFore: true,
  //       )
  //   ];
  // }

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
  List<KeyModel> _expandedPrimaryKeys(
      [List<KeyModel>? child, String self = '']) {
    final lst = <KeyModel>[];
    for (final item in child ?? _treePrimaryKeys(self: self)) {
      if (item.name != null) lst.add(item);
      if (item.children != null && item.children!.isNotEmpty) {
        lst.addAll(_expandedPrimaryKeys(item.children));
      }
    }
    return lst;
  }

  List<KeyModel> _expandedPrimaryKeysWithoutFore() {
    final lst = <KeyModel>[];
    final items = _treePrimaryKeys();
    for (final item in items) {
      if (item.name == item.property.nameToDB) lst.add(item);
      if (item.children != null && item.children!.isNotEmpty) {
        //   lst.addAll(_expandedPrimaryKeysWithoutFore());
      }
    }
    return lst;
  }

  /// self columns
  /// ```dart
  /// class A{
  ///   @Column
  ///   final int? id;
  /// }
  /// ```
  /// result [id]
  List<KeyModel> _expandedColumns([AProperty? propertyParent]) {
    final lst = <KeyModel>[];
    for (final item in columns) {
      lst.add(KeyModel._columnOrIndex(
        item,
        isParent: propertyParent == null,
        className: propertyParent?.className ?? className,
        propertyParent: propertyParent,
      ));
    }
    return lst;
  }

  /// self indices
  /// ```dart
  /// class A{
  ///   @Index
  ///   final int? id;
  /// }
  /// ```
  /// result [id]
  List<KeyModel> _expandedIndices([AProperty? propertyParent]) {
    final lst = <KeyModel>[];
    for (final item in indices) {
      lst.add(KeyModel._columnOrIndex(
        item,
        isParent: propertyParent == null,
        className: propertyParent?.className ?? className,
        propertyParent: propertyParent,
      ));
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
  List<KeyModel> _expandedForeignKeysWithoutPri() {
    final lst = <KeyModel>[];
    for (final item in foreignKeys) {
      if (!_treePrimaryKeys()
          .map((e) => e.property.nameDefault)
          .contains(item.nameDefault)) {
        if (item.entityParent?.className == className) {
          lst.addAll(_expandedPrimaryKeys(null, item.nameDefault));
        } else {
          lst.addAll(
              item.entityParent?._expandedPrimaryKeys(null, item.nameDefault) ??
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
  List<KeyModel> _expandedForeignKeysAll() {
    final lst = <KeyModel>[];
    for (final item in foreignKeys) {
      lst.add(
        KeyModel._foreignKey(
          item,
          children: _expandedPrimaryKeys(null, item.nameDefault),
          className: className,
        ),
      );
    }
    return lst;
  }

  /// using for gen select args
  // List<KeyModel> _expandedForeignKeysAllForSelect() {
  //   final lst = <KeyModel>[];
  //   final self = KeyModel.ofForeignKeys(
  //     foreignKeys,
  //     className,
  //     children: _expandedPrimaryKeysWithoutFore,
  //   );
  //   if (self != null) {
  //     lst.add(self);
  //   }
  //   for (final item in foreignKeys) {
  //     lst.add(
  //       KeyModel.foreignKey(
  //         item,
  //         className: className,
  //         children: _expandedPrimaryKeys(null, item.nameDefault),
  //       ),
  //     );
  //     if (!(item.entityParent?.className == className)) {
  //       lst.addAll([
  //         for (final e
  //             in item.entityParent?._expandedColumns(className) ?? <KeyModel>[])
  //           KeyModel.cloneOfChild(e),
  //       ]);
  //       lst.addAll([
  //         for (final e
  //             in item.entityParent?._expandedIndices(className) ?? <KeyModel>[])
  //           KeyModel.cloneOfChild(e),
  //       ]);
  //     }
  //   }
  //   return lst;
  // }

  List<KeyModel> aMPall([AProperty? parent, int step = 0]) => step > 2
      ? []
      : [
          ..._expandedPrimaryKeysWithoutFore(),
          ..._expandedColumns(parent),
          ..._expandedIndices(parent),
          for (final item in foreignKeys)
            if (item.entityParent != null)
              ...item.entityParent!.aMPall(item, step + 1),

          // ...expandedForeignKeysAllForSelect(),
        ];

  @Deprecated('not use')
  List<KeyModelSet> get aMPallSet {
    // TODO(hodoan): aMPallSet primary key
    final lst = [
      for (final e in aMPall())
        if (e.children?.expanded() != null) ...[
          for (final f in e.children!.expanded()) KeyModelSet._ofPrimaryKey(f),
        ] else
          KeyModelSet._ofColumnOrIndex(e),
      // for (final e in aMPall)
      //   if (e.children?.expanded() != null) ...[
      //     for (final f in e.children!.expanded())
      //       KeyModelSet(
      //         keyModel: f,
      //         name: f.name ?? '-------',
      //         property: e.property,
      //         model: e.nameSelfGen ?? e.nameGen,
      //         self: e.selfIs ? className.toSnakeCase() : null,
      //       )
      //   ] else
      //     KeyModelSet(
      //       keyModel: e,
      //       name: e.this$ ? e.property.nameToDB : e.property.nameFromDB,
      //       property: e.property,
      //       model: e.nameSelfGen ?? e.nameGen ?? className.toSnakeCase(),
      //       self: e.this$ ? className.toSnakeCase() : null,
      //     )
    ];
    // .where(
    //   (e) => !(e.self == null && e.name == e.nameCast),
    // )
    // .where(
    //   (e) => !(e.model == null && e.name == e.nameCast),
    // )
    // .toList();
    // final set = <String, KeyModelSet>{};
    // for (final e in lst) {
    //   set[e.fieldName] = e;
    // }
    // return set.values.toList();
    return lst;
  }

  List<(List<String>, AProperty)> allss([List<String> parents = const []]) {
    final pp = [
      if (parents.isEmpty) className,
      ...parents,
    ];
    if (parentClassName.length > (9 / 3) - 2) return [];
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
            !e.parentClassName
                .map((e) => e.toCamelCase())
                .contains(className.toCamelCase())) ...[
          ...[
            for (final f in e.expanded2())

              /// primary key of child self not foreign key && type entity
              if (f.entityParent == null && f.parentClassName.isEmpty)
                ([...pp, f.nameToDB], f)
              else if (f.entityParent == null && f.parentClassName.length == 1
                  // &&
                  // pp.length == 1
                  )
                () {
                  return (
                    [
                      ...pp,
                      ...f.parentClassName,
                      f.nameToDB,
                    ],
                    f,
                  );
                }()
            // else if (f.entityParent == null && f.parentClassName.length == 2
            //     // &&
            //     // pp.length == 1
            //     )
            //   () {
            //     return (
            //       [
            //         ...pp,
            //         ...f.parentClassName,
            //         f.nameToDB,
            //       ],
            //       f,
            //     );
            //   }()
          ],
        ] else if (e is AColumn) ...[
          ([...pp, e.nameDefault], e),
        ] else if (e is AIndex) ...[
          ([...pp, e.nameDefault], e),
        ] else if (e is AForeignKey)
          ...(e.entityParent?.allss([...pp, e.nameDefault]) ??
              <(List<String>, AProperty)>[]),
    ];
    return alls;
  }

  /// [newName] is for rename table
  String rawCreateTable([AColumn? ps, String? newName]) {
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
            !e.parentClassName.contains(className)) ...[
          ...e.expanded2().map(
                (e) => e.rawCreate(
                  e.fieldNameFull,
                  // e.name2 ?? e.name,
                  autoId: e.auto,
                  isId: true,
                  isIds: primaryKeys.length > 1,
                ),
              ),
        ] else if (e is AColumn) ...[
          e.rawCreate(e.name),
        ] else if (e is AIndex) ...[
          e.rawCreate(e.name),
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
                  (k) => k.rawCreate(
                    k.fieldNameFull2(e.nameDefault),
                  ),
                ),
          ),
        ],
      if (primaryKeys.length > 1)
        'PRIMARY KEY ${primaryKeys.expand(
              (e) => e.expanded2(),
            ).map(
              (e) => e.fieldNameFull,
            ).toList()}',
      for (final k in foreignKeys)
        k.rawCreateForeign(
          k.entityParent!.primaryKeys
              .expand((e) => e.expanded2())
              .map(
                (m) => primaryKeys
                        .map((e) => e.nameDefault)
                        .contains(k.nameDefault)
                    ? m.fieldNameFull
                    : m.fieldNameFull2(k.nameDefault),
              )
              .join(','),
          k.entityParent!.primaryKeys
              .expand((e) => e.expanded2())
              .map((e) => e.fieldNameFullForForeign)
              .join(','),
        ),
    ];

    return 'CREATE TABLE IF NOT EXISTS $className${newName ?? ''}(\n\t\t\t${alls.join(',\n\t\t\t')}\n\t)';
  }

  /// using parent call child
  List<APkEx> aPssNoKey(String fieldName) {
    return [
      for (final e in aPs)
        if (e is AColumn || e is AIndex)
          APkEx(
            parentClassName: parentClassName,
            pk: null,
            property: e,
            nameCast: e.nameFromDB,
            name: '${fieldName}_${e.nameToDB}'.toSnakeCase(),
            model: className,
            children: [],
          )
      // else if (e is AForeignKey)
      //   ...() {
      //     final f2 = fKWithoutPK(e);
      //     if (f2 == null) {
      //       // if (f2.className == className) {
      //       final lst = e.entityParent?.primaryKeys
      //               .map((f) => f.expanded(e.nameDefault)) ??
      //           [];
      //       final lst2 = lst.expand((e) => e.expanded()).toList();
      //       return lst2.where((e) => e.pk?.entityParent == null).toList();
      //     }
      //     // Fore && PrimaryKey
      //     return <APkEx>[];
      //   }()
    ];
  }

  List<APkEx> aPss([bool primaryKeyOnly = true]) {
    return [
      for (final e in aPs)
        if (e is AColumn || e is AIndex)
          APkEx(
            parentClassName: parentClassName,
            pk: null,
            property: e,
            nameSelf: e.nameToDB,
            nameCast: e.nameFromDB,
            name: e.nameToDB,
            model: className,
            children: [],
          )
        else if (e is APrimaryKey)
          ...() {
            if (e.entityParent == null) {
              return [
                APkEx(
                  parentClassName: parentClassName,
                  pk: e,
                  property: e,
                  nameCast: e.nameFromDB,
                  name: e.nameToDB,
                  model: className,
                  children: [],
                ),
              ];
            }
            final lst = e.entityParent!.primaryKeys
                .map((f) => f.expanded(null, e.nameDefault));
            final lst2 = lst.expand((e) => e.expanded()).toList();
            return lst2;
          }()
        else
          ...() {
            final f = e as AForeignKey;
            final f2 = fKWithoutPK(f);
            if (f2 != null) {
              // if (f2.className == className) {
              final lst = e.entityParent?.primaryKeys
                      .map((f) => f.expanded(f2, e.nameDefault)) ??
                  [];
              final lst2 = lst.expand((e) => e.expanded()).toList();
              if (!primaryKeyOnly) {
                return lst2;
              }
              return [
                ...lst2,
                ...(e.entityParent?.aPssNoKey(e.nameDefault) ?? <APkEx>[])
              ];
            }
            if (!primaryKeyOnly) {
              return <APkEx>[];
            }
            // Fore && PrimaryKey
            return e.entityParent?.aPssNoKey(e.nameDefault) ?? <APkEx>[];
          }()
    ];
  }

  // TODO(hodoan): doing
  String rawDebug([AColumn? ps, String? newName]) {
    // final all = aPss(false);
    final all = allss();
    return all.join(',\n');
  }

  AForeignKey? fKWithoutPK(AForeignKey f) {
    if (primaryKeys.map((e) => e.nameDefault).contains(f.nameDefault)) {
      return null;
    }
    return f;
  }
}

class APkEx {
  final APrimaryKey? pk;
  final AForeignKey? fk;
  final AProperty property;
  final String nameCast;
  final String name;
  final String? name2;
  final String? nameSelf;
  final List<String> parentClassName;
  final String model;
  final List<APkEx> children;

  const APkEx({
    required this.pk,
    this.fk,
    this.nameSelf,
    required this.property,
    required this.nameCast,
    required this.name,
    this.name2,
    required this.model,
    required this.children,
    required this.parentClassName,
  });

  @override
  String toString() {
    return 'APkEx(nameCast: $nameCast, name: $name, name2: $name2, model: $model, '
        'children: $children, property: $property,'
        ' pk: ${pk?.runtimeType.toString()}, nameSelf: $nameSelf, parentClassName: $parentClassName, fk: $fk)';
  }
}

extension on APkEx {
  List<APkEx> expanded() => [
        if (pk != null) this,
        for (final e in children) ...e.expanded(),
      ];
}

extension on APrimaryKey {
  APkEx expanded(AForeignKey? foreignKey, [String s = '']) {
    String name2;
    if (entityParent != null) {
      name2 = '${s}_$nameDefault';
    } else {
      name2 = '${s}_$nameToDB';
    }
    return APkEx(
      fk: foreignKey,
      parentClassName: parentClassName,
      pk: entityParent == null ? this : null,
      property: this,
      nameCast: nameFromDB,
      name2: name2,
      name: nameToDB,
      model: className,
      children: entityParent?.primaryKeys
              .map(
                (e) => e.expanded(foreignKey, name2),
              )
              .toList() ??
          [],
    );
  }

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
    return [
      ...primaryKeys,
      ...foreignKeys,
      ...columns,
      ...indices,
    ];
    // return {
    //   for (final e in primaryKeys) e.nameDefault: e,
    //   for (final e in foreignKeys) e.nameDefault: e,
    //   for (final e in columns) e.nameDefault: e,
    //   for (final e in indices) e.nameDefault: e,
    // }.values.toList();
  }

  /// using [aMPallSet]
  @Deprecated('using [aMPallSet]')
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
            ..name = 'children'
            ..named = true
            ..defaultTo = Code('const []')
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
            ..name = 'children'
            ..modifier = FieldModifier.final$
            ..type = refer('List<$setClassName<T>>'),
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
  final String model;
  final String? modelParent;
  final String? name;
  final List<KeyModel>? children;
  final AProperty property;
  final AProperty? propertyParent;
  final APrimaryKey? self;
  final bool selfIs;

  KeyModel._({
    this.propertyParent,
    this.modelParent,
    required this.model,
    String? nameSelf,
    this.children,
    required this.property,
    this.self,
    this.selfIs = false,
  }) : name = nameSelf?.toSnakeCase();

  // factory KeyModel.cloneOfChild(KeyModel item) => KeyModel._(
  //       property: item.property,
  //       nameSelf: item.name,
  //       children: item.children,
  //       self: item.self,
  //       selfIs: item.selfIs,
  //       nameGen: item.nameGen,
  //       nameSelfGen: item.nameSelfGen,
  //       this$: false,
  //     );

  factory KeyModel._ofPrimaryKey(
    APrimaryKey item, {
    String self = '',
    APrimaryKey? selfKey,
    bool withoutFore = false,
  }) {
    final entityParent = item.entityParent;
    if (entityParent != null) {
      // TODO(hodoan): check bug
      return KeyModel._(
        model: item.className,
        modelParent: entityParent.className,
        self: selfKey ?? item,
        children: [
          ...entityParent._treePrimaryKeys(
            self: '${self}_${entityParent.className}'.replaceFirst(
              RegExp('^_'),
              '',
            ),
            selfKey: !withoutFore ? (selfKey ?? item) : null,
          ),
        ],
        property: item,
        propertyParent: item,
      );
    }
    // TODO(hodoan): bug
    return KeyModel._(
      model: item.className,
      self: !withoutFore ? selfKey ?? item : null,
      nameSelf: '${self}_${item.nameToDB}'.replaceFirst(RegExp('^_'), ''),
      property: item,
      modelParent: entityParent?.className,
      propertyParent: item,
    );
  }

  // static KeyModel? _ofForeignKeys(
  //   List<AForeignKey> fores,
  //   String className, {
  //   required KeyModelChildren children,
  // }) {
  //   final self =
  //       fores.firstWhereOrNull((e) => e.entityParent?.className == className);
  //   if (self == null) return null;
  //   return KeyModel._(
  //     property: self,
  //     nameSelf: self.nameDefault,
  //     children: children.call(null, self.className),
  //     selfIs: true,
  //   );
  // }

  factory KeyModel._foreignKey(
    AForeignKey item, {
    required List<KeyModel> children,
    required String className,
  }) {
    if (item.entityParent?.className == className) {
      return KeyModel._(
        modelParent: item.entityParent?.className ?? 'me may',
        model: item.className,
        property: item,
        nameSelf: item.nameDefault,
        children: children,
        selfIs: true,
        propertyParent: item,
      );
    }

    return KeyModel._(
      model: item.className,
      modelParent: item.entityParent?.className ?? 'me may',
      property: item,
      nameSelf: item.nameDefault,
      children: item.entityParent?._expandedPrimaryKeys(
        null,
        item.nameDefault,
      ),
      propertyParent: item,
    );
  }

  factory KeyModel._columnOrIndex(
    AProperty item, {
    String? className,
    bool isParent = false,
    required AProperty? propertyParent,
  }) {
    return KeyModel._(
      model: item.className,
      modelParent: isParent ? null : (className ?? item.className),
      property: item,
      nameSelf: className == null ? item.nameToDB : item.nameFromDB,
      selfIs: item.className == className,
      propertyParent: propertyParent,
    );
  }

  @override
  String toString() => 'name: $name, children: [$children] self: $self,'
      ' selfIs: $selfIs modelParent: $modelParent property: $property';
}

typedef KeyModelChildren = List<KeyModel> Function(
    [List<KeyModel>? child, String self]);

// TODO(hodoan): work with self
class KeyModelSet {
  final String nameCast;
  final String name;
  final String model;
  final String? modelParent;
  final String? self;
  final AProperty property;
  final KeyModel keyModel;
  final String fieldName;

  /// [nameCast] is name without [model] or [self] prefix
  KeyModelSet._({
    this.modelParent,
    required this.keyModel,
    required this.name,
    required this.self,
    required this.property,
    required this.model,
    required this.nameCast,
    required this.fieldName,
  });

  factory KeyModelSet._ofColumnOrIndex(KeyModel model) {
    final name = model.property.nameToDB;
    final fieldName = [
      /// for column vs index
      if (model.propertyParent != null)

        /// for primary key self
        if (model.propertyParent?.nameToDB != name)
          model.propertyParent!.nameToDB,
      name,
    ].join('_').toCamelCase();
    return KeyModelSet._(
      fieldName: fieldName,
      keyModel: model,
      modelParent: model.modelParent,
      name: name,
      self: (model.propertyParent?.nameToDB == name)

          /// for primary key
          ? null

          /// for column vs index
          : model.propertyParent?.nameToDB,
      property: model.property,
      model: model.model.toSnakeCase(),
      nameCast: fieldName.toSnakeCase(),
    );
  }
  factory KeyModelSet._ofPrimaryKey(KeyModel model) {
    final name = model.property.nameToDB;
    // TODO(hodoan): for primary key
    final fieldName = model.property.nameFromDB.toCamelCase();
    return KeyModelSet._(
      fieldName: fieldName,
      keyModel: model,
      modelParent: model.modelParent,
      name: name,
      self: null,
      property: model.property,
      model: model.model.toSnakeCase(),
      nameCast: fieldName.toSnakeCase(),
    );
  }

  // factory KeyModelSet.of(KeyModelSet item) => KeyModelSet(
  //       name: item.name,
  //       self: item.self,
  //       property: item.property,
  //       model: item.model,
  //     );

  @override
  String toString() {
    return 'nameCast: $nameCast, name: $name, model: $model, self: $self modelParent: $modelParent';
  }
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
