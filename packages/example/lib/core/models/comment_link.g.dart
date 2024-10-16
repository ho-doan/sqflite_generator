// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_link.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension CommentLinkModelQuery on CommentLinkModel {
  static const String createTable =
      '''CREATE TABLE IF NOT EXISTS CommentLinkModel(
		comment_id INTEGER NOT NULL,
			sub_no INTEGER NOT NULL,
			attached_id INTEGER NOT NULL,
			link_type INTEGER NOT NULL,
			order_index INTEGER NOT NULL,
			target_system INTEGER NOT NULL,
			link_detail TEXT NOT NULL,
			link_text TEXT NOT NULL,
			stamp_date INTEGER NOT NULL,
			stamp_time INTEGER NOT NULL,
			PRIMARY KEY(commentId, subNo)
	)''';

  static const Map<int, List<String>> alter = {};

  static const $CommentLinkModelSetArgs<int> commentId =
      $CommentLinkModelSetArgs(
    name: 'comment_id',
    nameCast: 'comment_link_model_comment_id',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> subNo = $CommentLinkModelSetArgs(
    name: 'sub_no',
    nameCast: 'comment_link_model_sub_no',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> attachedId =
      $CommentLinkModelSetArgs(
    name: 'attached_id',
    nameCast: 'comment_link_model_attached_id',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> linkType =
      $CommentLinkModelSetArgs(
    name: 'link_type',
    nameCast: 'comment_link_model_link_type',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> orderIndex =
      $CommentLinkModelSetArgs(
    name: 'order_index',
    nameCast: 'comment_link_model_order_index',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> targetSystem =
      $CommentLinkModelSetArgs(
    name: 'target_system',
    nameCast: 'comment_link_model_target_system',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<String> linkDetail =
      $CommentLinkModelSetArgs(
    name: 'link_detail',
    nameCast: 'comment_link_model_link_detail',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<String> linkText =
      $CommentLinkModelSetArgs(
    name: 'link_text',
    nameCast: 'comment_link_model_link_text',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> stampDate =
      $CommentLinkModelSetArgs(
    name: 'stamp_date',
    nameCast: 'comment_link_model_stamp_date',
    model: 'comment_link_model',
  );

  static const $CommentLinkModelSetArgs<int> stampTime =
      $CommentLinkModelSetArgs(
    name: 'stamp_time',
    nameCast: 'comment_link_model_stamp_time',
    model: 'comment_link_model',
  );

  static Set<$CommentLinkModelSetArgs> $default = {
    CommentLinkModelQuery.commentId,
    CommentLinkModelQuery.subNo,
    CommentLinkModelQuery.attachedId,
    CommentLinkModelQuery.linkType,
    CommentLinkModelQuery.orderIndex,
    CommentLinkModelQuery.targetSystem,
    CommentLinkModelQuery.linkDetail,
    CommentLinkModelQuery.linkText,
    CommentLinkModelQuery.stampDate,
    CommentLinkModelQuery.stampTime,
  };

  static String $createSelect(
    Set<$CommentLinkModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<CommentLinkModel>> getAll(
    Database database, {
    Set<$CommentLinkModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CommentLinkModelSetArgs>>? orderBy,
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
        '''SELECT ${$createSelect(select)} FROM CommentLinkModel comment_link_model
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all CommentLinkModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[CommentLinkModelQuery.commentId.nameCast]))
        .values
        .map((e) => CommentLinkModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<CommentLinkModel>> top(
    Database database, {
    Set<$CommentLinkModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CommentLinkModelSetArgs>>? orderBy,
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
        .rawQuery('''SELECT count(*) as ns_count FROM CommentLinkModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO CommentLinkModel (comment_id,
sub_no,
attached_id,
link_type,
order_index,
target_system,
link_detail,
link_text,
stamp_date,
stamp_time) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      this.commentId,
      this.subNo,
      this.attachedId,
      this.linkType,
      this.orderIndex,
      this.targetSystem,
      this.linkDetail,
      this.linkText,
      this.stampDate,
      this.stampTime,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('CommentLinkModel', toDB(),
        where: "comment_id = ? AND sub_no = ?",
        whereArgs: [this.commentId, this.subNo]);
  }

  static Future<CommentLinkModel?> getById(
    Database database,
    int commentId,
    int subNo, {
    Set<$CommentLinkModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM CommentLinkModel comment_link_model
WHERE comment_link_model.comment_id = ? AND comment_link_model.sub_no = ?
''', [commentId, subNo]) as List<Map>);
    return res.isNotEmpty ? CommentLinkModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM CommentLinkModel comment_link_model WHERE comment_link_model.comment_id = ? AND comment_link_model.sub_no = ?''',
        [this.commentId, this.subNo]);
  }

  static Future<void> deleteById(
    Database database,
    int commentId,
    int subNo,
  ) async {
    await database.rawQuery(
        '''DELETE FROM CommentLinkModel comment_link_model WHERE comment_link_model.comment_id = ? AND comment_link_model.sub_no = ?''',
        [commentId, subNo]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM CommentLinkModel''');
  }

  static CommentLinkModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      CommentLinkModel(
        commentId: json['${childName}comment_link_model_comment_id'] as int,
        subNo: json['${childName}comment_link_model_sub_no'] as int,
        attachedId: json['${childName}comment_link_model_attached_id'] as int,
        linkType: json['${childName}comment_link_model_link_type'] as int,
        orderIndex: json['${childName}comment_link_model_order_index'] as int,
        targetSystem:
            json['${childName}comment_link_model_target_system'] as int,
        linkDetail:
            json['${childName}comment_link_model_link_detail'] as String,
        linkText: json['${childName}comment_link_model_link_text'] as String,
        stampDate: json['${childName}comment_link_model_stamp_date'] as int,
        stampTime: json['${childName}comment_link_model_stamp_time'] as int,
      );
  Map<String, dynamic> $toDB() => {
        'comment_id': this.commentId,
        'sub_no': this.subNo,
        'attached_id': this.attachedId,
        'link_type': this.linkType,
        'order_index': this.orderIndex,
        'target_system': this.targetSystem,
        'link_detail': this.linkDetail,
        'link_text': this.linkText,
        'stamp_date': this.stampDate,
        'stamp_time': this.stampTime,
      };
}

class $CommentLinkModelSetArgs<T> extends WhereModel<T> {
  const $CommentLinkModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
