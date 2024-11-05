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

  static const String debug =
      '''version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [id], step: 1), parentClassName: [],
version: 1, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [birth], step: 1), parentClassName: []''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, CatSet>> $default = {
    CatSetArgs.id,
    CatSetArgs.birth,
  };

// TODO(hodoan): check
  static String $createSelect(Set<WhereModel<dynamic, CatSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
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
cat,
cat,
birth) 
       VALUES(?, ?, ?, ?)''', [
      id,
      this.birth?.millisecondsSinceEpoch,
      parent?.id,
      child?.id,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await parent?.update(database);
    await child?.update(database);
    return await database
        .update('Cat', toDB(), where: "id = ?", whereArgs: [this.id]);
  }

// TODO(hodoan): check
  static Future<Cat?> getById(
    Database database,
    int? id, {
    Set<WhereModel<dynamic, CatSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Cat cat
WHERE cat.id = ?
''', [id]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? Cat.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database
        .rawQuery('''DELETE * FROM Cat cat WHERE cat.id = ?''', [this.id]);
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
        'parent_id': this.parent?.id,
        'child_id': this.child?.id
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
  const CatSetArgs(this.self);

  final String self;

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

  String leftJoin(String parentModel) =>
      '''LEFT JOIN Cat ${self}cat ON ${self}cat.id = $parentModel.${self}id''';

// version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: cat_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [id], step: 1), parentClassName: []
  $CatSetArgs<int, T> get $id => $CatSetArgs<int, T>(
        name: 'id',
        nameCast: 'cat_id',
        model: 'cat',
        self: this.self,
      );

// version: 1, nameDefault: birth, name: null, nameToDB: birth, nameFromDB: cat_birth, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Cat], fieldNames: [birth], step: 1), parentClassName: []
  $CatSetArgs<String, T> get $birth => $CatSetArgs<String, T>(
        name: 'birth',
        nameCast: 'cat_birth',
        model: 'cat',
        self: this.self,
      );
}

class CatSet {
  const CatSet();
}
