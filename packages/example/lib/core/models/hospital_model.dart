import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'hospital_model.g.dart';

@entity
class HospitalModel extends EntityQuery {
  @primaryKeyNoIncrement
  final int hospitalNo; // HospitalNo
  final String? shortName; // ShortName
  final String? name; // Name
  final String? kana; // Kana
  final String? deptShortName; // DeptShortName
  final String? deptName; // DeptName
  final String? standardNo; // StandardNo
  final String? externalNo; // ExternalNo
  final String? governmentNo; // GovernmentNo
  final int? seqNo; // SeqNo
  final int? self; // Self
  final int? report; // Report
  final int? intro; // Intro
  final int? satellite; // Satellite
  final String? postNo; // PostNo
  final String? address1; // Address1
  final String? address2; // Address2
  final String? tel; // Tel
  final String? fax; // Fax
  final String? person; // Person
  final String? printName1; // PrintName1
  final String? printName2; // PrintName2
  final String? mailAddress; // MailAddress
  final String? urlName; // UrlName
  final int? groupId; // GroupID
  final int? publicType; // PublicType
  final int? internalMedType; // InternalMedType
  final String? internalMedClass; // InternalMedClass
  final int? internalDefaultPublic; // InternalDefaultPublic
  final int? externalMedType; // ExternalMedType
  final String? externalMedClass; // ExternalMedClass
  final int? externalDefaultPublic; // ExternalDefaultPublic
  final String? publicHospital; // PublicHospital
  final String? publicHospitalNo; // PublicHospitalNo
  final int? publicStartDate; // PublicStartDate
  final int? publicEndDate; // PublicEndDate
  final int? publicDays; // PublicDays
  final String? specifyModality; // SpecifyModality
  final String? internalExcludeSRepCode; // InternalExcludeSRepCode
  final String? externalExcludeSRepCode; // ExternalExcludeSRepCode
  final String? internalExcludeDeptCode; // InternalExcludeDeptCode
  final String? externalExcludeDeptCode; // ExternalExcludeDeptCode
  final String? internalExcludeMedGrp; // InternalExcludeMedGrp
  final String? externalExcludeMedGrp; // ExternalExcludeMedGrp
  final String? internalExcludeSRepCodeEx; // InternalExcludeSRepCodeEx
  final String? externalExcludeSRepCodeEx; // ExternalExcludeSRepCodeEx
  final String? sickNameDisp; // SickNameDisp
  final int? orderNumberRule; // OrderNumberRule
  final String? ssmixOutPath; // SSMIXOutPath
  final String? outputAllowed; // OutputAllowed
  final String? emPatientIDMin; // emPatientIDMin
  final String? emPatientIDMax; // emPatientIDMax
  final String? testPatientIDMin; // testPatientIDMin
  final String? testPatientIDMax; // testPatientIDMax
  final int? driveNo1; // DriveNo1
  final int? driveNo2; // DriveNo2
  final int? driveNo3; // DriveNo3
  final int? driveNo4; // DriveNo4
  final int? driveNo5; // DriveNo5
  final int? systemInstall; // SystemInstall
  final String? transferServerIP; // TransferServerIP
  final String? transferHospital; // TransferHospital
  final int? patientTransferFlagType; // PatientTransferFlagType
  final int? orderTransferFlagType; // OrderTransferFlagType
  final int? hospitalType; // HospitalType
  final String? comment; // Comment
  final int? startDate; // StartDate
  final int? endDate; // EndDate
  final int? tempRegDate; // TempRegDate
  final int? deleteFlag; // DeleteFlag
  final int? updateDate; // UpdateDate
  final int? updateTime; // UpdateTime
  final int? updateUser; // UpdateUser
  final int? ssmixOutStatus; // SSMIXOutStatus
  final int? ssmixOutStart; // SSMIXOutStart
  final int? ssmixOutEnd; // SSMIXOutEnd
  final String? ssmixOutTargets; // SSMIXOutTargets
  final String? excludeLocal; // ExcludeLocal
  final String? excludeCenter; // ExcludeCenter
  final String? excludeUserFolder; // ExcludeUserFolder
  final String? excludeCD; // ExcludeCD
  final String? excludeStellar; // ExcludeSTELLAR
  final String? excludeConference; // ExcludeConfernce
  final String? excludeConsul; // ExcludeConsul
  final String? excludeRemote; // ExcludeRemote
  final String? downRequestPath; // DownRequestPath
  final int? dataEntryNotify; // DataEntryNotify
  final String? entryNotifySystemCode; // EntryNotifySystemCode
  final String? entryNotifyUserID; // EntryNotifyUserID
  final String? entryNotifyDepart; // EntryNotifyDepart
  final int? dataEntryNotifyDateType; // DataEntryNotifyDateType
  final int? isHidden; // IsHidden
  final int? personInChargeNo1; // PersonInChargeNo1
  final int? personInChargeNo2; // PersonInChargeNo2
  final int? prefCode; // PrefCode
  final String? ssmixOutStdPath; // SSMIXOutStdPath

  HospitalModel({
    required this.hospitalNo,
    this.shortName,
    this.name,
    this.kana,
    this.deptShortName,
    this.deptName,
    this.standardNo,
    this.externalNo,
    this.governmentNo,
    this.seqNo,
    this.self,
    this.report,
    this.intro,
    this.satellite,
    this.postNo,
    this.address1,
    this.address2,
    this.tel,
    this.fax,
    this.person,
    this.printName1,
    this.printName2,
    this.mailAddress,
    this.urlName,
    this.groupId,
    this.publicType,
    this.internalMedType,
    this.internalMedClass,
    this.internalDefaultPublic,
    this.externalMedType,
    this.externalMedClass,
    this.externalDefaultPublic,
    this.publicHospital,
    this.publicHospitalNo,
    this.publicStartDate,
    this.publicEndDate,
    this.publicDays,
    this.specifyModality,
    this.internalExcludeSRepCode,
    this.externalExcludeSRepCode,
    this.internalExcludeDeptCode,
    this.externalExcludeDeptCode,
    this.internalExcludeMedGrp,
    this.externalExcludeMedGrp,
    this.internalExcludeSRepCodeEx,
    this.externalExcludeSRepCodeEx,
    this.sickNameDisp,
    this.orderNumberRule,
    this.ssmixOutPath,
    this.outputAllowed,
    this.emPatientIDMin,
    this.emPatientIDMax,
    this.testPatientIDMin,
    this.testPatientIDMax,
    this.driveNo1,
    this.driveNo2,
    this.driveNo3,
    this.driveNo4,
    this.driveNo5,
    this.systemInstall,
    this.transferServerIP,
    this.transferHospital,
    this.patientTransferFlagType,
    this.orderTransferFlagType,
    this.hospitalType,
    this.comment,
    this.startDate,
    this.endDate,
    this.tempRegDate,
    this.deleteFlag,
    this.updateDate,
    this.updateTime,
    this.updateUser,
    this.ssmixOutStatus,
    this.ssmixOutStart,
    this.ssmixOutEnd,
    this.ssmixOutTargets,
    this.excludeLocal,
    this.excludeCenter,
    this.excludeUserFolder,
    this.excludeCD,
    this.excludeStellar,
    this.excludeConference,
    this.excludeConsul,
    this.excludeRemote,
    this.downRequestPath,
    this.dataEntryNotify,
    this.entryNotifySystemCode,
    this.entryNotifyUserID,
    this.entryNotifyDepart,
    this.dataEntryNotifyDateType,
    this.isHidden,
    this.personInChargeNo1,
    this.personInChargeNo2,
    this.prefCode,
    this.ssmixOutStdPath,
  });

  factory HospitalModel.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      HospitalModelQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
