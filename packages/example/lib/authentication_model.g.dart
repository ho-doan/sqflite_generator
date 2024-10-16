// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension BillQuery on Bill {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
		key INTEGER PRIMARY KEY AUTOINCREMENT,
			name TEXT NOT NULL
	)''';

  static const Map<int, List<String>> alter = {
    2: ['ALTER TABLE Bill ADD memos TEXT;'],
    3: [
      '''CREATE TABLE IF NOT EXISTS BillDetail_new(
		key INTEGER PRIMARY KEY AUTOINCREMENT,
			name TEXT NOT NULL,
			bill NONE
	)''',
      'INSERT INTO BillDetail_new(key,name,bill)SELECT key,name,bill FROM BillDetail;',
      'DROP TABLE BillDetail;',
      '''CREATE TABLE IF NOT EXISTS Bill_new(
		key INTEGER PRIMARY KEY AUTOINCREMENT,
			name TEXT NOT NULL
	)''',
      'INSERT INTO Bill_new(key,name)SELECT key,name FROM Bill;',
      'DROP TABLE Bill;',
      'ALTER TABLE Bill_new RENAME TO Bill;',
      BillDetailQuery.createTable,
      'INSERT INTO BillDetail(key,name,bill)SELECT key,name,bill FROM BillDetail_new;',
      'DROP TABLE BillDetail_new;'
    ]
  };

  static const $BillSetArgs<int> key = $BillSetArgs(
    name: 'key',
    nameCast: 'bill_key',
    model: 'bill',
  );

  static const $BillSetArgs<int> billDetailDetailsKey = $BillSetArgs(
    name: 'key',
    nameCast: 'bill_detail_key',
    model: 'details_bill_detail',
  );

  static const $BillSetArgs<String> billDetailDetailsName = $BillSetArgs(
    name: 'name',
    nameCast: 'bill_detail_name',
    model: 'details_bill_detail',
  );

  static const $BillSetArgs<String> name = $BillSetArgs(
    name: 'name',
    nameCast: 'bill_name',
    model: 'bill',
  );

  @Deprecated('no such column')
  static const $BillSetArgs<String> memos = $BillSetArgs(
    name: 'memos',
    nameCast: 'bill_memos',
    model: 'bill',
  );

  static Set<$BillSetArgs> $default = {
    BillQuery.key,
    BillQuery.billDetailDetailsKey,
    BillQuery.billDetailDetailsName,
    BillQuery.name,
  };

  static String $createSelect(
    Set<$BillSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<Bill>> getAll(
    Database database, {
    Set<$BillSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Bill bill
 LEFT JOIN BillDetail details_bill_detail ON details_bill_detail.bill = bill.key
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Bill $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[BillQuery.key.nameCast]))
        .values
        .map((e) => Bill.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Bill>> top(
    Database database, {
    Set<$BillSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Bill
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Bill (key,
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
        .update('Bill', toDB(), where: "key = ?", whereArgs: [this.key]);
  }

  static Future<Bill?> getById(
    Database database,
    int? key, {
    Set<$BillSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Bill bill
 LEFT JOIN BillDetail details_bill_detail ON details_bill_detail.bill = bill.key
WHERE bill.key = ?
''', [key]) as List<Map>);
    return res.isNotEmpty ? Bill.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database
        .rawQuery('''DELETE FROM Bill bill WHERE bill.key = ?''', [this.key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database
        .rawQuery('''DELETE FROM Bill bill WHERE bill.key = ?''', [key]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Bill''');
  }

  static Bill $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      Bill(
        key: json['${childName}bill_key'] as int?,
        details: lst.map((e) => BillDetail.fromDB(e, [])).toList(),
        name: json['${childName}bill_name'] as String,
        memos: const StringListConverter()
            .fromJson(json['${childName}bill_memos'] as String?),
      );
  Map<String, dynamic> $toDB() => {
        'key': this.key,
        'name': this.name,
        'memos': const StringListConverter().toJson(this.memos),
      };
}

class $BillSetArgs<T> extends WhereModel<T> {
  const $BillSetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}

extension BillDetailQuery on BillDetail {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS BillDetail(
		key INTEGER PRIMARY KEY AUTOINCREMENT,
			name TEXT NOT NULL,
			bill INTEGER,
			FOREIGN KEY (bill) REFERENCES Bill (key) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const Map<int, List<String>> alter = {};

  static const $BillDetailSetArgs<int> key = $BillDetailSetArgs(
    name: 'key',
    nameCast: 'bill_detail_key',
    model: 'bill_detail',
  );

  static const $BillDetailSetArgs<int> billParentKey = $BillDetailSetArgs(
    name: 'key',
    nameCast: 'bill_key',
    model: 'parent_bill',
  );

  static const $BillDetailSetArgs<String> billParentName = $BillDetailSetArgs(
    name: 'name',
    nameCast: 'bill_name',
    model: 'parent_bill',
  );

  @Deprecated('no such column')
  static const $BillDetailSetArgs<String> billParentMemos = $BillDetailSetArgs(
    name: 'memos',
    nameCast: 'bill_memos',
    model: 'parent_bill',
  );

  static const $BillDetailSetArgs<String> name = $BillDetailSetArgs(
    name: 'name',
    nameCast: 'bill_detail_name',
    model: 'bill_detail',
  );

  static Set<$BillDetailSetArgs> $default = {
    BillDetailQuery.key,
    BillDetailQuery.billParentKey,
    BillDetailQuery.billParentName,
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
 LEFT JOIN Bill bill ON bill.key = bill_detail.bill
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}
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
    final $billIdParent = await parent?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO BillDetail (key,
bill,
name) 
       VALUES(?, ?, ?)''', [
      this.key,
      $billIdParent,
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
 LEFT JOIN Bill bill ON bill.key = bill_detail.bill
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
        parent: Bill.fromDB(json, []),
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
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
