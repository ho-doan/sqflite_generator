import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'classification_model.g.dart';

@entity
class ClassificationModel {
  @primaryKey
  final int classifyType; // 分類コード
  @primaryKey
  final int parentType; // 親子区分
  @primaryKey
  final int codeValue; // コード値
  final String? dispName; // 表示名称
  final String? dispShortName; // 表示略称
  final int? mstUpdateDate; // 更新日
  final int? mstUpdateTime; // 更新時刻

  const ClassificationModel({
    required this.classifyType,
    required this.parentType,
    required this.codeValue,
    required this.dispName,
    required this.dispShortName,
    required this.mstUpdateDate,
    required this.mstUpdateTime,
  });
  factory ClassificationModel.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      ClassificationModelQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
