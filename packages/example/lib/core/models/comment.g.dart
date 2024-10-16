// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension CommentModelQuery on CommentModel {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS CommentModel(
		comment_id INTEGER PRIMARY KEY NOT NULL,
			delete_flag INTEGER NOT NULL,
			status_code INTEGER NOT NULL,
			value TEXT NOT NULL,
			transaction_id TEXT NOT NULL,
			owner_id INTEGER NOT NULL,
			create_date INTEGER NOT NULL,
			create_time INTEGER NOT NULL,
			stamp_date INTEGER NOT NULL,
			stamp_time INTEGER NOT NULL,
			hospital_code INTEGER NOT NULL,
			patient_index INTEGER NOT NULL,
			order_index INTEGER NOT NULL,
			talk_id INTEGER NOT NULL,
			FOREIGN KEY (talk_id) REFERENCES TalkModel (talk_id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const Map<int, List<String>> alter = {};

  static const $CommentModelSetArgs<int> commentId = $CommentModelSetArgs(
    name: 'comment_id',
    nameCast: 'comment_model_comment_id',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdTalkId =
      $CommentModelSetArgs(
    name: 'talk_id',
    nameCast: 'talk_model_talk_id',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<String> talkModelTalkIdOwnerId =
      $CommentModelSetArgs(
    name: 'owner_id',
    nameCast: 'talk_model_owner_id',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdDeleteFlag =
      $CommentModelSetArgs(
    name: 'delete_flag',
    nameCast: 'talk_model_delete_flag',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdTalkType =
      $CommentModelSetArgs(
    name: 'talk_type',
    nameCast: 'talk_model_talk_type',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdTypeCode =
      $CommentModelSetArgs(
    name: 'type_code',
    nameCast: 'talk_model_type_code',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<String> talkModelTalkIdTitle =
      $CommentModelSetArgs(
    name: 'title',
    nameCast: 'talk_model_title',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdCreateDate =
      $CommentModelSetArgs(
    name: 'create_date',
    nameCast: 'talk_model_create_date',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdCreateTime =
      $CommentModelSetArgs(
    name: 'create_time',
    nameCast: 'talk_model_create_time',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdStampDate =
      $CommentModelSetArgs(
    name: 'stamp_date',
    nameCast: 'talk_model_stamp_date',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdStampTime =
      $CommentModelSetArgs(
    name: 'stamp_time',
    nameCast: 'talk_model_stamp_time',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> talkModelTalkIdHospitalCode =
      $CommentModelSetArgs(
    name: 'hospital_code',
    nameCast: 'talk_model_hospital_code',
    model: 'talk_id_talk_model',
  );

  static const $CommentModelSetArgs<int> deleteFlag = $CommentModelSetArgs(
    name: 'delete_flag',
    nameCast: 'comment_model_delete_flag',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> statusCode = $CommentModelSetArgs(
    name: 'status_code',
    nameCast: 'comment_model_status_code',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<String> value = $CommentModelSetArgs(
    name: 'value',
    nameCast: 'comment_model_value',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<String> transactionId =
      $CommentModelSetArgs(
    name: 'transaction_id',
    nameCast: 'comment_model_transaction_id',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> ownerId = $CommentModelSetArgs(
    name: 'owner_id',
    nameCast: 'comment_model_owner_id',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> createDate = $CommentModelSetArgs(
    name: 'create_date',
    nameCast: 'comment_model_create_date',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> createTime = $CommentModelSetArgs(
    name: 'create_time',
    nameCast: 'comment_model_create_time',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> stampDate = $CommentModelSetArgs(
    name: 'stamp_date',
    nameCast: 'comment_model_stamp_date',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> stampTime = $CommentModelSetArgs(
    name: 'stamp_time',
    nameCast: 'comment_model_stamp_time',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> hospitalCode = $CommentModelSetArgs(
    name: 'hospital_code',
    nameCast: 'comment_model_hospital_code',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> patientIndex = $CommentModelSetArgs(
    name: 'patient_index',
    nameCast: 'comment_model_patient_index',
    model: 'comment_model',
  );

  static const $CommentModelSetArgs<int> orderIndex = $CommentModelSetArgs(
    name: 'order_index',
    nameCast: 'comment_model_order_index',
    model: 'comment_model',
  );

  static Set<$CommentModelSetArgs> $default = {
    CommentModelQuery.commentId,
    CommentModelQuery.talkModelTalkIdTalkId,
    CommentModelQuery.talkModelTalkIdOwnerId,
    CommentModelQuery.talkModelTalkIdDeleteFlag,
    CommentModelQuery.talkModelTalkIdTalkType,
    CommentModelQuery.talkModelTalkIdTypeCode,
    CommentModelQuery.talkModelTalkIdTitle,
    CommentModelQuery.talkModelTalkIdCreateDate,
    CommentModelQuery.talkModelTalkIdCreateTime,
    CommentModelQuery.talkModelTalkIdStampDate,
    CommentModelQuery.talkModelTalkIdStampTime,
    CommentModelQuery.talkModelTalkIdHospitalCode,
    CommentModelQuery.deleteFlag,
    CommentModelQuery.statusCode,
    CommentModelQuery.value,
    CommentModelQuery.transactionId,
    CommentModelQuery.ownerId,
    CommentModelQuery.createDate,
    CommentModelQuery.createTime,
    CommentModelQuery.stampDate,
    CommentModelQuery.stampTime,
    CommentModelQuery.hospitalCode,
    CommentModelQuery.patientIndex,
    CommentModelQuery.orderIndex,
  };

  static String $createSelect(
    Set<$CommentModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<CommentModel>> getAll(
    Database database, {
    Set<$CommentModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CommentModelSetArgs>>? orderBy,
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
        '''SELECT ${$createSelect(select)} FROM CommentModel comment_model
 LEFT JOIN TalkModel talk_model ON talk_model.talk_id = comment_model.talk_id
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all CommentModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[CommentModelQuery.commentId.nameCast]))
        .values
        .map((e) => CommentModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<CommentModel>> top(
    Database database, {
    Set<$CommentModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CommentModelSetArgs>>? orderBy,
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
        .rawQuery('''SELECT count(*) as ns_count FROM CommentModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $talkModelIdTalkId = await talkId.insert(database);
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO CommentModel (comment_id,
talk_id,
delete_flag,
status_code,
value,
transaction_id,
owner_id,
create_date,
create_time,
stamp_date,
stamp_time,
hospital_code,
patient_index,
order_index) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      this.commentId,
      $talkModelIdTalkId,
      this.deleteFlag,
      this.statusCode,
      this.value,
      this.transactionId,
      this.ownerId,
      this.createDate,
      this.createTime,
      this.stampDate,
      this.stampTime,
      this.hospitalCode,
      this.patientIndex,
      this.orderIndex,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await talkId.update(database);
    return await database.update('CommentModel', toDB(),
        where: "comment_id = ?", whereArgs: [this.commentId]);
  }

  static Future<CommentModel?> getById(
    Database database,
    int commentId, {
    Set<$CommentModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM CommentModel comment_model
 LEFT JOIN TalkModel talk_model ON talk_model.talk_id = comment_model.talk_id
WHERE comment_model.comment_id = ?
''', [commentId]) as List<Map>);
    return res.isNotEmpty ? CommentModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM CommentModel comment_model WHERE comment_model.comment_id = ?''',
        [this.commentId]);
  }

  static Future<void> deleteById(
    Database database,
    int commentId,
  ) async {
    await database.rawQuery(
        '''DELETE FROM CommentModel comment_model WHERE comment_model.comment_id = ?''',
        [commentId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM CommentModel''');
  }

  static CommentModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      CommentModel(
        commentId: json['${childName}comment_model_comment_id'] as int,
        talkId: TalkModel.fromDB(json, []),
        deleteFlag: json['${childName}comment_model_delete_flag'] as int,
        statusCode: json['${childName}comment_model_status_code'] as int,
        value: json['${childName}comment_model_value'] as String,
        transactionId:
            json['${childName}comment_model_transaction_id'] as String,
        ownerId: json['${childName}comment_model_owner_id'] as int,
        createDate: json['${childName}comment_model_create_date'] as int,
        createTime: json['${childName}comment_model_create_time'] as int,
        stampDate: json['${childName}comment_model_stamp_date'] as int,
        stampTime: json['${childName}comment_model_stamp_time'] as int,
        hospitalCode: json['${childName}comment_model_hospital_code'] as int,
        patientIndex: json['${childName}comment_model_patient_index'] as int,
        orderIndex: json['${childName}comment_model_order_index'] as int,
      );
  Map<String, dynamic> $toDB() => {
        'comment_id': this.commentId,
        'talk_id': talkId.talkId,
        'delete_flag': this.deleteFlag,
        'status_code': this.statusCode,
        'value': this.value,
        'transaction_id': this.transactionId,
        'owner_id': this.ownerId,
        'create_date': this.createDate,
        'create_time': this.createTime,
        'stamp_date': this.stampDate,
        'stamp_time': this.stampTime,
        'hospital_code': this.hospitalCode,
        'patient_index': this.patientIndex,
        'order_index': this.orderIndex,
      };
}

class $CommentModelSetArgs<T> extends WhereModel<T> {
  const $CommentModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
