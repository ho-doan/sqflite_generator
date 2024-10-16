import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'patient_model.g.dart';

@entity
class PatientModel {
  final int hospitalCode; // hospitalCode
  @primaryKeyNoIncrement
  final int patientIDX; // patientIDX
  final int cooperateIDX; // cooperateIDX
  final String patientID; // patientID
  final String optionID; // optionID
  final String kanaName; // kanaName
  final String kanjiName; // kanjiName
  final int sex; // sex
  final int birthDate; // birthDate
  final int bloodABO; // bloodABO
  final int bloodRH; // bloodRH
  final int insurerTypeName; // insurerTypeName
  final String optionStr1; // optionStr1
  final String optionStr2; // optionStr2
  final String optionStr3; // optionStr3
  final String optionStr4; // optionStr4
  final String optionStr5; // optionStr5
  final int optionNum1; // optionNum1
  final int optionNum2; // optionNum2
  final int optionNum3; // optionNum3
  final int optionNum4; // optionNum4
  final int optionNum5; // optionNum5
  final int patientTypeName; // patientTypeName
  final int outInType; // outInType
  final String sickRoomName; // sickRoomName
  final String mainDoctorName; // mainDoctorName
  final String mainSpecialtyName; // mainSpecialtyName
  final String floorName; // floorName
  final int publicInternalType; // publicInternalType
  final int publicExternalType; // publicExternalType
  final String publicHospital; // publicHospital
  final String publicHospitalNo; // publicHospitalNo
  final int publicStartDate; // publicStartDate
  final int publicEndDate; // publicEndDate
  final int updateDate; // updateDate
  final int updateTime; // updateTime
  final int updateUser; // updateUser

  const PatientModel({
    required this.hospitalCode,
    required this.patientIDX,
    required this.cooperateIDX,
    required this.patientID,
    required this.optionID,
    required this.kanaName,
    required this.kanjiName,
    required this.sex,
    required this.birthDate,
    required this.bloodABO,
    required this.bloodRH,
    required this.insurerTypeName,
    required this.optionStr1,
    required this.optionStr2,
    required this.optionStr3,
    required this.optionStr4,
    required this.optionStr5,
    required this.optionNum1,
    required this.optionNum2,
    required this.optionNum3,
    required this.optionNum4,
    required this.optionNum5,
    required this.patientTypeName,
    required this.outInType,
    required this.sickRoomName,
    required this.mainDoctorName,
    required this.mainSpecialtyName,
    required this.floorName,
    required this.publicInternalType,
    required this.publicExternalType,
    required this.publicHospital,
    required this.publicHospitalNo,
    required this.publicStartDate,
    required this.publicEndDate,
    required this.updateDate,
    required this.updateTime,
    required this.updateUser,
  });

  factory PatientModel.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      PatientModelQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
