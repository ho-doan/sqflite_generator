// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension UserProfileQuery on UserProfile {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS UserProfile(
		user_no INTEGER PRIMARY KEY NOT NULL,
			name TEXT,
			photo_id INTEGER,
			greeting TEXT,
			stamp_date INTEGER NOT NULL,
			stamp_time INTEGER NOT NULL
	)''';

  static const Map<int, List<String>> alter = {};

  static const $UserProfileSetArgs<int> userNo = $UserProfileSetArgs(
    name: 'user_no',
    nameCast: 'user_profile_user_no',
    model: 'user_profile',
  );

  static const $UserProfileSetArgs<String> name = $UserProfileSetArgs(
    name: 'name',
    nameCast: 'user_profile_name',
    model: 'user_profile',
  );

  static const $UserProfileSetArgs<int> photoId = $UserProfileSetArgs(
    name: 'photo_id',
    nameCast: 'user_profile_photo_id',
    model: 'user_profile',
  );

  static const $UserProfileSetArgs<String> greeting = $UserProfileSetArgs(
    name: 'greeting',
    nameCast: 'user_profile_greeting',
    model: 'user_profile',
  );

  static const $UserProfileSetArgs<int> stampDate = $UserProfileSetArgs(
    name: 'stamp_date',
    nameCast: 'user_profile_stamp_date',
    model: 'user_profile',
  );

  static const $UserProfileSetArgs<int> stampTime = $UserProfileSetArgs(
    name: 'stamp_time',
    nameCast: 'user_profile_stamp_time',
    model: 'user_profile',
  );

  static Set<$UserProfileSetArgs> $default = {
    UserProfileQuery.userNo,
    UserProfileQuery.name,
    UserProfileQuery.photoId,
    UserProfileQuery.greeting,
    UserProfileQuery.stampDate,
    UserProfileQuery.stampTime,
  };

  static String $createSelect(
    Set<$UserProfileSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<UserProfile>> getAll(
    Database database, {
    Set<$UserProfileSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$UserProfileSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM UserProfile user_profile
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all UserProfile $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[UserProfileQuery.userNo.nameCast]))
        .values
        .map((e) => UserProfile.fromDB(e.first, e))
        .toList();
  }

  static Future<List<UserProfile>> top(
    Database database, {
    Set<$UserProfileSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$UserProfileSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM UserProfile
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO UserProfile (user_no,
name,
photo_id,
greeting,
stamp_date,
stamp_time) 
       VALUES(?, ?, ?, ?, ?, ?)''', [
      this.userNo,
      this.name,
      this.photoId,
      this.greeting,
      this.stampDate,
      this.stampTime,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('UserProfile', toDB(),
        where: "user_no = ?", whereArgs: [this.userNo]);
  }

  static Future<UserProfile?> getById(
    Database database,
    int userNo, {
    Set<$UserProfileSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM UserProfile user_profile
WHERE user_profile.user_no = ?
''', [userNo]) as List<Map>);
    return res.isNotEmpty ? UserProfile.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM UserProfile user_profile WHERE user_profile.user_no = ?''',
        [this.userNo]);
  }

  static Future<void> deleteById(
    Database database,
    int userNo,
  ) async {
    await database.rawQuery(
        '''DELETE FROM UserProfile user_profile WHERE user_profile.user_no = ?''',
        [userNo]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM UserProfile''');
  }

  static UserProfile $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      UserProfile(
        userNo: json['${childName}user_profile_user_no'] as int,
        name: json['${childName}user_profile_name'] as String?,
        photoId: json['${childName}user_profile_photo_id'] as int?,
        greeting: json['${childName}user_profile_greeting'] as String?,
        stampDate: json['${childName}user_profile_stamp_date'] as int,
        stampTime: json['${childName}user_profile_stamp_time'] as int,
      );
  Map<String, dynamic> $toDB() => {
        'user_no': this.userNo,
        'name': this.name,
        'photo_id': this.photoId,
        'greeting': this.greeting,
        'stamp_date': this.stampDate,
        'stamp_time': this.stampTime,
      };
}

class $UserProfileSetArgs<T> extends WhereModel<T> {
  const $UserProfileSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
