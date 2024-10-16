import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'comment.g.dart';

@entity
class CommentModel extends EntityQuery {
  final int talkId; // トークUID
  @primaryKeyNoIncrement
  final int commentId; // コメントUID
  final int deleteFlag; // 削除フラグ
  final int statusCode; // ステータスコード
  final String value; // 値
  final String transactionId; // レコード固有ID
  final int ownerId; // 作成者
  final int createDate; // 作成日
  final int createTime; // 作成時間
  final int stampDate; // スタンプ日
  final int stampTime; // スタンプ時間
  final int hospitalCode; // 施設コード
  final int patientIndex; // 患者Index
  final int orderIndex; // オーダIndex

  CommentModel({
    required this.talkId,
    required this.commentId,
    required this.deleteFlag,
    required this.statusCode,
    required this.value,
    required this.transactionId,
    required this.ownerId,
    required this.createDate,
    required this.createTime,
    required this.stampDate,
    required this.stampTime,
    required this.hospitalCode,
    required this.patientIndex,
    required this.orderIndex,
  });

  factory CommentModel.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      CommentModelQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
