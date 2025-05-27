// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $ArtistQuerySample on Artist {
  static const String selectAll = '''
	SELECT
			artist_id,
			name
	FROM Artist;''';
}

class ArtistFilter {
  const ArtistFilter(this.value);

  final String value;

  ArtistFilter get sortByArtistId => const ArtistFilter('artist_id');

  ArtistFilter get sortByName => const ArtistFilter('name');

  ArtistFilter get sortByArtistIdDesc => const ArtistFilter('artist_id DESC');

  ArtistFilter get sortByNameDesc => const ArtistFilter('name DESC');
}

class ArtistWhere {
  const ArtistWhere(this.value);

  final String value;

  ArtistWhere or() => ArtistWhere(" or ");

  ArtistWhere artistIdEqual(dynamic value) => ArtistWhere("artist_id = $value");

  ArtistWhere artistIdNotEqual(dynamic value) =>
      ArtistWhere("artist_id != $value");

  ArtistWhere nameEqual(dynamic value) => ArtistWhere("name = '$value'");

  ArtistWhere nameNotEqual(dynamic value) => ArtistWhere("name != '$value'");
}

extension ArtistQuery on Artist {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Artist(
			artist_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, ArtistSet>> $default = {
    ArtistSetArgs.artistId,
    ArtistSetArgs.name,
  };

  static String $createSelect(Set<WhereModel<dynamic, ArtistSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Artist>> getAll(
    Database database, {
    Set<WhereModel<dynamic, ArtistSet>>? select,
    Set<WhereResult<dynamic, ArtistSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ArtistSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Artist artist
${const ArtistSetArgs('', '').leftJoin('artist')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Artist $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[ArtistSetArgs.artistId.nameCast]]))
        .values
        .map((e) => Artist.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Artist>> top(
    Database database, {
    Set<WhereModel<dynamic, ArtistSet>>? select,
    Set<WhereResult<dynamic, ArtistSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ArtistSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Artist
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Artist (artist_id,
name) 
       VALUES(?, ?)''', [
      artistId,
      name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('Artist', toDB(),
        where: "artist_id = ?", whereArgs: [artistId]);
  }

  static Future<Artist?> getById(
    Database database,
    int artistId, {
    Set<WhereModel<dynamic, ArtistSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Artist artist
${const ArtistSetArgs('', '').leftJoin('artist')}
WHERE artist.artistId = ?
''', [artistId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[ArtistSetArgs.artistId.nameCast]]).values.first;
    return Artist.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Artist artist WHERE artist.artistId = ?''',
        [artistId]);
  }

  static Future<void> deleteById(
    Database database,
    int artistId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Artist artist WHERE artist.artistId = ?''',
        [artistId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Artist''');
  }

  static Artist $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Artist(
          artistId: json['${childName}artist_artist_id'] as int,
          name: json['${childName}artist_name'] as String);
  Map<String, dynamic> $toDB() => {'artist_id': artistId, 'name': name};
}

class $ArtistSetArgs<T, M> extends WhereModel<T, M> {
  const $ArtistSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class ArtistSetArgs<T> {
  const ArtistSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $ArtistSetArgs<int, ArtistSet> artistId =
      $ArtistSetArgs<int, ArtistSet>(
    name: 'artist_id',
    nameCast: 'artist_artist_id',
    model: 'artist',
  );

  static const $ArtistSetArgs<String, ArtistSet> name =
      $ArtistSetArgs<String, ArtistSet>(
    name: 'name',
    nameCast: 'artist_name',
    model: 'artist',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Artist ${self}artist ON ${self}artist.artistId = $parentModel.${self2}artistId''',
      ].join('\n');

  $ArtistSetArgs<int, T> get $artistId => $ArtistSetArgs<int, T>(
        name: 'artist_id',
        nameCast: 'artist_artist_id',
        model: 'artist',
        self: this.self,
      );

  $ArtistSetArgs<String, T> get $name => $ArtistSetArgs<String, T>(
        name: 'name',
        nameCast: 'artist_name',
        model: 'artist',
        self: this.self,
      );
}

class ArtistSet {
  const ArtistSet();
}
