// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension BillMQuery on BillM {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS BillM(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			details_bill_detail_key INTEGER,
			name TEXT NOT NULL,
			memos TEXT NOT NULL,
			null
	)''';

  static const String debug =
      '''(key, nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_m_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(bill_detail_key, nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_detail_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(name, nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_detail_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false),
(name, nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_m_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false),
(memos, nameDefault: memos, name: null, nameToDB: memos, nameFromDB: bill_m_memos, dartType: List<String>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false)''';

  static const Map<int, List<String>> alter = {
    2: ['ALTER TABLE BillM ADD memos TEXT;'],
    3: [
      '''CREATE TABLE IF NOT EXISTS BillDetail_new(
			bill_detail_key INTEGER PRIMARY KEY AUTOINCREMENT,
			parent_details_bill_detail_bill_m_key INTEGER,
			name TEXT NOT NULL,
			FOREIGN KEY (parent_details_bill_detail_bill_m_key) REFERENCES BillM (bill_detail_bill_m_key) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''',
      'INSERT INTO BillDetail_new(key,name,bill)SELECT key,name,bill FROM BillDetail;',
      'DROP TABLE BillDetail;',
      '''CREATE TABLE IF NOT EXISTS BillM_new(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			details_bill_detail_key INTEGER,
			name TEXT NOT NULL,
			memos TEXT NOT NULL,
			null
	)''',
      'INSERT INTO BillM_new(key,name)SELECT key,name FROM BillM;',
      'DROP TABLE BillM;',
      'ALTER TABLE BillM_new RENAME TO BillM;',
      BillDetailQuery.createTable,
      'INSERT INTO BillDetail(key,name,bill)SELECT key,name,bill FROM BillDetail_new;',
      'DROP TABLE BillDetail_new;'
    ]
  };

// APkEx(nameCast: bill_m_key, name: key, name2: null, model: BillM, children: [], property: nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_m_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [], fk: null)
  static const $BillMSetArgs<int> key = $BillMSetArgs(
    name: 'key',
    nameCast: 'bill_m_key',
    model: 'bill_m',
  );

// APkEx(nameCast: bill_detail_key, name: key, name2: details_key, model: BillDetail, children: [], property: nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_detail_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [details], fk: nameDefault: details, name: BillDetail, nameToDB: bill_detail, nameFromDB: bill_m_bill_detail, dartType: List<BillDetail>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false)
  static const $BillMSetArgs<int> detailsKey = $BillMSetArgs(
    name: 'key',
    nameCast: 'details_key',
    model: 'bill_detail',
  );

// APkEx(nameCast: bill_detail_name, name: details_name, name2: null, model: BillDetail, children: [], property: nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_detail_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [details], fk: null)
  static const $BillMSetArgs<String> detailsName = $BillMSetArgs(
    name: 'name',
    nameCast: 'bill_detail_name',
    model: 'bill_detail',
  );

// APkEx(nameCast: bill_m_name, name: name, name2: null, model: BillM, children: [], property: nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_m_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: name, parentClassName: [], fk: null)
  static const $BillMSetArgs<String> name = $BillMSetArgs(
    name: 'name',
    nameCast: 'bill_m_name',
    model: 'bill_m',
  );

  @Deprecated('no such column')
// APkEx(nameCast: bill_m_memos, name: memos, name2: null, model: BillM, children: [], property: nameDefault: memos, name: null, nameToDB: memos, nameFromDB: bill_m_memos, dartType: List<String>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: memos, parentClassName: [], fk: null)
  static const $BillMSetArgs<String> memos = $BillMSetArgs(
    name: 'memos',
    nameCast: 'bill_m_memos',
    model: 'bill_m',
  );

  static Set<$BillMSetArgs> $default = {
    BillMQuery.key,
    BillMQuery.detailsKey,
    BillMQuery.detailsName,
    BillMQuery.name,
  };

  static String $createSelect(
    Set<$BillMSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
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
        .groupBy(((m) => m[BillMQuery.key.nameCast]))
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

  Future<int> insert(Database database) async {
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO BillM (key,
name,
memos) 
       VALUES(?, ?, ?)''', [
      this.key,
      this.name,
      const StringListConverter().toJson(this.memos),
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('BillM', toDB(), where: "key = ?", whereArgs: [this.key]);
  }

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
    return res.isNotEmpty ? BillM.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM BillM bill_m WHERE bill_m.key = ?''', [this.key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database
        .rawQuery('''DELETE FROM BillM bill_m WHERE bill_m.key = ?''', [key]);
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
        key: json['${childName}bill_m_key'] as int?,
        key: json['${childName}bill_detail_key'] as int?,
        name: json['${childName}bill_m_name'] as String,
        memos: const StringListConverter()
            .fromJson(json['${childName}bill_m_memos'] as String?),
      );
  Map<String, dynamic> $toDB() => {
        'key': this.key,
        'name': this.name,
        'memos': const StringListConverter().toJson(this.memos),
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

extension BillDetailQuery on BillDetail {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS BillDetail(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			parent_bill_m_key INTEGER,
			name TEXT NOT NULL,
			FOREIGN KEY (parent_bill_m_key) REFERENCES BillM (key) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''(key, nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_detail_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(bill_m_key, nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_m_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(name, nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_m_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false),
(memos, nameDefault: memos, name: null, nameToDB: memos, nameFromDB: bill_m_memos, dartType: List<String>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false),
(name, nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_detail_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false)''';

  static const Map<int, List<String>> alter = {};

// APkEx(nameCast: bill_detail_key, name: key, name2: null, model: BillDetail, children: [], property: nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_detail_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [], fk: null)
  static const $BillDetailSetArgs<int> key = $BillDetailSetArgs(
    name: 'key',
    nameCast: 'bill_detail_key',
    model: 'bill_detail',
  );

// APkEx(nameCast: bill_m_key, name: key, name2: parent_key, model: BillM, children: [], property: nameDefault: key, name: null, nameToDB: key, nameFromDB: bill_m_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parent], fk: nameDefault: parent, name: Bill, nameToDB: bill, nameFromDB: bill_detail_bill, dartType: BillM?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $BillDetailSetArgs<int> parentKey = $BillDetailSetArgs(
    name: 'key',
    nameCast: 'parent_key',
    model: 'bill_m',
  );

// APkEx(nameCast: bill_m_name, name: parent_name, name2: null, model: BillM, children: [], property: nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_m_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [parent], fk: null)
  static const $BillDetailSetArgs<String> parentName = $BillDetailSetArgs(
    name: 'name',
    nameCast: 'bill_m_name',
    model: 'bill_m',
  );

  @Deprecated('no such column')
// APkEx(nameCast: bill_m_memos, name: parent_memos, name2: null, model: BillM, children: [], property: nameDefault: memos, name: null, nameToDB: memos, nameFromDB: bill_m_memos, dartType: List<String>, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [parent], fk: null)
  static const $BillDetailSetArgs<String> parentMemos = $BillDetailSetArgs(
    name: 'memos',
    nameCast: 'bill_m_memos',
    model: 'bill_m',
  );

// APkEx(nameCast: bill_detail_name, name: name, name2: null, model: BillDetail, children: [], property: nameDefault: name, name: null, nameToDB: name, nameFromDB: bill_detail_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: name, parentClassName: [], fk: null)
  static const $BillDetailSetArgs<String> name = $BillDetailSetArgs(
    name: 'name',
    nameCast: 'bill_detail_name',
    model: 'bill_detail',
  );

  static Set<$BillDetailSetArgs> $default = {
    BillDetailQuery.key,
    BillDetailQuery.parentKey,
    BillDetailQuery.parentName,
    BillDetailQuery.name,
  };

  static String $createSelect(
    Set<$BillDetailSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
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
        .groupBy(((m) => m[BillDetailQuery.key.nameCast]))
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

  Future<int> insert(Database database) async {
    final $billMIdParent = await parent?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO BillDetail (key,
bill,
name) 
       VALUES(?, ?, ?)''', [
      this.key,
      $billMIdParent,
      this.name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await parent?.update(database);
    return await database
        .update('BillDetail', toDB(), where: "key = ?", whereArgs: [this.key]);
  }

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
    return res.isNotEmpty ? BillDetail.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM BillDetail bill_detail WHERE bill_detail.key = ?''',
        [this.key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database.rawQuery(
        '''DELETE FROM BillDetail bill_detail WHERE bill_detail.key = ?''',
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
        key: json['${childName}bill_detail_key'] as int?,
        key: json['${childName}bill_m_key'] as int?,
        name: json['${childName}bill_detail_name'] as String,
      );
  Map<String, dynamic> $toDB() => {
        'key': this.key,
        'bill': parent?.key,
        'name': this.name,
      };
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
