import 'package:example/core/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'talk_model.g.dart';

@entity
class TalkModel {
  @primaryKeyNoIncrement
  final int talkId; // トークUID (TalkId)
  final int deleteFlag; // 削除フラグ (DeleteFlag)
  final int talkType; // トーク区分 (TalkType)
  final int typeCode; // トーク区分コード (TypeCode)
  final String title; // トークタイトル (Title)
  @ForeignKey(name: 'ownerId')
  final UserModel ownerId; // 作成者 (OwnerId)
  final int createDate; // 作成日 (CreateDate)
  final int createTime; // 作成時間 (CreateTime)
  final int stampDate; // スタンプ日 (StampDate)
  final int stampTime; // スタンプ時間 (StampTime)
  final int hospitalCode; // 施設コード (HospitalCode)

  TalkModel({
    required this.talkId,
    required this.deleteFlag,
    required this.talkType,
    required this.typeCode,
    required this.title,
    required this.ownerId,
    required this.createDate,
    required this.createTime,
    required this.stampDate,
    required this.stampTime,
    required this.hospitalCode,
  });

  // Factory constructor for creating an instance from DB
  factory TalkModel.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      TalkModelQuery.$fromDB(json, lst, childName);

  // Method to convert instance back to DB format (Map)
  Map<String, dynamic> toDB() => $toDB();
}
