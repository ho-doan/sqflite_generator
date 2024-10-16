// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension PatientModelQuery on PatientModel {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS PatientModel(
		patient_idx INTEGER PRIMARY KEY NOT NULL,
			hospital_code INTEGER NOT NULL,
			cooperate_idx INTEGER NOT NULL,
			patient_id TEXT NOT NULL,
			option_id TEXT NOT NULL,
			kana_name TEXT NOT NULL,
			kanji_name TEXT NOT NULL,
			sex INTEGER NOT NULL,
			birth_date INTEGER NOT NULL,
			blood_abo INTEGER NOT NULL,
			blood_rh INTEGER NOT NULL,
			insurer_type_name INTEGER NOT NULL,
			option_str1 TEXT NOT NULL,
			option_str2 TEXT NOT NULL,
			option_str3 TEXT NOT NULL,
			option_str4 TEXT NOT NULL,
			option_str5 TEXT NOT NULL,
			option_num1 INTEGER NOT NULL,
			option_num2 INTEGER NOT NULL,
			option_num3 INTEGER NOT NULL,
			option_num4 INTEGER NOT NULL,
			option_num5 INTEGER NOT NULL,
			patient_type_name INTEGER NOT NULL,
			out_in_type INTEGER NOT NULL,
			sick_room_name TEXT NOT NULL,
			main_doctor_name TEXT NOT NULL,
			main_specialty_name TEXT NOT NULL,
			floor_name TEXT NOT NULL,
			public_internal_type INTEGER NOT NULL,
			public_external_type INTEGER NOT NULL,
			public_hospital TEXT NOT NULL,
			public_hospital_no TEXT NOT NULL,
			public_start_date INTEGER NOT NULL,
			public_end_date INTEGER NOT NULL,
			update_date INTEGER NOT NULL,
			update_time INTEGER NOT NULL,
			update_user INTEGER NOT NULL
	)''';

  static const Map<int, List<String>> alter = {};

  static const $PatientModelSetArgs<int> patientIDX = $PatientModelSetArgs(
    name: 'patient_idx',
    nameCast: 'patient_model_patient_idx',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> hospitalCode = $PatientModelSetArgs(
    name: 'hospital_code',
    nameCast: 'patient_model_hospital_code',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> cooperateIDX = $PatientModelSetArgs(
    name: 'cooperate_idx',
    nameCast: 'patient_model_cooperate_idx',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> patientID = $PatientModelSetArgs(
    name: 'patient_id',
    nameCast: 'patient_model_patient_id',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> optionID = $PatientModelSetArgs(
    name: 'option_id',
    nameCast: 'patient_model_option_id',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> kanaName = $PatientModelSetArgs(
    name: 'kana_name',
    nameCast: 'patient_model_kana_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> kanjiName = $PatientModelSetArgs(
    name: 'kanji_name',
    nameCast: 'patient_model_kanji_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> sex = $PatientModelSetArgs(
    name: 'sex',
    nameCast: 'patient_model_sex',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> birthDate = $PatientModelSetArgs(
    name: 'birth_date',
    nameCast: 'patient_model_birth_date',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> bloodABO = $PatientModelSetArgs(
    name: 'blood_abo',
    nameCast: 'patient_model_blood_abo',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> bloodRH = $PatientModelSetArgs(
    name: 'blood_rh',
    nameCast: 'patient_model_blood_rh',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> insurerTypeName = $PatientModelSetArgs(
    name: 'insurer_type_name',
    nameCast: 'patient_model_insurer_type_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> optionStr1 = $PatientModelSetArgs(
    name: 'option_str1',
    nameCast: 'patient_model_option_str1',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> optionStr2 = $PatientModelSetArgs(
    name: 'option_str2',
    nameCast: 'patient_model_option_str2',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> optionStr3 = $PatientModelSetArgs(
    name: 'option_str3',
    nameCast: 'patient_model_option_str3',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> optionStr4 = $PatientModelSetArgs(
    name: 'option_str4',
    nameCast: 'patient_model_option_str4',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> optionStr5 = $PatientModelSetArgs(
    name: 'option_str5',
    nameCast: 'patient_model_option_str5',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> optionNum1 = $PatientModelSetArgs(
    name: 'option_num1',
    nameCast: 'patient_model_option_num1',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> optionNum2 = $PatientModelSetArgs(
    name: 'option_num2',
    nameCast: 'patient_model_option_num2',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> optionNum3 = $PatientModelSetArgs(
    name: 'option_num3',
    nameCast: 'patient_model_option_num3',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> optionNum4 = $PatientModelSetArgs(
    name: 'option_num4',
    nameCast: 'patient_model_option_num4',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> optionNum5 = $PatientModelSetArgs(
    name: 'option_num5',
    nameCast: 'patient_model_option_num5',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> patientTypeName = $PatientModelSetArgs(
    name: 'patient_type_name',
    nameCast: 'patient_model_patient_type_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> outInType = $PatientModelSetArgs(
    name: 'out_in_type',
    nameCast: 'patient_model_out_in_type',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> sickRoomName = $PatientModelSetArgs(
    name: 'sick_room_name',
    nameCast: 'patient_model_sick_room_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> mainDoctorName =
      $PatientModelSetArgs(
    name: 'main_doctor_name',
    nameCast: 'patient_model_main_doctor_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> mainSpecialtyName =
      $PatientModelSetArgs(
    name: 'main_specialty_name',
    nameCast: 'patient_model_main_specialty_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> floorName = $PatientModelSetArgs(
    name: 'floor_name',
    nameCast: 'patient_model_floor_name',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> publicInternalType =
      $PatientModelSetArgs(
    name: 'public_internal_type',
    nameCast: 'patient_model_public_internal_type',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> publicExternalType =
      $PatientModelSetArgs(
    name: 'public_external_type',
    nameCast: 'patient_model_public_external_type',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> publicHospital =
      $PatientModelSetArgs(
    name: 'public_hospital',
    nameCast: 'patient_model_public_hospital',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<String> publicHospitalNo =
      $PatientModelSetArgs(
    name: 'public_hospital_no',
    nameCast: 'patient_model_public_hospital_no',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> publicStartDate = $PatientModelSetArgs(
    name: 'public_start_date',
    nameCast: 'patient_model_public_start_date',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> publicEndDate = $PatientModelSetArgs(
    name: 'public_end_date',
    nameCast: 'patient_model_public_end_date',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> updateDate = $PatientModelSetArgs(
    name: 'update_date',
    nameCast: 'patient_model_update_date',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> updateTime = $PatientModelSetArgs(
    name: 'update_time',
    nameCast: 'patient_model_update_time',
    model: 'patient_model',
  );

  static const $PatientModelSetArgs<int> updateUser = $PatientModelSetArgs(
    name: 'update_user',
    nameCast: 'patient_model_update_user',
    model: 'patient_model',
  );

  static Set<$PatientModelSetArgs> $default = {
    PatientModelQuery.patientIDX,
    PatientModelQuery.hospitalCode,
    PatientModelQuery.cooperateIDX,
    PatientModelQuery.patientID,
    PatientModelQuery.optionID,
    PatientModelQuery.kanaName,
    PatientModelQuery.kanjiName,
    PatientModelQuery.sex,
    PatientModelQuery.birthDate,
    PatientModelQuery.bloodABO,
    PatientModelQuery.bloodRH,
    PatientModelQuery.insurerTypeName,
    PatientModelQuery.optionStr1,
    PatientModelQuery.optionStr2,
    PatientModelQuery.optionStr3,
    PatientModelQuery.optionStr4,
    PatientModelQuery.optionStr5,
    PatientModelQuery.optionNum1,
    PatientModelQuery.optionNum2,
    PatientModelQuery.optionNum3,
    PatientModelQuery.optionNum4,
    PatientModelQuery.optionNum5,
    PatientModelQuery.patientTypeName,
    PatientModelQuery.outInType,
    PatientModelQuery.sickRoomName,
    PatientModelQuery.mainDoctorName,
    PatientModelQuery.mainSpecialtyName,
    PatientModelQuery.floorName,
    PatientModelQuery.publicInternalType,
    PatientModelQuery.publicExternalType,
    PatientModelQuery.publicHospital,
    PatientModelQuery.publicHospitalNo,
    PatientModelQuery.publicStartDate,
    PatientModelQuery.publicEndDate,
    PatientModelQuery.updateDate,
    PatientModelQuery.updateTime,
    PatientModelQuery.updateUser,
  };

  static String $createSelect(
    Set<$PatientModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<PatientModel>> getAll(
    Database database, {
    Set<$PatientModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$PatientModelSetArgs>>? orderBy,
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
        '''SELECT ${$createSelect(select)} FROM PatientModel patient_model
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all PatientModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[PatientModelQuery.patientIDX.nameCast]))
        .values
        .map((e) => PatientModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<PatientModel>> top(
    Database database, {
    Set<$PatientModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$PatientModelSetArgs>>? orderBy,
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
        .rawQuery('''SELECT count(*) as ns_count FROM PatientModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id = await database.rawInsert(
        '''INSERT OR REPLACE INTO PatientModel (patient_idx,
hospital_code,
cooperate_idx,
patient_id,
option_id,
kana_name,
kanji_name,
sex,
birth_date,
blood_abo,
blood_rh,
insurer_type_name,
option_str1,
option_str2,
option_str3,
option_str4,
option_str5,
option_num1,
option_num2,
option_num3,
option_num4,
option_num5,
patient_type_name,
out_in_type,
sick_room_name,
main_doctor_name,
main_specialty_name,
floor_name,
public_internal_type,
public_external_type,
public_hospital,
public_hospital_no,
public_start_date,
public_end_date,
update_date,
update_time,
update_user) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          this.patientIDX,
          this.hospitalCode,
          this.cooperateIDX,
          this.patientID,
          this.optionID,
          this.kanaName,
          this.kanjiName,
          this.sex,
          this.birthDate,
          this.bloodABO,
          this.bloodRH,
          this.insurerTypeName,
          this.optionStr1,
          this.optionStr2,
          this.optionStr3,
          this.optionStr4,
          this.optionStr5,
          this.optionNum1,
          this.optionNum2,
          this.optionNum3,
          this.optionNum4,
          this.optionNum5,
          this.patientTypeName,
          this.outInType,
          this.sickRoomName,
          this.mainDoctorName,
          this.mainSpecialtyName,
          this.floorName,
          this.publicInternalType,
          this.publicExternalType,
          this.publicHospital,
          this.publicHospitalNo,
          this.publicStartDate,
          this.publicEndDate,
          this.updateDate,
          this.updateTime,
          this.updateUser,
        ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('PatientModel', toDB(),
        where: "patient_idx = ?", whereArgs: [this.patientIDX]);
  }

  static Future<PatientModel?> getById(
    Database database,
    int patientIdx, {
    Set<$PatientModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM PatientModel patient_model
WHERE patient_model.patient_idx = ?
''', [patientIdx]) as List<Map>);
    return res.isNotEmpty ? PatientModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM PatientModel patient_model WHERE patient_model.patient_idx = ?''',
        [this.patientIDX]);
  }

  static Future<void> deleteById(
    Database database,
    int patientIdx,
  ) async {
    await database.rawQuery(
        '''DELETE FROM PatientModel patient_model WHERE patient_model.patient_idx = ?''',
        [patientIdx]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM PatientModel''');
  }

  static PatientModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      PatientModel(
        patientIDX: json['${childName}patient_model_patient_idx'] as int,
        hospitalCode: json['${childName}patient_model_hospital_code'] as int,
        cooperateIDX: json['${childName}patient_model_cooperate_idx'] as int,
        patientID: json['${childName}patient_model_patient_id'] as String,
        optionID: json['${childName}patient_model_option_id'] as String,
        kanaName: json['${childName}patient_model_kana_name'] as String,
        kanjiName: json['${childName}patient_model_kanji_name'] as String,
        sex: json['${childName}patient_model_sex'] as int,
        birthDate: json['${childName}patient_model_birth_date'] as int,
        bloodABO: json['${childName}patient_model_blood_abo'] as int,
        bloodRH: json['${childName}patient_model_blood_rh'] as int,
        insurerTypeName:
            json['${childName}patient_model_insurer_type_name'] as int,
        optionStr1: json['${childName}patient_model_option_str1'] as String,
        optionStr2: json['${childName}patient_model_option_str2'] as String,
        optionStr3: json['${childName}patient_model_option_str3'] as String,
        optionStr4: json['${childName}patient_model_option_str4'] as String,
        optionStr5: json['${childName}patient_model_option_str5'] as String,
        optionNum1: json['${childName}patient_model_option_num1'] as int,
        optionNum2: json['${childName}patient_model_option_num2'] as int,
        optionNum3: json['${childName}patient_model_option_num3'] as int,
        optionNum4: json['${childName}patient_model_option_num4'] as int,
        optionNum5: json['${childName}patient_model_option_num5'] as int,
        patientTypeName:
            json['${childName}patient_model_patient_type_name'] as int,
        outInType: json['${childName}patient_model_out_in_type'] as int,
        sickRoomName:
            json['${childName}patient_model_sick_room_name'] as String,
        mainDoctorName:
            json['${childName}patient_model_main_doctor_name'] as String,
        mainSpecialtyName:
            json['${childName}patient_model_main_specialty_name'] as String,
        floorName: json['${childName}patient_model_floor_name'] as String,
        publicInternalType:
            json['${childName}patient_model_public_internal_type'] as int,
        publicExternalType:
            json['${childName}patient_model_public_external_type'] as int,
        publicHospital:
            json['${childName}patient_model_public_hospital'] as String,
        publicHospitalNo:
            json['${childName}patient_model_public_hospital_no'] as String,
        publicStartDate:
            json['${childName}patient_model_public_start_date'] as int,
        publicEndDate: json['${childName}patient_model_public_end_date'] as int,
        updateDate: json['${childName}patient_model_update_date'] as int,
        updateTime: json['${childName}patient_model_update_time'] as int,
        updateUser: json['${childName}patient_model_update_user'] as int,
      );
  Map<String, dynamic> $toDB() => {
        'patient_idx': this.patientIDX,
        'hospital_code': this.hospitalCode,
        'cooperate_idx': this.cooperateIDX,
        'patient_id': this.patientID,
        'option_id': this.optionID,
        'kana_name': this.kanaName,
        'kanji_name': this.kanjiName,
        'sex': this.sex,
        'birth_date': this.birthDate,
        'blood_abo': this.bloodABO,
        'blood_rh': this.bloodRH,
        'insurer_type_name': this.insurerTypeName,
        'option_str1': this.optionStr1,
        'option_str2': this.optionStr2,
        'option_str3': this.optionStr3,
        'option_str4': this.optionStr4,
        'option_str5': this.optionStr5,
        'option_num1': this.optionNum1,
        'option_num2': this.optionNum2,
        'option_num3': this.optionNum3,
        'option_num4': this.optionNum4,
        'option_num5': this.optionNum5,
        'patient_type_name': this.patientTypeName,
        'out_in_type': this.outInType,
        'sick_room_name': this.sickRoomName,
        'main_doctor_name': this.mainDoctorName,
        'main_specialty_name': this.mainSpecialtyName,
        'floor_name': this.floorName,
        'public_internal_type': this.publicInternalType,
        'public_external_type': this.publicExternalType,
        'public_hospital': this.publicHospital,
        'public_hospital_no': this.publicHospitalNo,
        'public_start_date': this.publicStartDate,
        'public_end_date': this.publicEndDate,
        'update_date': this.updateDate,
        'update_time': this.updateTime,
        'update_user': this.updateUser,
      };
}

class $PatientModelSetArgs<T> extends WhereModel<T> {
  const $PatientModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
