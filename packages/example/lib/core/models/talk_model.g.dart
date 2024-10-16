// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension TalkModelQuery on TalkModel {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS TalkModel(
		talk_id INTEGER PRIMARY KEY NOT NULL,
			delete_flag INTEGER NOT NULL,
			talk_type INTEGER NOT NULL,
			type_code INTEGER NOT NULL,
			title TEXT NOT NULL,
			create_date INTEGER NOT NULL,
			create_time INTEGER NOT NULL,
			stamp_date INTEGER NOT NULL,
			stamp_time INTEGER NOT NULL,
			hospital_code INTEGER NOT NULL,
			owner_id INTEGER NOT NULL,
			FOREIGN KEY (owner_id) REFERENCES UserModel (user_no) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const Map<int, List<String>> alter = {};

  static const $TalkModelSetArgs<int> talkId = $TalkModelSetArgs(
    name: 'talk_id',
    nameCast: 'talk_model_talk_id',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdUserNo =
      $TalkModelSetArgs(
    name: 'user_no',
    nameCast: 'user_model_user_no',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdUserId =
      $TalkModelSetArgs(
    name: 'user_id',
    nameCast: 'user_model_user_id',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdPasswordId =
      $TalkModelSetArgs(
    name: 'password_id',
    nameCast: 'user_model_password_id',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdShortName =
      $TalkModelSetArgs(
    name: 'short_name',
    nameCast: 'user_model_short_name',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdName =
      $TalkModelSetArgs(
    name: 'name',
    nameCast: 'user_model_name',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdKanaName =
      $TalkModelSetArgs(
    name: 'kana_name',
    nameCast: 'user_model_kana_name',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdPostCode =
      $TalkModelSetArgs(
    name: 'post_code',
    nameCast: 'user_model_post_code',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdPostName =
      $TalkModelSetArgs(
    name: 'post_name',
    nameCast: 'user_model_post_name',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdDepartCode =
      $TalkModelSetArgs(
    name: 'depart_code',
    nameCast: 'user_model_depart_code',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdWard =
      $TalkModelSetArgs(
    name: 'ward',
    nameCast: 'user_model_ward',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<String> userModelOwnerIdSickRoom =
      $TalkModelSetArgs(
    name: 'sick_room',
    nameCast: 'user_model_sick_room',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdHospitalNo =
      $TalkModelSetArgs(
    name: 'hospital_no',
    nameCast: 'user_model_hospital_no',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdGrpNo = $TalkModelSetArgs(
    name: 'grp_no',
    nameCast: 'user_model_grp_no',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdJobType =
      $TalkModelSetArgs(
    name: 'job_type',
    nameCast: 'user_model_job_type',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdPosition =
      $TalkModelSetArgs(
    name: 'position',
    nameCast: 'user_model_position',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdGroupId =
      $TalkModelSetArgs(
    name: 'group_id',
    nameCast: 'user_model_group_id',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdUpdateDate =
      $TalkModelSetArgs(
    name: 'update_date',
    nameCast: 'user_model_update_date',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdUpdateTime =
      $TalkModelSetArgs(
    name: 'update_time',
    nameCast: 'user_model_update_time',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> userModelOwnerIdAdminType =
      $TalkModelSetArgs(
    name: 'admin_type',
    nameCast: 'user_model_admin_type',
    model: 'owner_id_user_model',
  );

  static const $TalkModelSetArgs<int> deleteFlag = $TalkModelSetArgs(
    name: 'delete_flag',
    nameCast: 'talk_model_delete_flag',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> talkType = $TalkModelSetArgs(
    name: 'talk_type',
    nameCast: 'talk_model_talk_type',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> typeCode = $TalkModelSetArgs(
    name: 'type_code',
    nameCast: 'talk_model_type_code',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<String> title = $TalkModelSetArgs(
    name: 'title',
    nameCast: 'talk_model_title',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> createDate = $TalkModelSetArgs(
    name: 'create_date',
    nameCast: 'talk_model_create_date',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> createTime = $TalkModelSetArgs(
    name: 'create_time',
    nameCast: 'talk_model_create_time',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> stampDate = $TalkModelSetArgs(
    name: 'stamp_date',
    nameCast: 'talk_model_stamp_date',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> stampTime = $TalkModelSetArgs(
    name: 'stamp_time',
    nameCast: 'talk_model_stamp_time',
    model: 'talk_model',
  );

  static const $TalkModelSetArgs<int> hospitalCode = $TalkModelSetArgs(
    name: 'hospital_code',
    nameCast: 'talk_model_hospital_code',
    model: 'talk_model',
  );

  static Set<$TalkModelSetArgs> $default = {
    TalkModelQuery.talkId,
    TalkModelQuery.userModelOwnerIdUserNo,
    TalkModelQuery.userModelOwnerIdUserId,
    TalkModelQuery.userModelOwnerIdPasswordId,
    TalkModelQuery.userModelOwnerIdShortName,
    TalkModelQuery.userModelOwnerIdName,
    TalkModelQuery.userModelOwnerIdKanaName,
    TalkModelQuery.userModelOwnerIdPostCode,
    TalkModelQuery.userModelOwnerIdPostName,
    TalkModelQuery.userModelOwnerIdDepartCode,
    TalkModelQuery.userModelOwnerIdWard,
    TalkModelQuery.userModelOwnerIdSickRoom,
    TalkModelQuery.userModelOwnerIdHospitalNo,
    TalkModelQuery.userModelOwnerIdGrpNo,
    TalkModelQuery.userModelOwnerIdJobType,
    TalkModelQuery.userModelOwnerIdPosition,
    TalkModelQuery.userModelOwnerIdGroupId,
    TalkModelQuery.userModelOwnerIdUpdateDate,
    TalkModelQuery.userModelOwnerIdUpdateTime,
    TalkModelQuery.userModelOwnerIdAdminType,
    TalkModelQuery.deleteFlag,
    TalkModelQuery.talkType,
    TalkModelQuery.typeCode,
    TalkModelQuery.title,
    TalkModelQuery.createDate,
    TalkModelQuery.createTime,
    TalkModelQuery.stampDate,
    TalkModelQuery.stampTime,
    TalkModelQuery.hospitalCode,
  };

  static String $createSelect(
    Set<$TalkModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<TalkModel>> getAll(
    Database database, {
    Set<$TalkModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$TalkModelSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM TalkModel talk_model
 LEFT JOIN UserModel user_model ON user_model.user_no = talk_model.owner_id
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all TalkModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[TalkModelQuery.talkId.nameCast]))
        .values
        .map((e) => TalkModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<TalkModel>> top(
    Database database, {
    Set<$TalkModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$TalkModelSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM TalkModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $userModelIdOwnerId = await ownerId.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO TalkModel (talk_id,
owner_id,
delete_flag,
talk_type,
type_code,
title,
create_date,
create_time,
stamp_date,
stamp_time,
hospital_code) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      this.talkId,
      $userModelIdOwnerId,
      this.deleteFlag,
      this.talkType,
      this.typeCode,
      this.title,
      this.createDate,
      this.createTime,
      this.stampDate,
      this.stampTime,
      this.hospitalCode,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await ownerId.update(database);
    return await database.update('TalkModel', toDB(),
        where: "talk_id = ?", whereArgs: [this.talkId]);
  }

  static Future<TalkModel?> getById(
    Database database,
    int talkId, {
    Set<$TalkModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM TalkModel talk_model
 LEFT JOIN UserModel user_model ON user_model.user_no = talk_model.owner_id
WHERE talk_model.talk_id = ?
''', [talkId]) as List<Map>);
    return res.isNotEmpty ? TalkModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM TalkModel talk_model WHERE talk_model.talk_id = ?''',
        [this.talkId]);
  }

  static Future<void> deleteById(
    Database database,
    int talkId,
  ) async {
    await database.rawQuery(
        '''DELETE FROM TalkModel talk_model WHERE talk_model.talk_id = ?''',
        [talkId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM TalkModel''');
  }

  static TalkModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      TalkModel(
        talkId: json['${childName}talk_model_talk_id'] as int,
        ownerId: UserModel.fromDB(json, []),
        deleteFlag: json['${childName}talk_model_delete_flag'] as int,
        talkType: json['${childName}talk_model_talk_type'] as int,
        typeCode: json['${childName}talk_model_type_code'] as int,
        title: json['${childName}talk_model_title'] as String,
        createDate: json['${childName}talk_model_create_date'] as int,
        createTime: json['${childName}talk_model_create_time'] as int,
        stampDate: json['${childName}talk_model_stamp_date'] as int,
        stampTime: json['${childName}talk_model_stamp_time'] as int,
        hospitalCode: json['${childName}talk_model_hospital_code'] as int,
      );
  Map<String, dynamic> $toDB() => {
        'talk_id': this.talkId,
        'owner_id': ownerId.userNo,
        'delete_flag': this.deleteFlag,
        'talk_type': this.talkType,
        'type_code': this.typeCode,
        'title': this.title,
        'create_date': this.createDate,
        'create_time': this.createTime,
        'stamp_date': this.stampDate,
        'stamp_time': this.stampTime,
        'hospital_code': this.hospitalCode,
      };
}

class $TalkModelSetArgs<T> extends WhereModel<T> {
  const $TalkModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
