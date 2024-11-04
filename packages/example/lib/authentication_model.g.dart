// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension BillMQuery on BillM {
  static const _$$BillDetailSetArgs details$$ = _$$BillDetailSetArgs();

  static const String createTable = '''CREATE TABLE IF NOT EXISTS BillM(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			details_key INTEGER,
			name TEXT NOT NULL,
			memos TEXT NOT NULL
	)''';

  static const String debug =
      '''nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_m_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [BillM], fieldNames: [key], step: 1), parentClassName: [],
nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_m_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [BillM], fieldNames: [name], step: 1), parentClassName: [],
nameDefault: memos, name: null, nameToDB: memos, nameFromDB: bill_m_memos, dartType: List<String>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [BillM], fieldNames: [memos], step: 1), parentClassName: []''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {
    2: ['ALTER TABLE BillM ADD memos TEXT;'],
    3: [
      '''CREATE TABLE IF NOT EXISTS BillDetail_new(
			details_parent_key INTEGER,
			details_name TEXT NOT NULL,
			FOREIGN KEY (details_parent_key) REFERENCES BillM (parent_key) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''',
      'INSERT INTO BillDetail_new(key,name,bill)SELECT key,name,bill FROM BillDetail;',
      'DROP TABLE BillDetail;',
      '''CREATE TABLE IF NOT EXISTS BillM_new(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			details_key INTEGER,
			name TEXT NOT NULL,
			memos TEXT NOT NULL
	)''',
      'INSERT INTO BillM_new(key,name)SELECT key,name FROM BillM;',
      'DROP TABLE BillM;',
      'ALTER TABLE BillM_new RENAME TO BillM;',
      BillDetailQuery.createTable,
      'INSERT INTO BillDetail(key,name,bill)SELECT key,name,bill FROM BillDetail_new;',
      'DROP TABLE BillDetail_new;'
    ]
  };

  static const $BillMSetArgs<int> key = $BillMSetArgs(
    name: 'key',
    nameCast: 'bill_m_key',
    model: 'bill_m',
  );

  static const $BillMSetArgs<String> name = $BillMSetArgs(
    name: 'name',
    nameCast: 'bill_m_name',
    model: 'bill_m',
  );

  @Deprecated('no such column')
  static const $BillMSetArgs<String> memos = $BillMSetArgs(
    name: 'memos',
    nameCast: 'bill_m_memos',
    model: 'bill_m',
  );

  static Set<$BillMSetArgs> $default = {
    BillMQuery.key,
    BillMQuery.name,
    BillMQuery.details$$.key,
    BillMQuery.details$$.name,
  };

// TODO(hodoan): check
  static String $createSelect(
    Set<$BillMSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<BillM>> getAll(
    Database database, {
    Set<$BillMSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillMSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM BillM bill_m
 LEFT JOIN BillDetail details_bill_detail ON details_bill_detail.bill = bill_m.key
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all BillM $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[BillMQuery.key.nameCast]]))
        .values
        .map((e) => BillM.fromDB(e.first, e))
        .toList();
  }

  static Future<List<BillM>> top(
    Database database, {
    Set<$BillMSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillMSetArgs>>? orderBy,
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
    final mapList =
        (await database.rawQuery('''SELECT count(*) as ns_count FROM BillM
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO BillM (key,
name,
memos) 
       VALUES(?, ?, ?)''', [
      key,
      this.name,
      const StringListConverter().toJson(this.memos),
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('BillM', toDB(), where: "key = ?", whereArgs: [this.key]);
  }

// TODO(hodoan): check
  static Future<BillM?> getById(
    Database database,
    int? key, {
    Set<$BillMSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM BillM bill_m
 LEFT JOIN BillDetail details_bill_detail ON details_bill_detail.bill = bill_m.key
WHERE bill_m.key = ?
''', [key]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? BillM.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM BillM bill_m WHERE bill_m.key = ?''', [this.key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database
        .rawQuery('''DELETE * FROM BillM bill_m WHERE bill_m.key = ?''', [key]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM BillM''');
  }

  static BillM $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      BillM(
          key: json['bill_m_key'] as int?,
          name: json['${childName}bill_m_name'] as String,
          memos: const StringListConverter()
              .fromJson(json['${childName}bill_m_memos'] as String?),
          details: lst.map((e) => BillDetail.fromDB(e, [])).toList());
  Map<String, dynamic> $toDB() => {
        'key': this.key,
        'name': this.name,
        'memos': const StringListConverter().toJson(this.memos)
      };
}

class $BillMSetArgs<T> extends WhereModel<T> {
  const $BillMSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$BillMSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}

class _$$$BillDetailSetArgs<T> extends $BillMSetArgs<T> {
  const _$$$BillDetailSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$BillDetailSetArgs {
  const _$$BillDetailSetArgs();

// ([details, key], nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_detail_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [BillM, BillDetail], fieldNames: [details, key], step: 2), parentClassName: [details])
  _$$$BillDetailSetArgs<int> get key => const _$$$BillDetailSetArgs(
        name: 'key',
        nameCast: 'details_key',
        model: 'details',
      );

// ([BillDetail, name], nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_detail_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [BillM, BillDetail], fieldNames: [details, name], step: 2), parentClassName: [details])
  _$$$BillDetailSetArgs<String> get name => const _$$$BillDetailSetArgs(
        name: 'name',
        nameCast: 'bill_detail_name',
        model: 'bill_detail',
      );
}

// ignore_for_file: library_private_types_in_public_api

extension BillDetailQuery on BillDetail {
  static const _$$BillMSetArgs parent$$ = _$$BillMSetArgs();

  static const String createTable = '''CREATE TABLE IF NOT EXISTS BillDetail(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			parent_key INTEGER,
			name TEXT NOT NULL,
			FOREIGN KEY (parent_key) REFERENCES BillM (key) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_detail_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [BillDetail], fieldNames: [key], step: 1), parentClassName: [],
nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_detail_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [BillDetail], fieldNames: [name], step: 1), parentClassName: []''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static const $BillDetailSetArgs<int> key = $BillDetailSetArgs(
    name: 'key',
    nameCast: 'bill_detail_key',
    model: 'bill_detail',
  );

  static const $BillDetailSetArgs<String> name = $BillDetailSetArgs(
    name: 'name',
    nameCast: 'bill_detail_name',
    model: 'bill_detail',
  );

  static Set<$BillDetailSetArgs> $default = {
    BillDetailQuery.key,
    BillDetailQuery.name,
    BillDetailQuery.parent$$.key,
    BillDetailQuery.parent$$.name,
    BillDetailQuery.parent$$.memos,
  };

// TODO(hodoan): check
  static String $createSelect(
    Set<$BillDetailSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<BillDetail>> getAll(
    Database database, {
    Set<$BillDetailSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillDetailSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM BillDetail bill_detail
 LEFT JOIN BillM bill_m ON bill_m.key = bill_detail.bill
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all BillDetail $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[BillDetailQuery.key.nameCast]]))
        .values
        .map((e) => BillDetail.fromDB(e.first, e))
        .toList();
  }

  static Future<List<BillDetail>> top(
    Database database, {
    Set<$BillDetailSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillDetailSetArgs>>? orderBy,
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
    final mapList =
        (await database.rawQuery('''SELECT count(*) as ns_count FROM BillDetail
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    await parent?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO BillDetail (key,
bill,
name) 
       VALUES(?, ?, ?)''', [
      key,
      this.name,
      parent?.key,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await parent?.update(database);
    return await database
        .update('BillDetail', toDB(), where: "key = ?", whereArgs: [this.key]);
  }

// TODO(hodoan): check
  static Future<BillDetail?> getById(
    Database database,
    int? key, {
    Set<$BillDetailSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM BillDetail bill_detail
 LEFT JOIN BillM bill_m ON bill_m.key = bill_detail.bill
WHERE bill_detail.key = ?
''', [key]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? BillDetail.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM BillDetail bill_detail WHERE bill_detail.key = ?''',
        [this.key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM BillDetail bill_detail WHERE bill_detail.key = ?''',
        [key]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM BillDetail''');
  }

  static BillDetail $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      BillDetail(
          key: json['bill_detail_key'] as int?,
          name: json['${childName}bill_detail_name'] as String,
          parent: BillM.fromDB(json, lst, 'parent_'));
  Map<String, dynamic> $toDB() =>
      {'key': this.key, 'name': this.name, 'parent_key': this.parent?.key};
}

class $BillDetailSetArgs<T> extends WhereModel<T> {
  const $BillDetailSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$BillDetailSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}

class _$$$BillMSetArgs<T> extends $BillDetailSetArgs<T> {
  const _$$$BillMSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$BillMSetArgs {
  const _$$BillMSetArgs();

// ([parent, key], nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_m_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [BillDetail, BillM], fieldNames: [parent, key], step: 2), parentClassName: [parent])
  _$$$BillMSetArgs<int> get key => const _$$$BillMSetArgs(
        name: 'key',
        nameCast: 'parent_key',
        model: 'parent',
      );

// ([BillM, name], nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_m_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [BillDetail, BillM], fieldNames: [parent, name], step: 2), parentClassName: [parent])
  _$$$BillMSetArgs<String> get name => const _$$$BillMSetArgs(
        name: 'name',
        nameCast: 'bill_m_name',
        model: 'bill_m',
      );

  @Deprecated('no such column')
// ([BillM, memos], nameDefault: memos, name: null, nameToDB: memos, nameFromDB: bill_m_memos, dartType: List<String>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [BillDetail, BillM], fieldNames: [parent, memos], step: 2), parentClassName: [parent])
  _$$$BillMSetArgs<String> get memos => const _$$$BillMSetArgs(
        name: 'memos',
        nameCast: 'bill_m_memos',
        model: 'bill_m',
      );
}
