// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classification_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension ClassificationModelQuery on ClassificationModel {
  static const String createTable =
      '''CREATE TABLE IF NOT EXISTS ClassificationModel(
		classify_type INTEGER NOT NULL,
			parent_type INTEGER NOT NULL,
			code_value INTEGER NOT NULL,
			disp_name TEXT,
			disp_short_name TEXT,
			mst_update_date INTEGER,
			mst_update_time INTEGER,
			PRIMARY KEY(classify_type, parent_type, code_value)
	)''';

  static const Map<int, List<String>> alter = {};

  static const $ClassificationModelSetArgs<int> classifyType =
      $ClassificationModelSetArgs(
    name: 'classify_type',
    nameCast: 'classification_model_classify_type',
    model: 'classification_model',
  );

  static const $ClassificationModelSetArgs<int> parentType =
      $ClassificationModelSetArgs(
    name: 'parent_type',
    nameCast: 'classification_model_parent_type',
    model: 'classification_model',
  );

  static const $ClassificationModelSetArgs<int> codeValue =
      $ClassificationModelSetArgs(
    name: 'code_value',
    nameCast: 'classification_model_code_value',
    model: 'classification_model',
  );

  static const $ClassificationModelSetArgs<String> dispName =
      $ClassificationModelSetArgs(
    name: 'disp_name',
    nameCast: 'classification_model_disp_name',
    model: 'classification_model',
  );

  static const $ClassificationModelSetArgs<String> dispShortName =
      $ClassificationModelSetArgs(
    name: 'disp_short_name',
    nameCast: 'classification_model_disp_short_name',
    model: 'classification_model',
  );

  static const $ClassificationModelSetArgs<int> mstUpdateDate =
      $ClassificationModelSetArgs(
    name: 'mst_update_date',
    nameCast: 'classification_model_mst_update_date',
    model: 'classification_model',
  );

  static const $ClassificationModelSetArgs<int> mstUpdateTime =
      $ClassificationModelSetArgs(
    name: 'mst_update_time',
    nameCast: 'classification_model_mst_update_time',
    model: 'classification_model',
  );

  static Set<$ClassificationModelSetArgs> $default = {
    ClassificationModelQuery.classifyType,
    ClassificationModelQuery.parentType,
    ClassificationModelQuery.codeValue,
    ClassificationModelQuery.dispName,
    ClassificationModelQuery.dispShortName,
    ClassificationModelQuery.mstUpdateDate,
    ClassificationModelQuery.mstUpdateTime,
  };

  static String $createSelect(
    Set<$ClassificationModelSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<ClassificationModel>> getAll(
    Database database, {
    Set<$ClassificationModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ClassificationModelSetArgs>>? orderBy,
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
        '''SELECT ${$createSelect(select)} FROM ClassificationModel classification_model
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all ClassificationModel $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[ClassificationModelQuery.classifyType.nameCast]))
        .values
        .map((e) => ClassificationModel.fromDB(e.first, e))
        .toList();
  }

  static Future<List<ClassificationModel>> top(
    Database database, {
    Set<$ClassificationModelSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ClassificationModelSetArgs>>? orderBy,
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
        .rawQuery('''SELECT count(*) as ns_count FROM ClassificationModel
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO ClassificationModel (classify_type,
parent_type,
code_value,
disp_name,
disp_short_name,
mst_update_date,
mst_update_time) 
       VALUES(?, ?, ?, ?, ?, ?, ?)''', [
      this.classifyType,
      this.parentType,
      this.codeValue,
      this.dispName,
      this.dispShortName,
      this.mstUpdateDate,
      this.mstUpdateTime,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('ClassificationModel', toDB(),
        where: "classify_type = ? AND parent_type = ? AND code_value = ?",
        whereArgs: [this.classifyType, this.parentType, this.codeValue]);
  }

  static Future<ClassificationModel?> getById(
    Database database,
    int classifyType,
    int parentType,
    int codeValue, {
    Set<$ClassificationModelSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM ClassificationModel classification_model
WHERE classification_model.classify_type = ? AND classification_model.parent_type = ? AND classification_model.code_value = ?
''', [classifyType, parentType, codeValue]) as List<Map>);
    return res.isNotEmpty ? ClassificationModel.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM ClassificationModel classification_model WHERE classification_model.classify_type = ? AND classification_model.parent_type = ? AND classification_model.code_value = ?''',
        [this.classifyType, this.parentType, this.codeValue]);
  }

  static Future<void> deleteById(
    Database database,
    int classifyType,
    int parentType,
    int codeValue,
  ) async {
    await database.rawQuery(
        '''DELETE FROM ClassificationModel classification_model WHERE classification_model.classify_type = ? AND classification_model.parent_type = ? AND classification_model.code_value = ?''',
        [classifyType, parentType, codeValue]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM ClassificationModel''');
  }

  static ClassificationModel $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      ClassificationModel(
        classifyType:
            json['${childName}classification_model_classify_type'] as int,
        parentType: json['${childName}classification_model_parent_type'] as int,
        codeValue: json['${childName}classification_model_code_value'] as int,
        dispName: json['${childName}classification_model_disp_name'] as String?,
        dispShortName:
            json['${childName}classification_model_disp_short_name'] as String?,
        mstUpdateDate:
            json['${childName}classification_model_mst_update_date'] as int?,
        mstUpdateTime:
            json['${childName}classification_model_mst_update_time'] as int?,
      );
  Map<String, dynamic> $toDB() => {
        'classify_type': this.classifyType,
        'parent_type': this.parentType,
        'code_value': this.codeValue,
        'disp_name': this.dispName,
        'disp_short_name': this.dispShortName,
        'mst_update_date': this.mstUpdateDate,
        'mst_update_time': this.mstUpdateTime,
      };
}

class $ClassificationModelSetArgs<T> extends WhereModel<T> {
  const $ClassificationModelSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
