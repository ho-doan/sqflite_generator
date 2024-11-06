// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension CatQuery on Cat {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Cat(
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			parent_id INTEGER,
			child_id INTEGER,
			birth INTEGER,
			FOREIGN KEY (parent_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (child_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, CatSet>> $default = {
    CatSetArgs.id,
    CatSetArgs.birth,
  };

  static String $createSelect(Set<WhereModel<dynamic, CatSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Cat>> getAll(
    Database database, {
    Set<WhereModel<dynamic, CatSet>>? select,
    Set<WhereResult<dynamic, CatSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CatSetArgs>>? orderBy,
    int? limit,
    int? offset,
  }) async {
    String whereStr = '';
    if (where != null &&
        where.isNotEmpty &&
        whereOr != null &&
        whereOr.isNotEmpty) {
      final s = [...whereOr, where];
      whereStr = s.whereSql;
    } else if (whereOr != null && whereOr.isNotEmpty) {
      whereStr = whereOr.whereSql;
    } else if (where != null && where.isNotEmpty) {
      whereStr = where.whereSql;
    }

    final sql = '''SELECT ${$createSelect(select)} FROM Cat cat
${const CatSetArgs('', '').leftJoin('cat')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Cat $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[CatSetArgs.id.nameCast]]))
        .values
        .map((e) => Cat.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Cat>> top(
    Database database, {
    Set<WhereModel<dynamic, CatSet>>? select,
    Set<WhereResult<dynamic, CatSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CatSetArgs>>? orderBy,
    required int top,
  }) =>
      getAll(
        database,
        select: select,
        where: where,
        whereOr: whereOr,
        orderBy: orderBy,
        limit: top,
      );
  static Future<int> count(Database database) async {
    final mapList =
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Cat
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    await parent?.insert(database);
    await child?.insert(database);
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Cat (id,
birth,
parent_id,
child_id) 
       VALUES(?, ?, ?, ?)''', [
      id,
      birth?.millisecondsSinceEpoch,
      parent?.id,
      child?.id,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await parent?.update(database);
    await child?.update(database);
    return await database
        .update('Cat', toDB(), where: "id = ?", whereArgs: [id]);
  }

  static Future<Cat?> getById(
    Database database,
    int? id, {
    Set<WhereModel<dynamic, CatSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Cat cat
${const CatSetArgs('', '').leftJoin('cat')}
WHERE cat.id = ?
''', [id]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[CatSetArgs.id.nameCast]]).values.first;
    return Cat.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery('''DELETE * FROM Cat cat WHERE cat.id = ?''', [id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database.rawQuery('''DELETE * FROM Cat cat WHERE cat.id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Cat''');
  }

  static Cat $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Cat(
          id: json['${childName}cat_id'] as int?,
          birth: DateTime.fromMillisecondsSinceEpoch(
            json['${childName}cat_birth'] as int? ?? -1,
          ),
          parent: childStep > 0 ? null : Cat.fromDB(json, lst, 'parent_', 1),
          child: childStep > 0 ? null : Cat.fromDB(json, lst, 'child_', 1));
  Map<String, dynamic> $toDB() => {
        'id': id,
        'birth': birth?.millisecondsSinceEpoch,
        'parent_id': parent?.id,
        'child_id': child?.id
      };
}

class $CatSetArgs<T, M> extends WhereModel<T, M> {
  const $CatSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class CatSetArgs<T> {
  const CatSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $CatSetArgs<int, CatSet> id = $CatSetArgs<int, CatSet>(
    name: 'id',
    nameCast: 'cat_id',
    model: 'cat',
  );

  static const $CatSetArgs<String, CatSet> birth = $CatSetArgs<String, CatSet>(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'cat',
  );

  static const CatSetArgs<CatSet> $parent =
      CatSetArgs<CatSet>('parent_', 'parent_');

  static const CatSetArgs<CatSet> $child =
      CatSetArgs<CatSet>('child_', 'child_');

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Cat ${self}cat ON ${self}cat.id = $parentModel.${self2}id''',
        if (step < 1) $$parent.leftJoin(parentModel, step + 1),
        if (step < 1) $$child.leftJoin(parentModel, step + 1)
      ].join('\n');

  $CatSetArgs<int, T> get $id => $CatSetArgs<int, T>(
        name: 'id',
        nameCast: 'cat_id',
        model: 'cat',
        self: this.self,
      );

  $CatSetArgs<String, T> get $birth => $CatSetArgs<String, T>(
        name: 'birth',
        nameCast: 'cat_birth',
        model: 'cat',
        self: this.self,
      );

  CatSetArgs<T> get $$parent => CatSetArgs<T>('${self}parent_', 'parent_');

  CatSetArgs<T> get $$child => CatSetArgs<T>('${self}child_', 'child_');
}

class CatSet {
  const CatSet();
}
