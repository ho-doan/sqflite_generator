// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension DepartmentModelQuery on DepartmentModel {
  static const String createTable =
      '''CREATE TABLE IF NOT EXISTS DepartmentModel(
		hospital_code INTEGER PRIMARY KEY NOT NULL,
			gen_type INTEGER NOT NULL,
			gen_code INTEGER NOT NULL,
			name TEXT NOT NULL,
			update_date INTEGER NOT NULL,
			update_time INTEGER NOT NULL,
			update_user INTEGER NOT NULL,
			default_user INTEGER NOT NULL
	)''';

  static const Map<int, List<String>> alter = {};

  static const $DepartmentModelSetArgs<int> hospitalCode =
      $DepartmentModelSetArgs(
    name: 'hospital_code',
    nameCast: 'department_model_hospital_code',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<int> genType = $DepartmentModelSetArgs(
    name: 'gen_type',
    nameCast: 'department_model_gen_type',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<int> genCode = $DepartmentModelSetArgs(
    name: 'gen_code',
    nameCast: 'department_model_gen_code',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<String> name = $DepartmentModelSetArgs(
    name: 'name',
    nameCast: 'department_model_name',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<int> updateDate =
      $DepartmentModelSetArgs(
    name: 'update_date',
    nameCast: 'department_model_update_date',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<int> updateTime =
      $DepartmentModelSetArgs(
    name: 'update_time',
    nameCast: 'department_model_update_time',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<int> updateUser =
      $DepartmentModelSetArgs(
    name: 'update_user',
    nameCast: 'department_model_update_user',
    model: 'department_model',
  );

  static const $DepartmentModelSetArgs<int> defaultUser =
      $DepartmentModelSetArgs(
    name: 'default_user',
    nameCast: 'department_model_default_user',
    model: 'department_model',
  );

  static Set<$DepartmentModelSetArgs> $default = {
    DepartmentModelQuery.hospitalCode,
    DepartmentModelQuery.genType,
    DepartmentModelQuery.genCode,
    DepartmentModelQuery.name,
    DepartmentModelQuery.updateDate,
    DepartmentModelQuery.updateTime,
    DepartmentModelQuery.updateUser,
    DepartmentModelQuery.defaultUser,
  };

  static String $createSelect(
    Set<$DepartmentModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<DepartmentModel>> getAll(
    Database database, {
    Set<$DepartmentModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$DepartmentModelSetArgs>>? orderBy,
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
        '''SELECT ${$createSelect(select)} FROM DepartmentModel department_model
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all DepartmentModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[DepartmentModelQuery.hospitalCode.nameCast]))
        .values
        .map((e) => DepartmentModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<DepartmentModel>> top(
    Database database, {
    Set<$DepartmentModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$DepartmentModelSetArgs>>? orderBy,
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
        .rawQuery('''SELECT count(*) as ns_count FROM DepartmentModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO DepartmentModel (hospital_code,
gen_type,
gen_code,
name,
update_date,
update_time,
update_user,
default_user) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?)''', [
      this.hospitalCode,
      this.genType,
      this.genCode,
      this.name,
      this.updateDate,
      this.updateTime,
      this.updateUser,
      this.defaultUser,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('DepartmentModel', toDB(),
        where: "hospital_code = ?", whereArgs: [this.hospitalCode]);
  }

  static Future<DepartmentModel?> getById(
    Database database,
    int hospitalCode, {
    Set<$DepartmentModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM DepartmentModel department_model
WHERE department_model.hospital_code = ?
''', [hospitalCode]) as List<Map>);
    return res.isNotEmpty ? DepartmentModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM DepartmentModel department_model WHERE department_model.hospital_code = ?''',
        [this.hospitalCode]);
  }

  static Future<void> deleteById(
    Database database,
    int hospitalCode,
  ) async {
    await database.rawQuery(
        '''DELETE FROM DepartmentModel department_model WHERE department_model.hospital_code = ?''',
        [hospitalCode]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM DepartmentModel''');
  }

  static DepartmentModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      DepartmentModel(
        hospitalCode: json['${childName}department_model_hospital_code'] as int,
        genType: json['${childName}department_model_gen_type'] as int,
        genCode: json['${childName}department_model_gen_code'] as int,
        name: json['${childName}department_model_name'] as String,
        updateDate: json['${childName}department_model_update_date'] as int,
        updateTime: json['${childName}department_model_update_time'] as int,
        updateUser: json['${childName}department_model_update_user'] as int,
        defaultUser: json['${childName}department_model_default_user'] as int,
      );
  Map<String, dynamic> $toDB() => {
        'hospital_code': this.hospitalCode,
        'gen_type': this.genType,
        'gen_code': this.genCode,
        'name': this.name,
        'update_date': this.updateDate,
        'update_time': this.updateTime,
        'update_user': this.updateUser,
        'default_user': this.defaultUser,
      };
}

class $DepartmentModelSetArgs<T> extends WhereModel<T> {
  const $DepartmentModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
