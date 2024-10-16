// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension HospitalModelQuery on HospitalModel {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS HospitalModel(
		hospital_no INTEGER PRIMARY KEY NOT NULL,
			short_name TEXT,
			name TEXT,
			kana TEXT,
			dept_short_name TEXT,
			dept_name TEXT,
			standard_no TEXT,
			external_no TEXT,
			government_no TEXT,
			seq_no INTEGER,
			self INTEGER,
			report INTEGER,
			intro INTEGER,
			satellite INTEGER,
			post_no TEXT,
			address1 TEXT,
			address2 TEXT,
			tel TEXT,
			fax TEXT,
			person TEXT,
			print_name1 TEXT,
			print_name2 TEXT,
			mail_address TEXT,
			url_name TEXT,
			group_id INTEGER,
			public_type INTEGER,
			internal_med_type INTEGER,
			internal_med_class TEXT,
			internal_default_public INTEGER,
			external_med_type INTEGER,
			external_med_class TEXT,
			external_default_public INTEGER,
			public_hospital TEXT,
			public_hospital_no TEXT,
			public_start_date INTEGER,
			public_end_date INTEGER,
			public_days INTEGER,
			specify_modality TEXT,
			internal_exclude_s_rep_code TEXT,
			external_exclude_s_rep_code TEXT,
			internal_exclude_dept_code TEXT,
			external_exclude_dept_code TEXT,
			internal_exclude_med_grp TEXT,
			external_exclude_med_grp TEXT,
			internal_exclude_s_rep_code_ex TEXT,
			external_exclude_s_rep_code_ex TEXT,
			sick_name_disp TEXT,
			order_number_rule INTEGER,
			ssmix_out_path TEXT,
			output_allowed TEXT,
			em_patient_id_min TEXT,
			em_patient_id_max TEXT,
			test_patient_id_min TEXT,
			test_patient_id_max TEXT,
			drive_no1 INTEGER,
			drive_no2 INTEGER,
			drive_no3 INTEGER,
			drive_no4 INTEGER,
			drive_no5 INTEGER,
			system_install INTEGER,
			transfer_server_ip TEXT,
			transfer_hospital TEXT,
			patient_transfer_flag_type INTEGER,
			order_transfer_flag_type INTEGER,
			hospital_type INTEGER,
			comment TEXT,
			start_date INTEGER,
			end_date INTEGER,
			temp_reg_date INTEGER,
			delete_flag INTEGER,
			update_date INTEGER,
			update_time INTEGER,
			update_user INTEGER,
			ssmix_out_status INTEGER,
			ssmix_out_start INTEGER,
			ssmix_out_end INTEGER,
			ssmix_out_targets TEXT,
			exclude_local TEXT,
			exclude_center TEXT,
			exclude_user_folder TEXT,
			exclude_cd TEXT,
			exclude_stellar TEXT,
			exclude_conference TEXT,
			exclude_consul TEXT,
			exclude_remote TEXT,
			down_request_path TEXT,
			data_entry_notify INTEGER,
			entry_notify_system_code TEXT,
			entry_notify_user_id TEXT,
			entry_notify_depart TEXT,
			data_entry_notify_date_type INTEGER,
			is_hidden INTEGER,
			person_in_charge_no1 INTEGER,
			person_in_charge_no2 INTEGER,
			pref_code INTEGER,
			ssmix_out_std_path TEXT
	)''';

  static const Map<int, List<String>> alter = {};

  static const $HospitalModelSetArgs<int> hospitalNo = $HospitalModelSetArgs(
    name: 'hospital_no',
    nameCast: 'hospital_model_hospital_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> shortName = $HospitalModelSetArgs(
    name: 'short_name',
    nameCast: 'hospital_model_short_name',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> name = $HospitalModelSetArgs(
    name: 'name',
    nameCast: 'hospital_model_name',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> kana = $HospitalModelSetArgs(
    name: 'kana',
    nameCast: 'hospital_model_kana',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> deptShortName =
      $HospitalModelSetArgs(
    name: 'dept_short_name',
    nameCast: 'hospital_model_dept_short_name',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> deptName = $HospitalModelSetArgs(
    name: 'dept_name',
    nameCast: 'hospital_model_dept_name',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> standardNo = $HospitalModelSetArgs(
    name: 'standard_no',
    nameCast: 'hospital_model_standard_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> externalNo = $HospitalModelSetArgs(
    name: 'external_no',
    nameCast: 'hospital_model_external_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> governmentNo =
      $HospitalModelSetArgs(
    name: 'government_no',
    nameCast: 'hospital_model_government_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> seqNo = $HospitalModelSetArgs(
    name: 'seq_no',
    nameCast: 'hospital_model_seq_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> self = $HospitalModelSetArgs(
    name: 'self',
    nameCast: 'hospital_model_self',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> report = $HospitalModelSetArgs(
    name: 'report',
    nameCast: 'hospital_model_report',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> intro = $HospitalModelSetArgs(
    name: 'intro',
    nameCast: 'hospital_model_intro',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> satellite = $HospitalModelSetArgs(
    name: 'satellite',
    nameCast: 'hospital_model_satellite',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> postNo = $HospitalModelSetArgs(
    name: 'post_no',
    nameCast: 'hospital_model_post_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> address1 = $HospitalModelSetArgs(
    name: 'address1',
    nameCast: 'hospital_model_address1',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> address2 = $HospitalModelSetArgs(
    name: 'address2',
    nameCast: 'hospital_model_address2',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> tel = $HospitalModelSetArgs(
    name: 'tel',
    nameCast: 'hospital_model_tel',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> fax = $HospitalModelSetArgs(
    name: 'fax',
    nameCast: 'hospital_model_fax',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> person = $HospitalModelSetArgs(
    name: 'person',
    nameCast: 'hospital_model_person',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> printName1 = $HospitalModelSetArgs(
    name: 'print_name1',
    nameCast: 'hospital_model_print_name1',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> printName2 = $HospitalModelSetArgs(
    name: 'print_name2',
    nameCast: 'hospital_model_print_name2',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> mailAddress =
      $HospitalModelSetArgs(
    name: 'mail_address',
    nameCast: 'hospital_model_mail_address',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> urlName = $HospitalModelSetArgs(
    name: 'url_name',
    nameCast: 'hospital_model_url_name',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> groupId = $HospitalModelSetArgs(
    name: 'group_id',
    nameCast: 'hospital_model_group_id',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> publicType = $HospitalModelSetArgs(
    name: 'public_type',
    nameCast: 'hospital_model_public_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> internalMedType =
      $HospitalModelSetArgs(
    name: 'internal_med_type',
    nameCast: 'hospital_model_internal_med_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> internalMedClass =
      $HospitalModelSetArgs(
    name: 'internal_med_class',
    nameCast: 'hospital_model_internal_med_class',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> internalDefaultPublic =
      $HospitalModelSetArgs(
    name: 'internal_default_public',
    nameCast: 'hospital_model_internal_default_public',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> externalMedType =
      $HospitalModelSetArgs(
    name: 'external_med_type',
    nameCast: 'hospital_model_external_med_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> externalMedClass =
      $HospitalModelSetArgs(
    name: 'external_med_class',
    nameCast: 'hospital_model_external_med_class',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> externalDefaultPublic =
      $HospitalModelSetArgs(
    name: 'external_default_public',
    nameCast: 'hospital_model_external_default_public',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> publicHospital =
      $HospitalModelSetArgs(
    name: 'public_hospital',
    nameCast: 'hospital_model_public_hospital',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> publicHospitalNo =
      $HospitalModelSetArgs(
    name: 'public_hospital_no',
    nameCast: 'hospital_model_public_hospital_no',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> publicStartDate =
      $HospitalModelSetArgs(
    name: 'public_start_date',
    nameCast: 'hospital_model_public_start_date',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> publicEndDate = $HospitalModelSetArgs(
    name: 'public_end_date',
    nameCast: 'hospital_model_public_end_date',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> publicDays = $HospitalModelSetArgs(
    name: 'public_days',
    nameCast: 'hospital_model_public_days',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> specifyModality =
      $HospitalModelSetArgs(
    name: 'specify_modality',
    nameCast: 'hospital_model_specify_modality',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> internalExcludeSRepCode =
      $HospitalModelSetArgs(
    name: 'internal_exclude_s_rep_code',
    nameCast: 'hospital_model_internal_exclude_s_rep_code',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> externalExcludeSRepCode =
      $HospitalModelSetArgs(
    name: 'external_exclude_s_rep_code',
    nameCast: 'hospital_model_external_exclude_s_rep_code',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> internalExcludeDeptCode =
      $HospitalModelSetArgs(
    name: 'internal_exclude_dept_code',
    nameCast: 'hospital_model_internal_exclude_dept_code',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> externalExcludeDeptCode =
      $HospitalModelSetArgs(
    name: 'external_exclude_dept_code',
    nameCast: 'hospital_model_external_exclude_dept_code',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> internalExcludeMedGrp =
      $HospitalModelSetArgs(
    name: 'internal_exclude_med_grp',
    nameCast: 'hospital_model_internal_exclude_med_grp',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> externalExcludeMedGrp =
      $HospitalModelSetArgs(
    name: 'external_exclude_med_grp',
    nameCast: 'hospital_model_external_exclude_med_grp',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> internalExcludeSRepCodeEx =
      $HospitalModelSetArgs(
    name: 'internal_exclude_s_rep_code_ex',
    nameCast: 'hospital_model_internal_exclude_s_rep_code_ex',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> externalExcludeSRepCodeEx =
      $HospitalModelSetArgs(
    name: 'external_exclude_s_rep_code_ex',
    nameCast: 'hospital_model_external_exclude_s_rep_code_ex',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> sickNameDisp =
      $HospitalModelSetArgs(
    name: 'sick_name_disp',
    nameCast: 'hospital_model_sick_name_disp',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> orderNumberRule =
      $HospitalModelSetArgs(
    name: 'order_number_rule',
    nameCast: 'hospital_model_order_number_rule',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> ssmixOutPath =
      $HospitalModelSetArgs(
    name: 'ssmix_out_path',
    nameCast: 'hospital_model_ssmix_out_path',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> outputAllowed =
      $HospitalModelSetArgs(
    name: 'output_allowed',
    nameCast: 'hospital_model_output_allowed',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> emPatientIDMin =
      $HospitalModelSetArgs(
    name: 'em_patient_id_min',
    nameCast: 'hospital_model_em_patient_id_min',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> emPatientIDMax =
      $HospitalModelSetArgs(
    name: 'em_patient_id_max',
    nameCast: 'hospital_model_em_patient_id_max',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> testPatientIDMin =
      $HospitalModelSetArgs(
    name: 'test_patient_id_min',
    nameCast: 'hospital_model_test_patient_id_min',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> testPatientIDMax =
      $HospitalModelSetArgs(
    name: 'test_patient_id_max',
    nameCast: 'hospital_model_test_patient_id_max',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> driveNo1 = $HospitalModelSetArgs(
    name: 'drive_no1',
    nameCast: 'hospital_model_drive_no1',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> driveNo2 = $HospitalModelSetArgs(
    name: 'drive_no2',
    nameCast: 'hospital_model_drive_no2',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> driveNo3 = $HospitalModelSetArgs(
    name: 'drive_no3',
    nameCast: 'hospital_model_drive_no3',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> driveNo4 = $HospitalModelSetArgs(
    name: 'drive_no4',
    nameCast: 'hospital_model_drive_no4',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> driveNo5 = $HospitalModelSetArgs(
    name: 'drive_no5',
    nameCast: 'hospital_model_drive_no5',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> systemInstall = $HospitalModelSetArgs(
    name: 'system_install',
    nameCast: 'hospital_model_system_install',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> transferServerIP =
      $HospitalModelSetArgs(
    name: 'transfer_server_ip',
    nameCast: 'hospital_model_transfer_server_ip',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> transferHospital =
      $HospitalModelSetArgs(
    name: 'transfer_hospital',
    nameCast: 'hospital_model_transfer_hospital',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> patientTransferFlagType =
      $HospitalModelSetArgs(
    name: 'patient_transfer_flag_type',
    nameCast: 'hospital_model_patient_transfer_flag_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> orderTransferFlagType =
      $HospitalModelSetArgs(
    name: 'order_transfer_flag_type',
    nameCast: 'hospital_model_order_transfer_flag_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> hospitalType = $HospitalModelSetArgs(
    name: 'hospital_type',
    nameCast: 'hospital_model_hospital_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> comment = $HospitalModelSetArgs(
    name: 'comment',
    nameCast: 'hospital_model_comment',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> startDate = $HospitalModelSetArgs(
    name: 'start_date',
    nameCast: 'hospital_model_start_date',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> endDate = $HospitalModelSetArgs(
    name: 'end_date',
    nameCast: 'hospital_model_end_date',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> tempRegDate = $HospitalModelSetArgs(
    name: 'temp_reg_date',
    nameCast: 'hospital_model_temp_reg_date',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> deleteFlag = $HospitalModelSetArgs(
    name: 'delete_flag',
    nameCast: 'hospital_model_delete_flag',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> updateDate = $HospitalModelSetArgs(
    name: 'update_date',
    nameCast: 'hospital_model_update_date',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> updateTime = $HospitalModelSetArgs(
    name: 'update_time',
    nameCast: 'hospital_model_update_time',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> updateUser = $HospitalModelSetArgs(
    name: 'update_user',
    nameCast: 'hospital_model_update_user',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> ssmixOutStatus =
      $HospitalModelSetArgs(
    name: 'ssmix_out_status',
    nameCast: 'hospital_model_ssmix_out_status',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> ssmixOutStart = $HospitalModelSetArgs(
    name: 'ssmix_out_start',
    nameCast: 'hospital_model_ssmix_out_start',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> ssmixOutEnd = $HospitalModelSetArgs(
    name: 'ssmix_out_end',
    nameCast: 'hospital_model_ssmix_out_end',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> ssmixOutTargets =
      $HospitalModelSetArgs(
    name: 'ssmix_out_targets',
    nameCast: 'hospital_model_ssmix_out_targets',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeLocal =
      $HospitalModelSetArgs(
    name: 'exclude_local',
    nameCast: 'hospital_model_exclude_local',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeCenter =
      $HospitalModelSetArgs(
    name: 'exclude_center',
    nameCast: 'hospital_model_exclude_center',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeUserFolder =
      $HospitalModelSetArgs(
    name: 'exclude_user_folder',
    nameCast: 'hospital_model_exclude_user_folder',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeCD = $HospitalModelSetArgs(
    name: 'exclude_cd',
    nameCast: 'hospital_model_exclude_cd',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeStellar =
      $HospitalModelSetArgs(
    name: 'exclude_stellar',
    nameCast: 'hospital_model_exclude_stellar',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeConference =
      $HospitalModelSetArgs(
    name: 'exclude_conference',
    nameCast: 'hospital_model_exclude_conference',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeConsul =
      $HospitalModelSetArgs(
    name: 'exclude_consul',
    nameCast: 'hospital_model_exclude_consul',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> excludeRemote =
      $HospitalModelSetArgs(
    name: 'exclude_remote',
    nameCast: 'hospital_model_exclude_remote',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> downRequestPath =
      $HospitalModelSetArgs(
    name: 'down_request_path',
    nameCast: 'hospital_model_down_request_path',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> dataEntryNotify =
      $HospitalModelSetArgs(
    name: 'data_entry_notify',
    nameCast: 'hospital_model_data_entry_notify',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> entryNotifySystemCode =
      $HospitalModelSetArgs(
    name: 'entry_notify_system_code',
    nameCast: 'hospital_model_entry_notify_system_code',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> entryNotifyUserID =
      $HospitalModelSetArgs(
    name: 'entry_notify_user_id',
    nameCast: 'hospital_model_entry_notify_user_id',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> entryNotifyDepart =
      $HospitalModelSetArgs(
    name: 'entry_notify_depart',
    nameCast: 'hospital_model_entry_notify_depart',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> dataEntryNotifyDateType =
      $HospitalModelSetArgs(
    name: 'data_entry_notify_date_type',
    nameCast: 'hospital_model_data_entry_notify_date_type',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> isHidden = $HospitalModelSetArgs(
    name: 'is_hidden',
    nameCast: 'hospital_model_is_hidden',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> personInChargeNo1 =
      $HospitalModelSetArgs(
    name: 'person_in_charge_no1',
    nameCast: 'hospital_model_person_in_charge_no1',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> personInChargeNo2 =
      $HospitalModelSetArgs(
    name: 'person_in_charge_no2',
    nameCast: 'hospital_model_person_in_charge_no2',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<int> prefCode = $HospitalModelSetArgs(
    name: 'pref_code',
    nameCast: 'hospital_model_pref_code',
    model: 'hospital_model',
  );

  static const $HospitalModelSetArgs<String> ssmixOutStdPath =
      $HospitalModelSetArgs(
    name: 'ssmix_out_std_path',
    nameCast: 'hospital_model_ssmix_out_std_path',
    model: 'hospital_model',
  );

  static Set<$HospitalModelSetArgs> $default = {
    HospitalModelQuery.hospitalNo,
    HospitalModelQuery.shortName,
    HospitalModelQuery.name,
    HospitalModelQuery.kana,
    HospitalModelQuery.deptShortName,
    HospitalModelQuery.deptName,
    HospitalModelQuery.standardNo,
    HospitalModelQuery.externalNo,
    HospitalModelQuery.governmentNo,
    HospitalModelQuery.seqNo,
    HospitalModelQuery.self,
    HospitalModelQuery.report,
    HospitalModelQuery.intro,
    HospitalModelQuery.satellite,
    HospitalModelQuery.postNo,
    HospitalModelQuery.address1,
    HospitalModelQuery.address2,
    HospitalModelQuery.tel,
    HospitalModelQuery.fax,
    HospitalModelQuery.person,
    HospitalModelQuery.printName1,
    HospitalModelQuery.printName2,
    HospitalModelQuery.mailAddress,
    HospitalModelQuery.urlName,
    HospitalModelQuery.groupId,
    HospitalModelQuery.publicType,
    HospitalModelQuery.internalMedType,
    HospitalModelQuery.internalMedClass,
    HospitalModelQuery.internalDefaultPublic,
    HospitalModelQuery.externalMedType,
    HospitalModelQuery.externalMedClass,
    HospitalModelQuery.externalDefaultPublic,
    HospitalModelQuery.publicHospital,
    HospitalModelQuery.publicHospitalNo,
    HospitalModelQuery.publicStartDate,
    HospitalModelQuery.publicEndDate,
    HospitalModelQuery.publicDays,
    HospitalModelQuery.specifyModality,
    HospitalModelQuery.internalExcludeSRepCode,
    HospitalModelQuery.externalExcludeSRepCode,
    HospitalModelQuery.internalExcludeDeptCode,
    HospitalModelQuery.externalExcludeDeptCode,
    HospitalModelQuery.internalExcludeMedGrp,
    HospitalModelQuery.externalExcludeMedGrp,
    HospitalModelQuery.internalExcludeSRepCodeEx,
    HospitalModelQuery.externalExcludeSRepCodeEx,
    HospitalModelQuery.sickNameDisp,
    HospitalModelQuery.orderNumberRule,
    HospitalModelQuery.ssmixOutPath,
    HospitalModelQuery.outputAllowed,
    HospitalModelQuery.emPatientIDMin,
    HospitalModelQuery.emPatientIDMax,
    HospitalModelQuery.testPatientIDMin,
    HospitalModelQuery.testPatientIDMax,
    HospitalModelQuery.driveNo1,
    HospitalModelQuery.driveNo2,
    HospitalModelQuery.driveNo3,
    HospitalModelQuery.driveNo4,
    HospitalModelQuery.driveNo5,
    HospitalModelQuery.systemInstall,
    HospitalModelQuery.transferServerIP,
    HospitalModelQuery.transferHospital,
    HospitalModelQuery.patientTransferFlagType,
    HospitalModelQuery.orderTransferFlagType,
    HospitalModelQuery.hospitalType,
    HospitalModelQuery.comment,
    HospitalModelQuery.startDate,
    HospitalModelQuery.endDate,
    HospitalModelQuery.tempRegDate,
    HospitalModelQuery.deleteFlag,
    HospitalModelQuery.updateDate,
    HospitalModelQuery.updateTime,
    HospitalModelQuery.updateUser,
    HospitalModelQuery.ssmixOutStatus,
    HospitalModelQuery.ssmixOutStart,
    HospitalModelQuery.ssmixOutEnd,
    HospitalModelQuery.ssmixOutTargets,
    HospitalModelQuery.excludeLocal,
    HospitalModelQuery.excludeCenter,
    HospitalModelQuery.excludeUserFolder,
    HospitalModelQuery.excludeCD,
    HospitalModelQuery.excludeStellar,
    HospitalModelQuery.excludeConference,
    HospitalModelQuery.excludeConsul,
    HospitalModelQuery.excludeRemote,
    HospitalModelQuery.downRequestPath,
    HospitalModelQuery.dataEntryNotify,
    HospitalModelQuery.entryNotifySystemCode,
    HospitalModelQuery.entryNotifyUserID,
    HospitalModelQuery.entryNotifyDepart,
    HospitalModelQuery.dataEntryNotifyDateType,
    HospitalModelQuery.isHidden,
    HospitalModelQuery.personInChargeNo1,
    HospitalModelQuery.personInChargeNo2,
    HospitalModelQuery.prefCode,
    HospitalModelQuery.ssmixOutStdPath,
  };

  static String $createSelect(
    Set<$HospitalModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<HospitalModel>> getAll(
    Database database, {
    Set<$HospitalModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$HospitalModelSetArgs>>? orderBy,
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
        '''SELECT ${$createSelect(select)} FROM HospitalModel hospital_model
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all HospitalModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[HospitalModelQuery.hospitalNo.nameCast]))
        .values
        .map((e) => HospitalModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<HospitalModel>> top(
    Database database, {
    Set<$HospitalModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$HospitalModelSetArgs>>? orderBy,
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
        .rawQuery('''SELECT count(*) as ns_count FROM HospitalModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id = await database.rawInsert(
        '''INSERT OR REPLACE INTO HospitalModel (hospital_no,
short_name,
name,
kana,
dept_short_name,
dept_name,
standard_no,
external_no,
government_no,
seq_no,
self,
report,
intro,
satellite,
post_no,
address1,
address2,
tel,
fax,
person,
print_name1,
print_name2,
mail_address,
url_name,
group_id,
public_type,
internal_med_type,
internal_med_class,
internal_default_public,
external_med_type,
external_med_class,
external_default_public,
public_hospital,
public_hospital_no,
public_start_date,
public_end_date,
public_days,
specify_modality,
internal_exclude_s_rep_code,
external_exclude_s_rep_code,
internal_exclude_dept_code,
external_exclude_dept_code,
internal_exclude_med_grp,
external_exclude_med_grp,
internal_exclude_s_rep_code_ex,
external_exclude_s_rep_code_ex,
sick_name_disp,
order_number_rule,
ssmix_out_path,
output_allowed,
em_patient_id_min,
em_patient_id_max,
test_patient_id_min,
test_patient_id_max,
drive_no1,
drive_no2,
drive_no3,
drive_no4,
drive_no5,
system_install,
transfer_server_ip,
transfer_hospital,
patient_transfer_flag_type,
order_transfer_flag_type,
hospital_type,
comment,
start_date,
end_date,
temp_reg_date,
delete_flag,
update_date,
update_time,
update_user,
ssmix_out_status,
ssmix_out_start,
ssmix_out_end,
ssmix_out_targets,
exclude_local,
exclude_center,
exclude_user_folder,
exclude_cd,
exclude_stellar,
exclude_conference,
exclude_consul,
exclude_remote,
down_request_path,
data_entry_notify,
entry_notify_system_code,
entry_notify_user_id,
entry_notify_depart,
data_entry_notify_date_type,
is_hidden,
person_in_charge_no1,
person_in_charge_no2,
pref_code,
ssmix_out_std_path) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          this.hospitalNo,
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
        ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('HospitalModel', toDB(),
        where: "hospital_no = ?", whereArgs: [this.hospitalNo]);
  }

  static Future<HospitalModel?> getById(
    Database database,
    int hospitalNo, {
    Set<$HospitalModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM HospitalModel hospital_model
WHERE hospital_model.hospital_no = ?
''', [hospitalNo]) as List<Map>);
    return res.isNotEmpty ? HospitalModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM HospitalModel hospital_model WHERE hospital_model.hospital_no = ?''',
        [this.hospitalNo]);
  }

  static Future<void> deleteById(
    Database database,
    int hospitalNo,
  ) async {
    await database.rawQuery(
        '''DELETE FROM HospitalModel hospital_model WHERE hospital_model.hospital_no = ?''',
        [hospitalNo]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM HospitalModel''');
  }

  static HospitalModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      HospitalModel(
        hospitalNo: json['${childName}hospital_model_hospital_no'] as int,
        shortName: json['${childName}hospital_model_short_name'] as String?,
        name: json['${childName}hospital_model_name'] as String?,
        kana: json['${childName}hospital_model_kana'] as String?,
        deptShortName:
            json['${childName}hospital_model_dept_short_name'] as String?,
        deptName: json['${childName}hospital_model_dept_name'] as String?,
        standardNo: json['${childName}hospital_model_standard_no'] as String?,
        externalNo: json['${childName}hospital_model_external_no'] as String?,
        governmentNo:
            json['${childName}hospital_model_government_no'] as String?,
        seqNo: json['${childName}hospital_model_seq_no'] as int?,
        self: json['${childName}hospital_model_self'] as int?,
        report: json['${childName}hospital_model_report'] as int?,
        intro: json['${childName}hospital_model_intro'] as int?,
        satellite: json['${childName}hospital_model_satellite'] as int?,
        postNo: json['${childName}hospital_model_post_no'] as String?,
        address1: json['${childName}hospital_model_address1'] as String?,
        address2: json['${childName}hospital_model_address2'] as String?,
        tel: json['${childName}hospital_model_tel'] as String?,
        fax: json['${childName}hospital_model_fax'] as String?,
        person: json['${childName}hospital_model_person'] as String?,
        printName1: json['${childName}hospital_model_print_name1'] as String?,
        printName2: json['${childName}hospital_model_print_name2'] as String?,
        mailAddress: json['${childName}hospital_model_mail_address'] as String?,
        urlName: json['${childName}hospital_model_url_name'] as String?,
        groupId: json['${childName}hospital_model_group_id'] as int?,
        publicType: json['${childName}hospital_model_public_type'] as int?,
        internalMedType:
            json['${childName}hospital_model_internal_med_type'] as int?,
        internalMedClass:
            json['${childName}hospital_model_internal_med_class'] as String?,
        internalDefaultPublic:
            json['${childName}hospital_model_internal_default_public'] as int?,
        externalMedType:
            json['${childName}hospital_model_external_med_type'] as int?,
        externalMedClass:
            json['${childName}hospital_model_external_med_class'] as String?,
        externalDefaultPublic:
            json['${childName}hospital_model_external_default_public'] as int?,
        publicHospital:
            json['${childName}hospital_model_public_hospital'] as String?,
        publicHospitalNo:
            json['${childName}hospital_model_public_hospital_no'] as String?,
        publicStartDate:
            json['${childName}hospital_model_public_start_date'] as int?,
        publicEndDate:
            json['${childName}hospital_model_public_end_date'] as int?,
        publicDays: json['${childName}hospital_model_public_days'] as int?,
        specifyModality:
            json['${childName}hospital_model_specify_modality'] as String?,
        internalExcludeSRepCode:
            json['${childName}hospital_model_internal_exclude_s_rep_code']
                as String?,
        externalExcludeSRepCode:
            json['${childName}hospital_model_external_exclude_s_rep_code']
                as String?,
        internalExcludeDeptCode:
            json['${childName}hospital_model_internal_exclude_dept_code']
                as String?,
        externalExcludeDeptCode:
            json['${childName}hospital_model_external_exclude_dept_code']
                as String?,
        internalExcludeMedGrp:
            json['${childName}hospital_model_internal_exclude_med_grp']
                as String?,
        externalExcludeMedGrp:
            json['${childName}hospital_model_external_exclude_med_grp']
                as String?,
        internalExcludeSRepCodeEx:
            json['${childName}hospital_model_internal_exclude_s_rep_code_ex']
                as String?,
        externalExcludeSRepCodeEx:
            json['${childName}hospital_model_external_exclude_s_rep_code_ex']
                as String?,
        sickNameDisp:
            json['${childName}hospital_model_sick_name_disp'] as String?,
        orderNumberRule:
            json['${childName}hospital_model_order_number_rule'] as int?,
        ssmixOutPath:
            json['${childName}hospital_model_ssmix_out_path'] as String?,
        outputAllowed:
            json['${childName}hospital_model_output_allowed'] as String?,
        emPatientIDMin:
            json['${childName}hospital_model_em_patient_id_min'] as String?,
        emPatientIDMax:
            json['${childName}hospital_model_em_patient_id_max'] as String?,
        testPatientIDMin:
            json['${childName}hospital_model_test_patient_id_min'] as String?,
        testPatientIDMax:
            json['${childName}hospital_model_test_patient_id_max'] as String?,
        driveNo1: json['${childName}hospital_model_drive_no1'] as int?,
        driveNo2: json['${childName}hospital_model_drive_no2'] as int?,
        driveNo3: json['${childName}hospital_model_drive_no3'] as int?,
        driveNo4: json['${childName}hospital_model_drive_no4'] as int?,
        driveNo5: json['${childName}hospital_model_drive_no5'] as int?,
        systemInstall:
            json['${childName}hospital_model_system_install'] as int?,
        transferServerIP:
            json['${childName}hospital_model_transfer_server_ip'] as String?,
        transferHospital:
            json['${childName}hospital_model_transfer_hospital'] as String?,
        patientTransferFlagType:
            json['${childName}hospital_model_patient_transfer_flag_type']
                as int?,
        orderTransferFlagType:
            json['${childName}hospital_model_order_transfer_flag_type'] as int?,
        hospitalType: json['${childName}hospital_model_hospital_type'] as int?,
        comment: json['${childName}hospital_model_comment'] as String?,
        startDate: json['${childName}hospital_model_start_date'] as int?,
        endDate: json['${childName}hospital_model_end_date'] as int?,
        tempRegDate: json['${childName}hospital_model_temp_reg_date'] as int?,
        deleteFlag: json['${childName}hospital_model_delete_flag'] as int?,
        updateDate: json['${childName}hospital_model_update_date'] as int?,
        updateTime: json['${childName}hospital_model_update_time'] as int?,
        updateUser: json['${childName}hospital_model_update_user'] as int?,
        ssmixOutStatus:
            json['${childName}hospital_model_ssmix_out_status'] as int?,
        ssmixOutStart:
            json['${childName}hospital_model_ssmix_out_start'] as int?,
        ssmixOutEnd: json['${childName}hospital_model_ssmix_out_end'] as int?,
        ssmixOutTargets:
            json['${childName}hospital_model_ssmix_out_targets'] as String?,
        excludeLocal:
            json['${childName}hospital_model_exclude_local'] as String?,
        excludeCenter:
            json['${childName}hospital_model_exclude_center'] as String?,
        excludeUserFolder:
            json['${childName}hospital_model_exclude_user_folder'] as String?,
        excludeCD: json['${childName}hospital_model_exclude_cd'] as String?,
        excludeStellar:
            json['${childName}hospital_model_exclude_stellar'] as String?,
        excludeConference:
            json['${childName}hospital_model_exclude_conference'] as String?,
        excludeConsul:
            json['${childName}hospital_model_exclude_consul'] as String?,
        excludeRemote:
            json['${childName}hospital_model_exclude_remote'] as String?,
        downRequestPath:
            json['${childName}hospital_model_down_request_path'] as String?,
        dataEntryNotify:
            json['${childName}hospital_model_data_entry_notify'] as int?,
        entryNotifySystemCode:
            json['${childName}hospital_model_entry_notify_system_code']
                as String?,
        entryNotifyUserID:
            json['${childName}hospital_model_entry_notify_user_id'] as String?,
        entryNotifyDepart:
            json['${childName}hospital_model_entry_notify_depart'] as String?,
        dataEntryNotifyDateType:
            json['${childName}hospital_model_data_entry_notify_date_type']
                as int?,
        isHidden: json['${childName}hospital_model_is_hidden'] as int?,
        personInChargeNo1:
            json['${childName}hospital_model_person_in_charge_no1'] as int?,
        personInChargeNo2:
            json['${childName}hospital_model_person_in_charge_no2'] as int?,
        prefCode: json['${childName}hospital_model_pref_code'] as int?,
        ssmixOutStdPath:
            json['${childName}hospital_model_ssmix_out_std_path'] as String?,
      );
  Map<String, dynamic> $toDB() => {
        'hospital_no': this.hospitalNo,
        'short_name': this.shortName,
        'name': this.name,
        'kana': this.kana,
        'dept_short_name': this.deptShortName,
        'dept_name': this.deptName,
        'standard_no': this.standardNo,
        'external_no': this.externalNo,
        'government_no': this.governmentNo,
        'seq_no': this.seqNo,
        'self': this.self,
        'report': this.report,
        'intro': this.intro,
        'satellite': this.satellite,
        'post_no': this.postNo,
        'address1': this.address1,
        'address2': this.address2,
        'tel': this.tel,
        'fax': this.fax,
        'person': this.person,
        'print_name1': this.printName1,
        'print_name2': this.printName2,
        'mail_address': this.mailAddress,
        'url_name': this.urlName,
        'group_id': this.groupId,
        'public_type': this.publicType,
        'internal_med_type': this.internalMedType,
        'internal_med_class': this.internalMedClass,
        'internal_default_public': this.internalDefaultPublic,
        'external_med_type': this.externalMedType,
        'external_med_class': this.externalMedClass,
        'external_default_public': this.externalDefaultPublic,
        'public_hospital': this.publicHospital,
        'public_hospital_no': this.publicHospitalNo,
        'public_start_date': this.publicStartDate,
        'public_end_date': this.publicEndDate,
        'public_days': this.publicDays,
        'specify_modality': this.specifyModality,
        'internal_exclude_s_rep_code': this.internalExcludeSRepCode,
        'external_exclude_s_rep_code': this.externalExcludeSRepCode,
        'internal_exclude_dept_code': this.internalExcludeDeptCode,
        'external_exclude_dept_code': this.externalExcludeDeptCode,
        'internal_exclude_med_grp': this.internalExcludeMedGrp,
        'external_exclude_med_grp': this.externalExcludeMedGrp,
        'internal_exclude_s_rep_code_ex': this.internalExcludeSRepCodeEx,
        'external_exclude_s_rep_code_ex': this.externalExcludeSRepCodeEx,
        'sick_name_disp': this.sickNameDisp,
        'order_number_rule': this.orderNumberRule,
        'ssmix_out_path': this.ssmixOutPath,
        'output_allowed': this.outputAllowed,
        'em_patient_id_min': this.emPatientIDMin,
        'em_patient_id_max': this.emPatientIDMax,
        'test_patient_id_min': this.testPatientIDMin,
        'test_patient_id_max': this.testPatientIDMax,
        'drive_no1': this.driveNo1,
        'drive_no2': this.driveNo2,
        'drive_no3': this.driveNo3,
        'drive_no4': this.driveNo4,
        'drive_no5': this.driveNo5,
        'system_install': this.systemInstall,
        'transfer_server_ip': this.transferServerIP,
        'transfer_hospital': this.transferHospital,
        'patient_transfer_flag_type': this.patientTransferFlagType,
        'order_transfer_flag_type': this.orderTransferFlagType,
        'hospital_type': this.hospitalType,
        'comment': this.comment,
        'start_date': this.startDate,
        'end_date': this.endDate,
        'temp_reg_date': this.tempRegDate,
        'delete_flag': this.deleteFlag,
        'update_date': this.updateDate,
        'update_time': this.updateTime,
        'update_user': this.updateUser,
        'ssmix_out_status': this.ssmixOutStatus,
        'ssmix_out_start': this.ssmixOutStart,
        'ssmix_out_end': this.ssmixOutEnd,
        'ssmix_out_targets': this.ssmixOutTargets,
        'exclude_local': this.excludeLocal,
        'exclude_center': this.excludeCenter,
        'exclude_user_folder': this.excludeUserFolder,
        'exclude_cd': this.excludeCD,
        'exclude_stellar': this.excludeStellar,
        'exclude_conference': this.excludeConference,
        'exclude_consul': this.excludeConsul,
        'exclude_remote': this.excludeRemote,
        'down_request_path': this.downRequestPath,
        'data_entry_notify': this.dataEntryNotify,
        'entry_notify_system_code': this.entryNotifySystemCode,
        'entry_notify_user_id': this.entryNotifyUserID,
        'entry_notify_depart': this.entryNotifyDepart,
        'data_entry_notify_date_type': this.dataEntryNotifyDateType,
        'is_hidden': this.isHidden,
        'person_in_charge_no1': this.personInChargeNo1,
        'person_in_charge_no2': this.personInChargeNo2,
        'pref_code': this.prefCode,
        'ssmix_out_std_path': this.ssmixOutStdPath,
      };
}

class $HospitalModelSetArgs<T> extends WhereModel<T> {
  const $HospitalModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
