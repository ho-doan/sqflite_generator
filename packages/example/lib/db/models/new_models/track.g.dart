// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $TrackQuerySample on Track {
  static const String selectAll = '''
	SELECT
			track_id,
			name,
			album_id,
			media_type_id,
			genre_id,
			composer,
			milliseconds,
			bytes,
			unit_price
	FROM Track;''';
}

class TrackFilter {
  const TrackFilter(this.value);

  final String value;

  TrackFilter get sortByTrackId => const TrackFilter('track_id');

  TrackFilter get sortByName => const TrackFilter('name');

  TrackFilter get sortByAlbumId => const TrackFilter('album_id');

  TrackFilter get sortByMediaTypeId => const TrackFilter('media_type_id');

  TrackFilter get sortByGenreId => const TrackFilter('genre_id');

  TrackFilter get sortByComposer => const TrackFilter('composer');

  TrackFilter get sortByMilliseconds => const TrackFilter('milliseconds');

  TrackFilter get sortByBytes => const TrackFilter('bytes');

  TrackFilter get sortByUnitPrice => const TrackFilter('unit_price');

  TrackFilter get sortByTrackIdDesc => const TrackFilter('track_id DESC');

  TrackFilter get sortByNameDesc => const TrackFilter('name DESC');

  TrackFilter get sortByAlbumIdDesc => const TrackFilter('album_id DESC');

  TrackFilter get sortByMediaTypeIdDesc =>
      const TrackFilter('media_type_id DESC');

  TrackFilter get sortByGenreIdDesc => const TrackFilter('genre_id DESC');

  TrackFilter get sortByComposerDesc => const TrackFilter('composer DESC');

  TrackFilter get sortByMillisecondsDesc =>
      const TrackFilter('milliseconds DESC');

  TrackFilter get sortByBytesDesc => const TrackFilter('bytes DESC');

  TrackFilter get sortByUnitPriceDesc => const TrackFilter('unit_price DESC');

  TrackFilter get sortByComposerNullsFirst =>
      const TrackFilter('composer NULLS FIRST');

  TrackFilter get sortByComposerNullsLast =>
      const TrackFilter('composer NULLS LAST');
}

class TrackWhere {
  const TrackWhere(this.value);

  final String value;

  TrackWhere or() => TrackWhere(" or ");

  TrackWhere trackIdEqual(dynamic value) => TrackWhere("track_id = $value");

  TrackWhere trackIdNotEqual(dynamic value) => TrackWhere("track_id != $value");

  TrackWhere nameEqual(dynamic value) => TrackWhere("name = '$value'");

  TrackWhere nameNotEqual(dynamic value) => TrackWhere("name != '$value'");

  TrackWhere albumIdEqual(dynamic value) => TrackWhere("album_id = $value");

  TrackWhere albumIdNotEqual(dynamic value) => TrackWhere("album_id != $value");

  TrackWhere mediaTypeIdEqual(dynamic value) =>
      TrackWhere("media_type_id = $value");

  TrackWhere mediaTypeIdNotEqual(dynamic value) =>
      TrackWhere("media_type_id != $value");

  TrackWhere genreIdEqual(dynamic value) => TrackWhere("genre_id = $value");

  TrackWhere genreIdNotEqual(dynamic value) => TrackWhere("genre_id != $value");

  TrackWhere composerEqual(dynamic value) => TrackWhere("composer = '$value'");

  TrackWhere composerNotEqual(dynamic value) =>
      TrackWhere("composer != '$value'");

  TrackWhere millisecondsEqual(dynamic value) =>
      TrackWhere("milliseconds = $value");

  TrackWhere millisecondsNotEqual(dynamic value) =>
      TrackWhere("milliseconds != $value");

  TrackWhere bytesEqual(dynamic value) => TrackWhere("bytes = $value");

  TrackWhere bytesNotEqual(dynamic value) => TrackWhere("bytes != $value");

  TrackWhere unitPriceEqual(dynamic value) =>
      TrackWhere("unit_price = '$value'");

  TrackWhere unitPriceNotEqual(dynamic value) =>
      TrackWhere("unit_price != '$value'");
}

extension TrackQuery on Track {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Track(
			track_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL,
			album_id INTEGER NOT NULL,
			media_type_id INTEGER NOT NULL,
			genre_id INTEGER NOT NULL,
			composer TEXT,
			milliseconds INTEGER NOT NULL,
			bytes INTEGER NOT NULL,
			unit_price REAL NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, TrackSet>> $default = {
    TrackSetArgs.trackId,
    TrackSetArgs.name,
    TrackSetArgs.albumId,
    TrackSetArgs.mediaTypeId,
    TrackSetArgs.genreId,
    TrackSetArgs.composer,
    TrackSetArgs.milliseconds,
    TrackSetArgs.bytes,
    TrackSetArgs.unitPrice,
  };

  static String $createSelect(Set<WhereModel<dynamic, TrackSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Track>> getAll(
    Database database, {
    Set<WhereModel<dynamic, TrackSet>>? select,
    Set<WhereResult<dynamic, TrackSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$TrackSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Track track
${const TrackSetArgs('', '').leftJoin('track')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Track $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[TrackSetArgs.trackId.nameCast]]))
        .values
        .map((e) => Track.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Track>> top(
    Database database, {
    Set<WhereModel<dynamic, TrackSet>>? select,
    Set<WhereResult<dynamic, TrackSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$TrackSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Track
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Track (track_id,
name,
album_id,
media_type_id,
genre_id,
composer,
milliseconds,
bytes,
unit_price) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      trackId,
      name,
      albumId,
      mediaTypeId,
      genreId,
      composer,
      milliseconds,
      bytes,
      unitPrice,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Track', toDB(), where: "track_id = ?", whereArgs: [trackId]);
  }

  static Future<Track?> getById(
    Database database,
    int trackId, {
    Set<WhereModel<dynamic, TrackSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Track track
${const TrackSetArgs('', '').leftJoin('track')}
WHERE track.trackId = ?
''', [trackId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[TrackSetArgs.trackId.nameCast]]).values.first;
    return Track.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Track track WHERE track.trackId = ?''', [trackId]);
  }

  static Future<void> deleteById(
    Database database,
    int trackId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Track track WHERE track.trackId = ?''', [trackId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Track''');
  }

  static Track $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Track(
          trackId: json['${childName}track_track_id'] as int,
          name: json['${childName}track_name'] as String,
          albumId: json['${childName}track_album_id'] as int,
          mediaTypeId: json['${childName}track_media_type_id'] as int,
          genreId: json['${childName}track_genre_id'] as int,
          composer: json['${childName}track_composer'] as String?,
          milliseconds: json['${childName}track_milliseconds'] as int,
          bytes: json['${childName}track_bytes'] as int,
          unitPrice: json['${childName}track_unit_price'] as double);
  Map<String, dynamic> $toDB() => {
        'track_id': trackId,
        'name': name,
        'album_id': albumId,
        'media_type_id': mediaTypeId,
        'genre_id': genreId,
        'composer': composer,
        'milliseconds': milliseconds,
        'bytes': bytes,
        'unit_price': unitPrice
      };
}

class $TrackSetArgs<T, M> extends WhereModel<T, M> {
  const $TrackSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class TrackSetArgs<T> {
  const TrackSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $TrackSetArgs<int, TrackSet> trackId =
      $TrackSetArgs<int, TrackSet>(
    name: 'track_id',
    nameCast: 'track_track_id',
    model: 'track',
  );

  static const $TrackSetArgs<String, TrackSet> name =
      $TrackSetArgs<String, TrackSet>(
    name: 'name',
    nameCast: 'track_name',
    model: 'track',
  );

  static const $TrackSetArgs<int, TrackSet> albumId =
      $TrackSetArgs<int, TrackSet>(
    name: 'album_id',
    nameCast: 'track_album_id',
    model: 'track',
  );

  static const $TrackSetArgs<int, TrackSet> mediaTypeId =
      $TrackSetArgs<int, TrackSet>(
    name: 'media_type_id',
    nameCast: 'track_media_type_id',
    model: 'track',
  );

  static const $TrackSetArgs<int, TrackSet> genreId =
      $TrackSetArgs<int, TrackSet>(
    name: 'genre_id',
    nameCast: 'track_genre_id',
    model: 'track',
  );

  static const $TrackSetArgs<String, TrackSet> composer =
      $TrackSetArgs<String, TrackSet>(
    name: 'composer',
    nameCast: 'track_composer',
    model: 'track',
  );

  static const $TrackSetArgs<int, TrackSet> milliseconds =
      $TrackSetArgs<int, TrackSet>(
    name: 'milliseconds',
    nameCast: 'track_milliseconds',
    model: 'track',
  );

  static const $TrackSetArgs<int, TrackSet> bytes =
      $TrackSetArgs<int, TrackSet>(
    name: 'bytes',
    nameCast: 'track_bytes',
    model: 'track',
  );

  static const $TrackSetArgs<String, TrackSet> unitPrice =
      $TrackSetArgs<String, TrackSet>(
    name: 'unit_price',
    nameCast: 'track_unit_price',
    model: 'track',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Track ${self}track ON ${self}track.trackId = $parentModel.${self2}trackId''',
      ].join('\n');

  $TrackSetArgs<int, T> get $trackId => $TrackSetArgs<int, T>(
        name: 'track_id',
        nameCast: 'track_track_id',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<String, T> get $name => $TrackSetArgs<String, T>(
        name: 'name',
        nameCast: 'track_name',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<int, T> get $albumId => $TrackSetArgs<int, T>(
        name: 'album_id',
        nameCast: 'track_album_id',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<int, T> get $mediaTypeId => $TrackSetArgs<int, T>(
        name: 'media_type_id',
        nameCast: 'track_media_type_id',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<int, T> get $genreId => $TrackSetArgs<int, T>(
        name: 'genre_id',
        nameCast: 'track_genre_id',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<String, T> get $composer => $TrackSetArgs<String, T>(
        name: 'composer',
        nameCast: 'track_composer',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<int, T> get $milliseconds => $TrackSetArgs<int, T>(
        name: 'milliseconds',
        nameCast: 'track_milliseconds',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<int, T> get $bytes => $TrackSetArgs<int, T>(
        name: 'bytes',
        nameCast: 'track_bytes',
        model: 'track',
        self: this.self,
      );

  $TrackSetArgs<String, T> get $unitPrice => $TrackSetArgs<String, T>(
        name: 'unit_price',
        nameCast: 'track_unit_price',
        model: 'track',
        self: this.self,
      );
}

class TrackSet {
  const TrackSet();
}
