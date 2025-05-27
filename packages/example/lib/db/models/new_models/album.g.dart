// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $AlbumQuerySample on Album {
  static const String selectAll = '''
	SELECT
			album_id,
			title,
			artist_id
	FROM Album;''';
}

class AlbumFilter {
  const AlbumFilter(this.value);

  final String value;

  AlbumFilter get sortByAlbumId => const AlbumFilter('album_id');

  AlbumFilter get sortByTitle => const AlbumFilter('title');

  AlbumFilter get sortByArtistId => const AlbumFilter('artist_id');

  AlbumFilter get sortByAlbumIdDesc => const AlbumFilter('album_id DESC');

  AlbumFilter get sortByTitleDesc => const AlbumFilter('title DESC');

  AlbumFilter get sortByArtistIdDesc => const AlbumFilter('artist_id DESC');
}

class AlbumWhere {
  const AlbumWhere(this.value);

  final String value;

  AlbumWhere or() => AlbumWhere(" or ");

  AlbumWhere albumIdEqual(dynamic value) => AlbumWhere("album_id = $value");

  AlbumWhere albumIdNotEqual(dynamic value) => AlbumWhere("album_id != $value");

  AlbumWhere titleEqual(dynamic value) => AlbumWhere("title = '$value'");

  AlbumWhere titleNotEqual(dynamic value) => AlbumWhere("title != '$value'");

  AlbumWhere artistIdEqual(dynamic value) => AlbumWhere("artist_id = $value");

  AlbumWhere artistIdNotEqual(dynamic value) =>
      AlbumWhere("artist_id != $value");
}

extension AlbumQuery on Album {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Album(
			album_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			title TEXT NOT NULL,
			artist_id INTEGER NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, AlbumSet>> $default = {
    AlbumSetArgs.albumId,
    AlbumSetArgs.title,
    AlbumSetArgs.artistId,
  };

  static String $createSelect(Set<WhereModel<dynamic, AlbumSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Album>> getAll(
    Database database, {
    Set<WhereModel<dynamic, AlbumSet>>? select,
    Set<WhereResult<dynamic, AlbumSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$AlbumSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Album album
${const AlbumSetArgs('', '').leftJoin('album')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Album $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[AlbumSetArgs.albumId.nameCast]]))
        .values
        .map((e) => Album.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Album>> top(
    Database database, {
    Set<WhereModel<dynamic, AlbumSet>>? select,
    Set<WhereResult<dynamic, AlbumSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$AlbumSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Album
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Album (album_id,
title,
artist_id) 
       VALUES(?, ?, ?)''', [
      albumId,
      title,
      artistId,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Album', toDB(), where: "album_id = ?", whereArgs: [albumId]);
  }

  static Future<Album?> getById(
    Database database,
    int albumId, {
    Set<WhereModel<dynamic, AlbumSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Album album
${const AlbumSetArgs('', '').leftJoin('album')}
WHERE album.albumId = ?
''', [albumId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[AlbumSetArgs.albumId.nameCast]]).values.first;
    return Album.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Album album WHERE album.albumId = ?''', [albumId]);
  }

  static Future<void> deleteById(
    Database database,
    int albumId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Album album WHERE album.albumId = ?''', [albumId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Album''');
  }

  static Album $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Album(
          albumId: json['${childName}album_album_id'] as int,
          title: json['${childName}album_title'] as String,
          artistId: json['${childName}album_artist_id'] as int);
  Map<String, dynamic> $toDB() =>
      {'album_id': albumId, 'title': title, 'artist_id': artistId};
}

class $AlbumSetArgs<T, M> extends WhereModel<T, M> {
  const $AlbumSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class AlbumSetArgs<T> {
  const AlbumSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $AlbumSetArgs<int, AlbumSet> albumId =
      $AlbumSetArgs<int, AlbumSet>(
    name: 'album_id',
    nameCast: 'album_album_id',
    model: 'album',
  );

  static const $AlbumSetArgs<String, AlbumSet> title =
      $AlbumSetArgs<String, AlbumSet>(
    name: 'title',
    nameCast: 'album_title',
    model: 'album',
  );

  static const $AlbumSetArgs<int, AlbumSet> artistId =
      $AlbumSetArgs<int, AlbumSet>(
    name: 'artist_id',
    nameCast: 'album_artist_id',
    model: 'album',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Album ${self}album ON ${self}album.albumId = $parentModel.${self2}albumId''',
      ].join('\n');

  $AlbumSetArgs<int, T> get $albumId => $AlbumSetArgs<int, T>(
        name: 'album_id',
        nameCast: 'album_album_id',
        model: 'album',
        self: this.self,
      );

  $AlbumSetArgs<String, T> get $title => $AlbumSetArgs<String, T>(
        name: 'title',
        nameCast: 'album_title',
        model: 'album',
        self: this.self,
      );

  $AlbumSetArgs<int, T> get $artistId => $AlbumSetArgs<int, T>(
        name: 'artist_id',
        nameCast: 'album_artist_id',
        model: 'album',
        self: this.self,
      );
}

class AlbumSet {
  const AlbumSet();
}
