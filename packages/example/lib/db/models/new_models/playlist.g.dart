// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $PlaylistQuerySample on Playlist {
  static const String selectAll = '''
	SELECT
			playlist_id,
			name
	FROM Playlist;''';
}

class PlaylistFilter {
  const PlaylistFilter(this.value);

  final String value;

  PlaylistFilter get sortByPlaylistId => const PlaylistFilter('playlist_id');

  PlaylistFilter get sortByName => const PlaylistFilter('name');

  PlaylistFilter get sortByPlaylistIdDesc =>
      const PlaylistFilter('playlist_id DESC');

  PlaylistFilter get sortByNameDesc => const PlaylistFilter('name DESC');
}

class PlaylistWhere {
  const PlaylistWhere(this.value);

  final String value;

  PlaylistWhere or() => PlaylistWhere(" or ");

  PlaylistWhere playlistIdEqual(dynamic value) =>
      PlaylistWhere("playlist_id = $value");

  PlaylistWhere playlistIdNotEqual(dynamic value) =>
      PlaylistWhere("playlist_id != $value");

  PlaylistWhere nameEqual(dynamic value) => PlaylistWhere("name = '$value'");

  PlaylistWhere nameNotEqual(dynamic value) =>
      PlaylistWhere("name != '$value'");
}

extension PlaylistQuery on Playlist {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Playlist(
			playlist_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, PlaylistSet>> $default = {
    PlaylistSetArgs.playlistId,
    PlaylistSetArgs.name,
  };

  static String $createSelect(Set<WhereModel<dynamic, PlaylistSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Playlist>> getAll(
    Database database, {
    Set<WhereModel<dynamic, PlaylistSet>>? select,
    Set<WhereResult<dynamic, PlaylistSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$PlaylistSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Playlist playlist
${const PlaylistSetArgs('', '').leftJoin('playlist')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Playlist $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[PlaylistSetArgs.playlistId.nameCast]]))
        .values
        .map((e) => Playlist.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Playlist>> top(
    Database database, {
    Set<WhereModel<dynamic, PlaylistSet>>? select,
    Set<WhereResult<dynamic, PlaylistSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$PlaylistSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Playlist
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO Playlist (playlist_id,
name) 
       VALUES(?, ?)''', [
      playlistId,
      name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('Playlist', toDB(),
        where: "playlist_id = ?", whereArgs: [playlistId]);
  }

  static Future<Playlist?> getById(
    Database database,
    int playlistId, {
    Set<WhereModel<dynamic, PlaylistSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Playlist playlist
${const PlaylistSetArgs('', '').leftJoin('playlist')}
WHERE playlist.playlistId = ?
''', [playlistId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList = res
        .groupBy((e) => [e[PlaylistSetArgs.playlistId.nameCast]])
        .values
        .first;
    return Playlist.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Playlist playlist WHERE playlist.playlistId = ?''',
        [playlistId]);
  }

  static Future<void> deleteById(
    Database database,
    int playlistId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Playlist playlist WHERE playlist.playlistId = ?''',
        [playlistId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Playlist''');
  }

  static Playlist $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Playlist(
          playlistId: json['${childName}playlist_playlist_id'] as int,
          name: json['${childName}playlist_name'] as String);
  Map<String, dynamic> $toDB() => {'playlist_id': playlistId, 'name': name};
}

class $PlaylistSetArgs<T, M> extends WhereModel<T, M> {
  const $PlaylistSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class PlaylistSetArgs<T> {
  const PlaylistSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $PlaylistSetArgs<int, PlaylistSet> playlistId =
      $PlaylistSetArgs<int, PlaylistSet>(
    name: 'playlist_id',
    nameCast: 'playlist_playlist_id',
    model: 'playlist',
  );

  static const $PlaylistSetArgs<String, PlaylistSet> name =
      $PlaylistSetArgs<String, PlaylistSet>(
    name: 'name',
    nameCast: 'playlist_name',
    model: 'playlist',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Playlist ${self}playlist ON ${self}playlist.playlistId = $parentModel.${self2}playlistId''',
      ].join('\n');

  $PlaylistSetArgs<int, T> get $playlistId => $PlaylistSetArgs<int, T>(
        name: 'playlist_id',
        nameCast: 'playlist_playlist_id',
        model: 'playlist',
        self: this.self,
      );

  $PlaylistSetArgs<String, T> get $name => $PlaylistSetArgs<String, T>(
        name: 'name',
        nameCast: 'playlist_name',
        model: 'playlist',
        self: this.self,
      );
}

class PlaylistSet {
  const PlaylistSet();
}
