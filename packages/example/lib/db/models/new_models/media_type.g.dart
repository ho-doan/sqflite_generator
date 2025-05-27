// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $MediaTypeQuerySample on MediaType {
  static const String selectAll = '''
	SELECT
			media_type_id,
			name
	FROM MediaType;''';
}

class MediaTypeFilter {
  const MediaTypeFilter(this.value);

  final String value;

  MediaTypeFilter get sortByMediaTypeId =>
      const MediaTypeFilter('media_type_id');

  MediaTypeFilter get sortByName => const MediaTypeFilter('name');

  MediaTypeFilter get sortByMediaTypeIdDesc =>
      const MediaTypeFilter('media_type_id DESC');

  MediaTypeFilter get sortByNameDesc => const MediaTypeFilter('name DESC');
}

class MediaTypeWhere {
  const MediaTypeWhere(this.value);

  final String value;

  MediaTypeWhere or() => MediaTypeWhere(" or ");

  MediaTypeWhere mediaTypeIdEqual(dynamic value) =>
      MediaTypeWhere("media_type_id = $value");

  MediaTypeWhere mediaTypeIdNotEqual(dynamic value) =>
      MediaTypeWhere("media_type_id != $value");

  MediaTypeWhere nameEqual(dynamic value) => MediaTypeWhere("name = '$value'");

  MediaTypeWhere nameNotEqual(dynamic value) =>
      MediaTypeWhere("name != '$value'");
}

extension MediaTypeQuery on MediaType {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS MediaType(
			media_type_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, MediaTypeSet>> $default = {
    MediaTypeSetArgs.mediaTypeId,
    MediaTypeSetArgs.name,
  };

  static String $createSelect(Set<WhereModel<dynamic, MediaTypeSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<MediaType>> getAll(
    Database database, {
    Set<WhereModel<dynamic, MediaTypeSet>>? select,
    Set<WhereResult<dynamic, MediaTypeSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$MediaTypeSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM MediaType media_type
${const MediaTypeSetArgs('', '').leftJoin('media_type')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all MediaType $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[MediaTypeSetArgs.mediaTypeId.nameCast]]))
        .values
        .map((e) => MediaType.fromDB(e.first, e))
        .toList();
  }

  static Future<List<MediaType>> top(
    Database database, {
    Set<WhereModel<dynamic, MediaTypeSet>>? select,
    Set<WhereResult<dynamic, MediaTypeSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$MediaTypeSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM MediaType
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO MediaType (media_type_id,
name) 
       VALUES(?, ?)''', [
      mediaTypeId,
      name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('MediaType', toDB(),
        where: "media_type_id = ?", whereArgs: [mediaTypeId]);
  }

  static Future<MediaType?> getById(
    Database database,
    int mediaTypeId, {
    Set<WhereModel<dynamic, MediaTypeSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM MediaType media_type
${const MediaTypeSetArgs('', '').leftJoin('media_type')}
WHERE media_type.mediaTypeId = ?
''', [mediaTypeId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList = res
        .groupBy((e) => [e[MediaTypeSetArgs.mediaTypeId.nameCast]])
        .values
        .first;
    return MediaType.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM MediaType media_type WHERE media_type.mediaTypeId = ?''',
        [mediaTypeId]);
  }

  static Future<void> deleteById(
    Database database,
    int mediaTypeId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM MediaType media_type WHERE media_type.mediaTypeId = ?''',
        [mediaTypeId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM MediaType''');
  }

  static MediaType $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      MediaType(
          mediaTypeId: json['${childName}media_type_media_type_id'] as int,
          name: json['${childName}media_type_name'] as String);
  Map<String, dynamic> $toDB() => {'media_type_id': mediaTypeId, 'name': name};
}

class $MediaTypeSetArgs<T, M> extends WhereModel<T, M> {
  const $MediaTypeSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class MediaTypeSetArgs<T> {
  const MediaTypeSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $MediaTypeSetArgs<int, MediaTypeSet> mediaTypeId =
      $MediaTypeSetArgs<int, MediaTypeSet>(
    name: 'media_type_id',
    nameCast: 'media_type_media_type_id',
    model: 'media_type',
  );

  static const $MediaTypeSetArgs<String, MediaTypeSet> name =
      $MediaTypeSetArgs<String, MediaTypeSet>(
    name: 'name',
    nameCast: 'media_type_name',
    model: 'media_type',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN MediaType ${self}media_type ON ${self}media_type.mediaTypeId = $parentModel.${self2}mediaTypeId''',
      ].join('\n');

  $MediaTypeSetArgs<int, T> get $mediaTypeId => $MediaTypeSetArgs<int, T>(
        name: 'media_type_id',
        nameCast: 'media_type_media_type_id',
        model: 'media_type',
        self: this.self,
      );

  $MediaTypeSetArgs<String, T> get $name => $MediaTypeSetArgs<String, T>(
        name: 'name',
        nameCast: 'media_type_name',
        model: 'media_type',
        self: this.self,
      );
}

class MediaTypeSet {
  const MediaTypeSet();
}
