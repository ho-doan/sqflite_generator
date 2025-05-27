// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $GenreQuerySample on Genre {
  static const String selectAll = '''
	SELECT
			genre_id,
			name
	FROM Genre;''';
}

class GenreFilter {
  const GenreFilter(this.value);

  final String value;

  GenreFilter get sortByGenreId => const GenreFilter('genre_id');

  GenreFilter get sortByName => const GenreFilter('name');

  GenreFilter get sortByGenreIdDesc => const GenreFilter('genre_id DESC');

  GenreFilter get sortByNameDesc => const GenreFilter('name DESC');
}

class GenreWhere {
  const GenreWhere(this.value);

  final String value;

  GenreWhere or() => GenreWhere(" or ");

  GenreWhere genreIdEqual(dynamic value) => GenreWhere("genre_id = $value");

  GenreWhere genreIdNotEqual(dynamic value) => GenreWhere("genre_id != $value");

  GenreWhere nameEqual(dynamic value) => GenreWhere("name = '$value'");

  GenreWhere nameNotEqual(dynamic value) => GenreWhere("name != '$value'");
}

extension GenreQuery on Genre {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Genre(
			genre_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, GenreSet>> $default = {
    GenreSetArgs.genreId,
    GenreSetArgs.name,
  };

  static String $createSelect(Set<WhereModel<dynamic, GenreSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Genre>> getAll(
    Database database, {
    Set<WhereModel<dynamic, GenreSet>>? select,
    Set<WhereResult<dynamic, GenreSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$GenreSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Genre genre
${const GenreSetArgs('', '').leftJoin('genre')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Genre $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[GenreSetArgs.genreId.nameCast]]))
        .values
        .map((e) => Genre.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Genre>> top(
    Database database, {
    Set<WhereModel<dynamic, GenreSet>>? select,
    Set<WhereResult<dynamic, GenreSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$GenreSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Genre
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Genre (genre_id,
name) 
       VALUES(?, ?)''', [
      genreId,
      name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Genre', toDB(), where: "genre_id = ?", whereArgs: [genreId]);
  }

  static Future<Genre?> getById(
    Database database,
    int genreId, {
    Set<WhereModel<dynamic, GenreSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Genre genre
${const GenreSetArgs('', '').leftJoin('genre')}
WHERE genre.genreId = ?
''', [genreId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[GenreSetArgs.genreId.nameCast]]).values.first;
    return Genre.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Genre genre WHERE genre.genreId = ?''', [genreId]);
  }

  static Future<void> deleteById(
    Database database,
    int genreId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Genre genre WHERE genre.genreId = ?''', [genreId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Genre''');
  }

  static Genre $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Genre(
          genreId: json['${childName}genre_genre_id'] as int,
          name: json['${childName}genre_name'] as String);
  Map<String, dynamic> $toDB() => {'genre_id': genreId, 'name': name};
}

class $GenreSetArgs<T, M> extends WhereModel<T, M> {
  const $GenreSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class GenreSetArgs<T> {
  const GenreSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $GenreSetArgs<int, GenreSet> genreId =
      $GenreSetArgs<int, GenreSet>(
    name: 'genre_id',
    nameCast: 'genre_genre_id',
    model: 'genre',
  );

  static const $GenreSetArgs<String, GenreSet> name =
      $GenreSetArgs<String, GenreSet>(
    name: 'name',
    nameCast: 'genre_name',
    model: 'genre',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Genre ${self}genre ON ${self}genre.genreId = $parentModel.${self2}genreId''',
      ].join('\n');

  $GenreSetArgs<int, T> get $genreId => $GenreSetArgs<int, T>(
        name: 'genre_id',
        nameCast: 'genre_genre_id',
        model: 'genre',
        self: this.self,
      );

  $GenreSetArgs<String, T> get $name => $GenreSetArgs<String, T>(
        name: 'name',
        nameCast: 'genre_name',
        model: 'genre',
        self: this.self,
      );
}

class GenreSet {
  const GenreSet();
}
