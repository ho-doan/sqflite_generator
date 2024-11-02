// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension CatQuery on Cat {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Cat(
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			parent_cat_id INTEGER,
			child_cat_id INTEGER,
			birth INTEGER,
			FOREIGN KEY (parent_cat_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (child_cat_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''(id, nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(cat_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(cat_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(birth, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false)''';

  static const Map<int, List<String>> alter = {};

// APkEx(nameCast: cat_id, name: id, name2: null, model: Cat, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [], fk: null)
  static const $CatSetArgs<int> id = $CatSetArgs(
    name: 'id',
    nameCast: 'cat_id',
    model: 'cat',
  );

// APkEx(nameCast: cat_id, name: id, name2: parent_id, model: Cat, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parent], fk: nameDefault: parent, name: Cat, nameToDB: cat, nameFromDB: cat_cat, dartType: Cat?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $CatSetArgs<int> parentId = $CatSetArgs(
    name: 'id',
    nameCast: 'parent_id',
    model: 'cat',
  );

// APkEx(nameCast: cat_birth, name: parent_birth, name2: null, model: Cat, children: [], property: nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [parent], fk: null)
  static const $CatSetArgs<String> parentBirth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'cat',
  );

// APkEx(nameCast: cat_id, name: id, name2: child_id, model: Cat, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [child], fk: nameDefault: child, name: Cat, nameToDB: cat, nameFromDB: cat_cat, dartType: Cat?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $CatSetArgs<int> childId = $CatSetArgs(
    name: 'id',
    nameCast: 'child_id',
    model: 'cat',
  );

// APkEx(nameCast: cat_birth, name: child_birth, name2: null, model: Cat, children: [], property: nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [child], fk: null)
  static const $CatSetArgs<String> childBirth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'cat',
  );

// APkEx(nameCast: cat_birth, name: birth, name2: null, model: Cat, children: [], property: nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: null, nameSelf: birth, parentClassName: [], fk: null)
  static const $CatSetArgs<String> birth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'cat',
  );

  static Set<$CatSetArgs> $default = {
    CatQuery.id,
    CatQuery.parentId,
    CatQuery.parentBirth,
    CatQuery.childId,
    CatQuery.childBirth,
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
 LEFT JOIN Cat parent_cat ON parent_cat.id = cat.cat
 LEFT JOIN Cat child_cat ON child_cat.id = cat.cat
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
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
cat,
cat,
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
 LEFT JOIN Cat parent_cat ON parent_cat.id = cat.cat
 LEFT JOIN Cat child_cat ON child_cat.id = cat.cat
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
        id: json['${childName}cat_id'] as int?,
        id: json['${childName}cat_id'] as int?,
        birth: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}cat_birth'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'id': this.id,
        'cat': parent?.id,
        'cat': child?.id,
        'birth': this.birth?.millisecondsSinceEpoch,
      };
}

class $CatSetArgs<T> extends WhereModel<T> {
  const $CatSetArgs({
    this.self = '',
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final String name;

  final String model;

  final String nameCast;
}
