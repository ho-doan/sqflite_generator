// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_track.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $PlaylistTrackQuerySample on PlaylistTrack {
  static const String selectAll = '''
	SELECT
			playlist_id,
			track_id
	FROM PlaylistTrack;''';
}

class PlaylistTrackFilter {
  const PlaylistTrackFilter(this.value);

  final String value;

  PlaylistTrackFilter get sortByPlaylistId =>
      const PlaylistTrackFilter('playlist_id');

  PlaylistTrackFilter get sortByTrackId =>
      const PlaylistTrackFilter('track_id');

  PlaylistTrackFilter get sortByPlaylistIdDesc =>
      const PlaylistTrackFilter('playlist_id DESC');

  PlaylistTrackFilter get sortByTrackIdDesc =>
      const PlaylistTrackFilter('track_id DESC');
}

class PlaylistTrackWhere {
  const PlaylistTrackWhere(this.value);

  final String value;

  PlaylistTrackWhere or() => PlaylistTrackWhere(" or ");

  PlaylistTrackWhere playlistIdEqual(dynamic value) =>
      PlaylistTrackWhere("playlist_id = $value");

  PlaylistTrackWhere playlistIdNotEqual(dynamic value) =>
      PlaylistTrackWhere("playlist_id != $value");

  PlaylistTrackWhere trackIdEqual(dynamic value) =>
      PlaylistTrackWhere("track_id = $value");

  PlaylistTrackWhere trackIdNotEqual(dynamic value) =>
      PlaylistTrackWhere("track_id != $value");
}

extension PlaylistTrackQuery on PlaylistTrack {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS PlaylistTrack(
			playlist_id INTEGER NOT NULL,
			track_id INTEGER NOT NULL,
			PRIMARY KEY (playlist_id,track_id)
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, PlaylistTrackSet>> $default = {
    PlaylistTrackSetArgs.playlistId,
    PlaylistTrackSetArgs.trackId,
  };

  static String $createSelect(
          Set<WhereModel<dynamic, PlaylistTrackSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<PlaylistTrack>> getAll(
    Database database, {
    Set<WhereModel<dynamic, PlaylistTrackSet>>? select,
    Set<WhereResult<dynamic, PlaylistTrackSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$PlaylistTrackSetArgs>>? orderBy,
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

    final sql =
        '''SELECT ${$createSelect(select)} FROM PlaylistTrack playlist_track
${const PlaylistTrackSetArgs('', '').leftJoin('playlist_track')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all PlaylistTrack $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [
              m[PlaylistTrackSetArgs.playlistId.nameCast],
              m[PlaylistTrackSetArgs.trackId.nameCast]
            ]))
        .values
        .map((e) => PlaylistTrack.fromDB(e.first, e))
        .toList();
  }

  static Future<List<PlaylistTrack>> top(
    Database database, {
    Set<WhereModel<dynamic, PlaylistTrackSet>>? select,
    Set<WhereResult<dynamic, PlaylistTrackSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$PlaylistTrackSetArgs>>? orderBy,
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
    final mapList = (await database
        .rawQuery('''SELECT count(*) as ns_count FROM PlaylistTrack
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO PlaylistTrack (playlist_id,
track_id) 
       VALUES(?, ?)''', [
      playlistId,
      trackId,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('PlaylistTrack', toDB(),
        where: "playlist_id = ? AND track_id = ?",
        whereArgs: [playlistId, trackId]);
  }

  static Future<PlaylistTrack?> getById(
    Database database,
    int playlistId,
    int trackId, {
    Set<WhereModel<dynamic, PlaylistTrackSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM PlaylistTrack playlist_track
${const PlaylistTrackSetArgs('', '').leftJoin('playlist_track')}
WHERE playlist_track.playlistId = ? AND playlist_track.trackId = ?
''', [playlistId, trackId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList = res
        .groupBy((e) => [
              e[PlaylistTrackSetArgs.playlistId.nameCast],
              e[PlaylistTrackSetArgs.trackId.nameCast]
            ])
        .values
        .first;
    return PlaylistTrack.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM PlaylistTrack playlist_track WHERE playlist_track.playlistId = ? AND playlist_track.trackId = ?''',
        [playlistId, trackId]);
  }

  static Future<void> deleteById(
    Database database,
    int playlistId,
    int trackId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM PlaylistTrack playlist_track WHERE playlist_track.playlistId = ? AND playlist_track.trackId = ?''',
        [playlistId, trackId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM PlaylistTrack''');
  }

  static PlaylistTrack $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      PlaylistTrack(
          playlistId: json['${childName}playlist_track_playlist_id'] as int,
          trackId: json['${childName}playlist_track_track_id'] as int);
  Map<String, dynamic> $toDB() =>
      {'playlist_id': playlistId, 'track_id': trackId};
}

class $PlaylistTrackSetArgs<T, M> extends WhereModel<T, M> {
  const $PlaylistTrackSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class PlaylistTrackSetArgs<T> {
  const PlaylistTrackSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $PlaylistTrackSetArgs<int, PlaylistTrackSet> playlistId =
      $PlaylistTrackSetArgs<int, PlaylistTrackSet>(
    name: 'playlist_id',
    nameCast: 'playlist_track_playlist_id',
    model: 'playlist_track',
  );

  static const $PlaylistTrackSetArgs<int, PlaylistTrackSet> trackId =
      $PlaylistTrackSetArgs<int, PlaylistTrackSet>(
    name: 'track_id',
    nameCast: 'playlist_track_track_id',
    model: 'playlist_track',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN PlaylistTrack ${self}playlist_track ON ${self}playlist_track.playlistId = $parentModel.${self2}playlistId AND ${self}playlist_track.trackId = $parentModel.${self2}trackId''',
      ].join('\n');

  $PlaylistTrackSetArgs<int, T> get $playlistId =>
      $PlaylistTrackSetArgs<int, T>(
        name: 'playlist_id',
        nameCast: 'playlist_track_playlist_id',
        model: 'playlist_track',
        self: this.self,
      );

  $PlaylistTrackSetArgs<int, T> get $trackId => $PlaylistTrackSetArgs<int, T>(
        name: 'track_id',
        nameCast: 'playlist_track_track_id',
        model: 'playlist_track',
        self: this.self,
      );
}

class PlaylistTrackSet {
  const PlaylistTrackSet();
}
