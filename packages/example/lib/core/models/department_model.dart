import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'department_model.g.dart';

// TODO(hodoan): recheck FK
@entity
class DepartmentModel {
  @primaryKeyNoIncrement
  final int hospitalCode; // 病院コード
  final int genType; // 汎用区分
  final int genCode; // 汎用コード
  final String name; // 名称
  final int updateDate; // 更新日
  final int updateTime; // 更新時刻
  final int updateUser; // 更新者
  final int defaultUser; // 規定動作ユーザ

  DepartmentModel({
    required this.hospitalCode,
    required this.genType,
    required this.genCode,
    required this.name,
    required this.updateDate,
    required this.updateTime,
    required this.updateUser,
    required this.defaultUser,
  });

  // Factory constructor
  factory DepartmentModel.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      DepartmentModelQuery.$fromDB(json, lst, childName);

  // toDB method
  Map<String, dynamic> toDB() => $toDB();
}
