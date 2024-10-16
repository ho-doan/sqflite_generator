// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension UserModelQuery on UserModel {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS UserModel(
		user_no INTEGER PRIMARY KEY,
			user_id TEXT,
			password_id TEXT,
			short_name TEXT,
			name TEXT,
			kana_name TEXT,
			post_code INTEGER,
			post_name TEXT,
			depart_code TEXT,
			ward TEXT,
			sick_room TEXT,
			hospital_no INTEGER,
			grp_no INTEGER,
			job_type INTEGER,
			position INTEGER,
			group_id INTEGER,
			update_date INTEGER,
			update_time INTEGER,
			admin_type INTEGER
	)''';

  static const Map<int, List<String>> alter = {};

  static const $UserModelSetArgs<int> userNo = $UserModelSetArgs(
    name: 'user_no',
    nameCast: 'user_model_user_no',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> userID = $UserModelSetArgs(
    name: 'user_id',
    nameCast: 'user_model_user_id',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> passwordID = $UserModelSetArgs(
    name: 'password_id',
    nameCast: 'user_model_password_id',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> shortName = $UserModelSetArgs(
    name: 'short_name',
    nameCast: 'user_model_short_name',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> name = $UserModelSetArgs(
    name: 'name',
    nameCast: 'user_model_name',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> kanaName = $UserModelSetArgs(
    name: 'kana_name',
    nameCast: 'user_model_kana_name',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> postCode = $UserModelSetArgs(
    name: 'post_code',
    nameCast: 'user_model_post_code',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> postName = $UserModelSetArgs(
    name: 'post_name',
    nameCast: 'user_model_post_name',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> departCode = $UserModelSetArgs(
    name: 'depart_code',
    nameCast: 'user_model_depart_code',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> ward = $UserModelSetArgs(
    name: 'ward',
    nameCast: 'user_model_ward',
    model: 'user_model',
  );

  static const $UserModelSetArgs<String> sickRoom = $UserModelSetArgs(
    name: 'sick_room',
    nameCast: 'user_model_sick_room',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> hospitalNo = $UserModelSetArgs(
    name: 'hospital_no',
    nameCast: 'user_model_hospital_no',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> grpNo = $UserModelSetArgs(
    name: 'grp_no',
    nameCast: 'user_model_grp_no',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> jobType = $UserModelSetArgs(
    name: 'job_type',
    nameCast: 'user_model_job_type',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> position = $UserModelSetArgs(
    name: 'position',
    nameCast: 'user_model_position',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> groupID = $UserModelSetArgs(
    name: 'group_id',
    nameCast: 'user_model_group_id',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> updateDate = $UserModelSetArgs(
    name: 'update_date',
    nameCast: 'user_model_update_date',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> updateTime = $UserModelSetArgs(
    name: 'update_time',
    nameCast: 'user_model_update_time',
    model: 'user_model',
  );

  static const $UserModelSetArgs<int> adminType = $UserModelSetArgs(
    name: 'admin_type',
    nameCast: 'user_model_admin_type',
    model: 'user_model',
  );

  static Set<$UserModelSetArgs> $default = {
    UserModelQuery.userNo,
    UserModelQuery.userID,
    UserModelQuery.passwordID,
    UserModelQuery.shortName,
    UserModelQuery.name,
    UserModelQuery.kanaName,
    UserModelQuery.postCode,
    UserModelQuery.postName,
    UserModelQuery.departCode,
    UserModelQuery.ward,
    UserModelQuery.sickRoom,
    UserModelQuery.hospitalNo,
    UserModelQuery.grpNo,
    UserModelQuery.jobType,
    UserModelQuery.position,
    UserModelQuery.groupID,
    UserModelQuery.updateDate,
    UserModelQuery.updateTime,
    UserModelQuery.adminType,
  };

  static String $createSelect(
    Set<$UserModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<UserModel>> getAll(
    Database database, {
    Set<$UserModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$UserModelSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM UserModel user_model
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all UserModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[UserModelQuery.userNo.nameCast]))
        .values
        .map((e) => UserModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<UserModel>> top(
    Database database, {
    Set<$UserModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$UserModelSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM UserModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO UserModel (user_no,
user_id,
password_id,
short_name,
name,
kana_name,
post_code,
post_name,
depart_code,
ward,
sick_room,
hospital_no,
grp_no,
job_type,
position,
group_id,
update_date,
update_time,
admin_type) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      this.userNo,
      this.userID,
      this.passwordID,
      this.shortName,
      this.name,
      this.kanaName,
      this.postCode,
      this.postName,
      this.departCode,
      this.ward,
      this.sickRoom,
      this.hospitalNo,
      this.grpNo,
      this.jobType,
      this.position,
      this.groupID,
      this.updateDate,
      this.updateTime,
      this.adminType,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('UserModel', toDB(),
        where: "user_no = ?", whereArgs: [this.userNo]);
  }

  static Future<UserModel?> getById(
    Database database,
    int? userNo, {
    Set<$UserModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM UserModel user_model
WHERE user_model.user_no = ?
''', [userNo]) as List<Map>);
    return res.isNotEmpty ? UserModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM UserModel user_model WHERE user_model.user_no = ?''',
        [this.userNo]);
  }

  static Future<void> deleteById(
    Database database,
    int? userNo,
  ) async {
    await database.rawQuery(
        '''DELETE FROM UserModel user_model WHERE user_model.user_no = ?''',
        [userNo]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM UserModel''');
  }

  static UserModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      UserModel(
        userNo: json['${childName}user_model_user_no'] as int?,
        userID: json['${childName}user_model_user_id'] as String?,
        passwordID: json['${childName}user_model_password_id'] as String?,
        shortName: json['${childName}user_model_short_name'] as String?,
        name: json['${childName}user_model_name'] as String?,
        kanaName: json['${childName}user_model_kana_name'] as String?,
        postCode: json['${childName}user_model_post_code'] as int?,
        postName: json['${childName}user_model_post_name'] as String?,
        departCode: json['${childName}user_model_depart_code'] as String?,
        ward: json['${childName}user_model_ward'] as String?,
        sickRoom: json['${childName}user_model_sick_room'] as String?,
        hospitalNo: json['${childName}user_model_hospital_no'] as int?,
        grpNo: json['${childName}user_model_grp_no'] as int?,
        jobType: json['${childName}user_model_job_type'] as int?,
        position: json['${childName}user_model_position'] as int?,
        groupID: json['${childName}user_model_group_id'] as int?,
        updateDate: json['${childName}user_model_update_date'] as int?,
        updateTime: json['${childName}user_model_update_time'] as int?,
        adminType: json['${childName}user_model_admin_type'] as int?,
      );
  Map<String, dynamic> $toDB() => {
        'user_no': this.userNo,
        'user_id': this.userID,
        'password_id': this.passwordID,
        'short_name': this.shortName,
        'name': this.name,
        'kana_name': this.kanaName,
        'post_code': this.postCode,
        'post_name': this.postName,
        'depart_code': this.departCode,
        'ward': this.ward,
        'sick_room': this.sickRoom,
        'hospital_no': this.hospitalNo,
        'grp_no': this.grpNo,
        'job_type': this.jobType,
        'position': this.position,
        'group_id': this.groupID,
        'update_date': this.updateDate,
        'update_time': this.updateTime,
        'admin_type': this.adminType,
      };
}

class $UserModelSetArgs<T> extends WhereModel<T> {
  const $UserModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
