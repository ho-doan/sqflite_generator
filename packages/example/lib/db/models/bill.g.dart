// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension BillQuery on Bill {
  static const _$$ProductSetArgs product = _$$ProductSetArgs();

  static const _$$ClientSetArgs client = _$$ClientSetArgs();

  static const _$$ProductSetArgs clientProduct = _$$ProductSetArgs();

  static const _$$BillSetArgs parent = _$$BillSetArgs();

  static const _$$ClientSetArgs parentClient = _$$ClientSetArgs();

  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
			product_id INTEGER,
			client_id INTEGER,
			client_client_product_id INTEGER,
			parent_parent_bill_product_id INTEGER,
			parent_parent_bill_client_id INTEGER,
			parent_parent_bill_client_product_id INTEGER,
			parent_client_client_id INTEGER,
			parent_client_parent_client_client_product_id INTEGER,
			time INTEGER,
			PRIMARY KEY [product_id, client_id, client_client_product_id],
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id,client_client_product_id) REFERENCES Client (id,client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_parent_bill_product_id,parent_parent_bill_client_id,parent_parent_bill_client_product_id) REFERENCES Bill (bill_product_id,bill_client_id,bill_client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_client_client_id,parent_client_parent_client_client_product_id) REFERENCES Client (id,client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''([Bill, product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [product]),
([Bill, client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [client]),
([Bill, client, Client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [client, Client]),
([Bill, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [])''';

  static const Map<int, List<String>> alter = {};

// ([Bill, product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [product])
  static const $BillSetArgs<int> productId = $BillSetArgs(
    name: 'id',
    nameCast: 'bill_product_id',
    model: 'bill_product',
  );

// ([Bill, client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [client])
  static const $BillSetArgs<int> clientId = $BillSetArgs(
    name: 'id',
    nameCast: 'bill_client_id',
    model: 'bill_client',
  );

// ([Bill, client, Client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [client, Client])
  static const $BillSetArgs<int> clientClientId = $BillSetArgs(
    name: 'id',
    nameCast: 'bill_client_client_id',
    model: 'bill_client_client',
  );

// ([Bill, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [])
  static const $BillSetArgs<String> time = $BillSetArgs(
    name: 'time',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static Set<$BillSetArgs> $default = {
    BillQuery.productId,
    BillQuery.clientId,
    BillQuery.clientClientId,
    BillQuery.time,
    BillQuery.product.id,
    BillQuery.product.lastName,
    BillQuery.product.firstName,
    BillQuery.product.blocked,
    BillQuery.client.id,
    BillQuery.client.firstName,
    BillQuery.client.lastName,
    BillQuery.client.blocked,
    BillQuery.parent.time,
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
 LEFT JOIN Product product ON product.id = bill.product
 LEFT JOIN Client client_client ON client_client.id = bill.client AND client_client.product = bill.client
 LEFT JOIN Bill parent_bill ON parent_bill.product = bill.bill AND parent_bill.client = bill.bill
 LEFT JOIN Client parent_client_client ON parent_client_client.id = bill.client AND parent_client_client.product = bill.client
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Bill $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[BillQuery.product.nameCast]))
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
    final $productIdProduct = await product?.insert(database);
    final $clientIdClient = await client?.insert(database);
    final $billIdParent = await parent?.insert(database);
    final $clientIdParentClient = await parentClient?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Bill (product,
client,
product,
client,
bill,
client,
time) 
       VALUES(?, ?, ?, ?, ?, ?, ?)''', [
      this.product,
      this.client,
      $productIdProduct,
      $clientIdClient,
      $billIdParent,
      $clientIdParentClient,
      this.time,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product?.update(database);
    await client?.update(database);
    await parent?.update(database);
    await parentClient?.update(database);
    return await database.update('Bill', toDB(),
        where: "product = ? AND client = ?",
        whereArgs: [product?.id, client?.id, client?.product]);
  }

  static Future<Bill?> getById(
    Database database,
    int? productId,
    int? clientId,
    int? productId,
    Product productProduct, {
    Set<$BillSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Bill bill
 LEFT JOIN Product product ON product.id = bill.product
 LEFT JOIN Client client_client ON client_client.id = bill.client AND client_client.product = bill.client
 LEFT JOIN Bill parent_bill ON parent_bill.product = bill.bill AND parent_bill.client = bill.bill
 LEFT JOIN Client parent_client_client ON parent_client_client.id = bill.client AND parent_client_client.product = bill.client
WHERE bill.product = ? AND bill.client = ?
''', [productId, clientId, clientProduct]) as List<Map>);
    return res.isNotEmpty ? Bill.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Bill bill WHERE bill.product = ? AND bill.client = ?''',
        [product?.id, client?.id, client?.product]);
  }

  static Future<void> deleteById(
    Database database,
    int? productId,
    int? clientId,
    int? productId,
    Product productProduct,
  ) async {
    await database.rawQuery(
        '''DELETE FROM Bill bill WHERE bill.product = ? AND bill.client = ?''',
        [productId, clientId, clientProduct]);
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
        id: json['${childName}product_id'] as int?,
        id: json['${childName}client_id'] as int?,
        id: json['${childName}product_id'] as int?,
        id: json['${childName}product_id'] as int?,
        id: json['${childName}client_id'] as int?,
        id: json['${childName}product_id'] as int?,
        id: json['${childName}client_id'] as int?,
        id: json['${childName}product_id'] as int?,
        time: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}bill_time'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'product': this.product,
        'client': this.client,
        'product': product?.id,
        'client': client?.id,
        'bill': parent?.product,
        'client': parentClient?.id,
        'time': this.time?.millisecondsSinceEpoch,
      };
}

class $BillSetArgs<T> extends WhereModel<T> {
  const $BillSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$BillSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}

class _$$$ProductSetArgs<T> extends $BillSetArgs<T> {
  const _$$$ProductSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$$ClientSetArgs<T> extends $BillSetArgs<T> {
  const _$$$ClientSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$$BillSetArgs<T> extends $BillSetArgs<T> {
  const _$$$BillSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$ProductSetArgs {
  const _$$ProductSetArgs();

// ([product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [product])
  _$$$ProductSetArgs<int> get id => const _$$$ProductSetArgs(
        name: 'id',
        nameCast: 'product_id',
        model: 'product',
      );

// ([Product, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [product])
  _$$$ProductSetArgs<String> get lastName => const _$$$ProductSetArgs(
        name: 'last_name',
        nameCast: 'product_last_name',
        model: 'product',
      );

// ([Product, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [product])
  _$$$ProductSetArgs<String> get firstName => const _$$$ProductSetArgs(
        name: 'first_name',
        nameCast: 'product_first_name',
        model: 'product',
      );

// ([Product, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [product])
  _$$$ProductSetArgs<bool> get blocked => const _$$$ProductSetArgs(
        name: 'blocked',
        nameCast: 'product_blocked',
        model: 'product',
      );
}

class _$$ClientSetArgs {
  const _$$ClientSetArgs();

// ([client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [client])
  _$$$ClientSetArgs<int> get id => const _$$$ClientSetArgs(
        name: 'id',
        nameCast: 'client_id',
        model: 'client',
      );

// ([Client, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [client])
  _$$$ClientSetArgs<String> get firstName => const _$$$ClientSetArgs(
        name: 'first_name',
        nameCast: 'client_first_name',
        model: 'client',
      );

// ([Client, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [client])
  _$$$ClientSetArgs<String> get lastName => const _$$$ClientSetArgs(
        name: 'last_name',
        nameCast: 'client_last_name',
        model: 'client',
      );

// ([Client, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [client])
  _$$$ClientSetArgs<bool> get blocked => const _$$$ClientSetArgs(
        name: 'blocked',
        nameCast: 'client_blocked',
        model: 'client',
      );
}

class _$$BillSetArgs {
  const _$$BillSetArgs();

// ([Bill, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [parent])
  _$$$BillSetArgs<String> get time => const _$$$BillSetArgs(
        name: 'time',
        nameCast: 'bill_time',
        model: 'bill',
      );
}
