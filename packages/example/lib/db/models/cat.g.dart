// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension CatQuery on Cat {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Cat(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
			birth INTEGER,
			parent_id INTEGER,
			child_id INTEGER,
			FOREIGN KEY (parent_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (child_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const Map<int, List<String>> alter = {};

  static const $CatSetArgs<int> id = $CatSetArgs(
    name: 'id',
    nameCast: 'cat_id',
    model: 'cat',
  );

  static const $CatSetArgs<int> catParentId = $CatSetArgs(
    name: 'id',
    nameCast: 'cat_id',
    model: 'parent_cat',
  );

  static const $CatSetArgs<String> catParentBirth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'parent_cat',
  );

  static const $CatSetArgs<int> catChildId = $CatSetArgs(
    name: 'id',
    nameCast: 'cat_id',
    model: 'child_cat',
  );

  static const $CatSetArgs<String> catChildBirth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'child_cat',
  );

  static const $CatSetArgs<String> birth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'cat',
  );

  static Set<$CatSetArgs> $default = {
    CatQuery.id,
    CatQuery.catParentId,
    CatQuery.catParentBirth,
    CatQuery.catChildId,
    CatQuery.catChildBirth,
    CatQuery.birth,
  };

  static String $createSelect(
    Set<$CatSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<Cat>> getAll(
    Database database, {
    Set<$CatSetArgs>? select,
    Set<WhereResult>? where,
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
 LEFT JOIN Cat parent_cat ON parent_cat.id = cat.parent_id
 LEFT JOIN Cat child_cat ON child_cat.id = cat.child_id
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : null}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Cat $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[CatQuery.id.nameCast]))
        .values
        .map((e) => Cat.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Cat>> top(
    Database database, {
    Set<$CatSetArgs>? select,
    Set<WhereResult>? where,
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

  Future<int> insert(Database database) async {
    final $catIdParent = await parent?.insert(database);
    final $catIdChild = await child?.insert(database);
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Cat (id,
parent_id,
child_id,
birth) 
       VALUES(?, ?, ?, ?)''', [
      this.id,
      $catIdParent,
      $catIdChild,
      this.birth,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await parent?.update(database);
    await child?.update(database);
    return await database
        .update('Cat', toDB(), where: "id = ?", whereArgs: [this.id]);
  }

  static Future<Cat?> getById(
    Database database,
    int? id, {
    Set<$CatSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Cat cat
 LEFT JOIN Cat parent_cat ON parent_cat.id = cat.parent_id
 LEFT JOIN Cat child_cat ON child_cat.id = cat.child_id
WHERE cat.id = ?
''', [id]) as List<Map>);
    return res.isNotEmpty ? Cat.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database
        .rawQuery('''DELETE FROM Cat cat WHERE cat.id = ?''', [this.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database.rawQuery('''DELETE FROM Cat cat WHERE cat.id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Cat''');
  }

  static Cat $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      Cat(
        id: json['${childName}cat_id'] as int?,
        parent: Cat.fromDB(json, []),
        child: Cat.fromDB(json, []),
        birth: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}cat_birth'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'id': this.id,
        'parent_id': parent?.id,
        'child_id': child?.id,
        'birth': this.birth?.millisecondsSinceEpoch,
      };
}

class $CatSetArgs<T> extends WhereModel<T> {
  const $CatSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
