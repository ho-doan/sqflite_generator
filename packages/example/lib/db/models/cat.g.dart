// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension CatQuery on Cat {
  static const _$$CatSetArgs parent$$ = _$$CatSetArgs();

  static const _$$CatSetArgs child$$ = _$$CatSetArgs();

  static const String createTable = '''CREATE TABLE IF NOT EXISTS Cat(
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			parent_id INTEGER,
			child_id INTEGER,
			birth INTEGER,
			FOREIGN KEY (parent_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (child_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''([Cat, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [id], step: 1), parentClassName: []),
([Cat, birth], nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [birth], step: 1), parentClassName: [])''';

  static const Map<int, List<String>> alter = {};

// ([Cat, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [id], step: 1), parentClassName: [])
  static const $CatSetArgs<int> id = $CatSetArgs(
    name: 'id',
    nameCast: 'cat_id',
    model: 'cat',
  );

// ([Cat, birth], nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [birth], step: 1), parentClassName: [])
  static const $CatSetArgs<String> birth = $CatSetArgs(
    name: 'birth',
    nameCast: 'cat_birth',
    model: 'cat',
  );

  static Set<$CatSetArgs> $default = {
    CatQuery.id,
    CatQuery.birth,
    CatQuery.parent$$.id,
    CatQuery.parent$$.birth,
    CatQuery.child$$.id,
    CatQuery.child$$.birth,
  };

// TODO(hodoan): check
  static String $createSelect(
    Set<$CatSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
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
        .groupBy(((m) => [m[CatQuery.id.nameCast]]))
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

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    await parent?.insert(database);
    await child?.insert(database);
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Cat (id,
cat,
cat,
birth) 
       VALUES(?, ?, ?, ?)''', [
      id,
      this.birth?.millisecondsSinceEpoch,
// nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat, Cat], fieldNames: [parent, id], step: 2), parentClassName: [parent]
      parent?.id,
// nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat, Cat], fieldNames: [child, id], step: 2), parentClassName: [child]
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

// TODO(hodoan): check
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
    await database.rawQuery('''DELETE FROM Cat cat WHERE cat.id = ?''', [id]);
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
          id: json['cat_id'] as int?,
          birth: DateTime.fromMillisecondsSinceEpoch(
            json['${childName}cat_birth'] as int? ?? -1,
          ),
          parent: Cat.fromDB(json, lst, 'parent_'),
          child: Cat.fromDB(json, lst, 'child_'));
  Map<String, dynamic> $toDB() => {
        'id': this.id,
        'birth': this.birth?.millisecondsSinceEpoch,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat, Cat], fieldNames: [parent, id], step: 2), parentClassName: [parent]
        'parent_cat_id': this.parent?.id,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat, Cat], fieldNames: [child, id], step: 2), parentClassName: [child]
        'child_cat_id': this.child?.id
      };
}

class $CatSetArgs<T> extends WhereModel<T> {
  const $CatSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$CatSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}

class _$$$CatSetArgs<T> extends $CatSetArgs<T> {
  const _$$$CatSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$CatSetArgs {
  const _$$CatSetArgs();

// ([Cat, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [id], step: 1), parentClassName: [])
  _$$$CatSetArgs<int> get id => const _$$$CatSetArgs(
        name: 'id',
        nameCast: 'cat_id',
        model: 'cat',
      );

// ([Cat, birth], nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [birth], step: 1), parentClassName: [])
  _$$$CatSetArgs<String> get birth => const _$$$CatSetArgs(
        name: 'birth',
        nameCast: 'cat_birth',
        model: 'cat',
      );
}
