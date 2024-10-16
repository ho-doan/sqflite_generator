import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'user_model.g.dart';

@entity
class UserModel extends EntityQuery {
  @primaryKeyNoIncrement
  final int? userNo; // userNo
  final String? userID; // userID
  final String? passwordID; // passwordID
  final String? shortName; // shortName
  final String? name; // name
  final String? kanaName; // kanaName
  final int? postCode; // postCode
  final String? postName; // postName
  final String? departCode; // departCode
  final String? ward; // ward
  final String? sickRoom; // sickRoom
  final int? hospitalNo; // hospitalNo
  final int? grpNo; // grpNo
  final int? jobType; // jobType
  final int? position; // position
  final int? groupID; // groupID
  final int? updateDate; // updateDate
  final int? updateTime; // updateTime
  final int? adminType; // adminType

  const UserModel({
    required this.userNo,
    required this.userID,
    required this.passwordID,
    required this.shortName,
    required this.name,
    required this.kanaName,
    required this.postCode,
    required this.postName,
    required this.departCode,
    required this.ward,
    required this.sickRoom,
    required this.hospitalNo,
    required this.grpNo,
    required this.jobType,
    required this.position,
    required this.groupID,
    required this.updateDate,
    required this.updateTime,
    required this.adminType,
  });

  factory UserModel.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      UserModelQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
