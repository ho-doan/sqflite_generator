// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension BillQuery on Bill {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
			product_id INTEGER,
			client_id INTEGER,
			client_product_id INTEGER,
			bill_time INTEGER,
			parent_product_id INTEGER,
			parent_client_id INTEGER,
			parent_client_product_id INTEGER,
			PRIMARY KEY(product_id, client_id, client_product_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id,client_product_id) REFERENCES Client (id,id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_product_id,parent_client_id,parent_client_product_id) REFERENCES Bill (product_id,client_id,product_id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''nameCast: time, name: time, model: bill, self: null modelParent: null,
nameCast: product_last_name, name: last_name, model: product, self: product modelParent: Bill,
nameCast: product_first_name, name: first_name, model: product, self: product modelParent: Bill,
nameCast: product_blocked, name: blocked, model: product, self: product modelParent: Bill,
nameCast: client_first_name, name: first_name, model: client, self: client modelParent: Bill,
nameCast: client_last_name, name: last_name, model: client, self: client modelParent: Bill,
nameCast: client_blocked, name: blocked, model: client, self: client modelParent: Bill,
nameCast: product_last_name, name: last_name, model: product, self: product modelParent: Client,
nameCast: product_first_name, name: first_name, model: product, self: product modelParent: Client,
nameCast: product_blocked, name: blocked, model: product, self: product modelParent: Client,
nameCast: bill_time, name: time, model: bill, self: bill modelParent: Bill,
nameCast: product_last_name, name: last_name, model: product, self: product modelParent: Bill,
nameCast: product_first_name, name: first_name, model: product, self: product modelParent: Bill,
nameCast: product_blocked, name: blocked, model: product, self: product modelParent: Bill,
nameCast: client_first_name, name: first_name, model: client, self: client modelParent: Bill,
nameCast: client_last_name, name: last_name, model: client, self: client modelParent: Bill,
nameCast: client_blocked, name: blocked, model: client, self: client modelParent: Bill,
nameCast: bill_time, name: time, model: bill, self: bill modelParent: Bill''';

  static const Map<int, List<String>> alter = {};

// nameCast: time, name: time, model: bill, self: null modelParent: null
// name: bill_time, children: [null] self: null, selfIs: true modelParent: null property: nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false
  static const $BillSetArgs<String> $time = $BillSetArgs(
    name: 'time',
    nameCast: 'time',
    model: 'bill',
  );

// nameCast: product_last_name, name: last_name, model: product, self: product modelParent: Bill
// name: product_last_name, children: [null] self: null, selfIs: false modelParent: Bill property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $BillSetArgs<String> $productLastName = $BillSetArgs(
    name: 'last_name',
    self: 'product',
    nameCast: 'product_last_name',
    model: 'product',
  );

// nameCast: product_first_name, name: first_name, model: product, self: product modelParent: Bill
// name: product_first_name, children: [null] self: null, selfIs: false modelParent: Bill property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $BillSetArgs<String> $productFirstName = $BillSetArgs(
    name: 'first_name',
    self: 'product',
    nameCast: 'product_first_name',
    model: 'product',
  );

// nameCast: product_blocked, name: blocked, model: product, self: product modelParent: Bill
// name: product_blocked, children: [null] self: null, selfIs: false modelParent: Bill property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false
  static const $BillSetArgs<bool> $productBlocked = $BillSetArgs(
    name: 'blocked',
    self: 'product',
    nameCast: 'product_blocked',
    model: 'product',
  );

// nameCast: client_first_name, name: first_name, model: client, self: client modelParent: Bill
// name: client_first_name, children: [null] self: null, selfIs: false modelParent: Bill property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $BillSetArgs<String> $clientFirstName = $BillSetArgs(
    name: 'first_name',
    self: 'client',
    nameCast: 'client_first_name',
    model: 'client',
  );

// nameCast: client_last_name, name: last_name, model: client, self: client modelParent: Bill
// name: client_last_name, children: [null] self: null, selfIs: false modelParent: Bill property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $BillSetArgs<String> $clientLastName = $BillSetArgs(
    name: 'last_name',
    self: 'client',
    nameCast: 'client_last_name',
    model: 'client',
  );

// nameCast: client_blocked, name: blocked, model: client, self: client modelParent: Bill
// name: client_blocked, children: [null] self: null, selfIs: false modelParent: Bill property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false
  static const $BillSetArgs<bool> $clientBlocked = $BillSetArgs(
    name: 'blocked',
    self: 'client',
    nameCast: 'client_blocked',
    model: 'client',
  );

// nameCast: bill_time, name: time, model: bill, self: bill modelParent: Bill
// name: bill_time, children: [null] self: null, selfIs: true modelParent: Bill property: nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false
  static const $BillSetArgs<String> $billTime = $BillSetArgs(
    name: 'time',
    self: 'bill',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static const $BillSetArgs<int> productId = $BillSetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product',
  );

  static const $BillSetArgs<String> productLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product',
  );

  static const $BillSetArgs<String> productFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product',
  );

  static const $BillSetArgs<bool> productBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product',
  );

  static const $BillSetArgs<int> clientId = $BillSetArgs(
    name: 'id',
    nameCast: 'client_id',
    model: 'client',
  );

  static const $BillSetArgs<String> clientProduct = $BillSetArgs(
    name: 'product',
    nameCast: 'client_product',
    model: 'client',
  );

  static const $BillSetArgs<String> clientFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'client_first_name',
    model: 'client',
  );

  static const $BillSetArgs<String> clientLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'client_last_name',
    model: 'client',
  );

  static const $BillSetArgs<bool> clientBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'client_blocked',
    model: 'client',
  );

  static const $BillSetArgs<String> billParentProduct = $BillSetArgs(
    name: 'product',
    self: 'parent',
    nameCast: 'bill_product',
    model: 'bill',
  );

  static const $BillSetArgs<String> billParentClient = $BillSetArgs(
    name: 'client',
    self: 'parent',
    nameCast: 'bill_client',
    model: 'bill',
  );

  static const $BillSetArgs<String> billParentTime = $BillSetArgs(
    name: 'time',
    self: 'parent',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static const $BillSetArgs<String> time = $BillSetArgs(
    name: 'time',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static Set<$BillSetArgs> $default = {
    BillQuery.productId,
    BillQuery.productLastName,
    BillQuery.productFirstName,
    BillQuery.productBlocked,
    BillQuery.clientId,
    BillQuery.clientProduct,
    BillQuery.clientFirstName,
    BillQuery.clientLastName,
    BillQuery.clientBlocked,
    BillQuery.billParentProduct,
    BillQuery.billParentClient,
    BillQuery.billParentTime,
    BillQuery.time,
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
 LEFT JOIN Client client ON client.id = bill.client AND client.product = bill.client
 LEFT JOIN Bill parent_bill ON parent_bill.product = bill.bill AND parent_bill.client = bill.bill
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
        .groupBy(((m) => m[BillQuery.productId.nameCast]))
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
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Bill (product,
client,
bill,
time) 
       VALUES(?, ?, ?, ?)''', [
      $productIdProduct,
      $clientIdClient,
      $billIdParent,
      this.time,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product?.update(database);
    await client?.update(database);
    await parent?.update(database);
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
 LEFT JOIN Client client ON client.id = bill.client AND client.product = bill.client
 LEFT JOIN Bill parent_bill ON parent_bill.product = bill.bill AND parent_bill.client = bill.bill
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
        product: Product.fromDB(json, []),
        client: Client.fromDB(json, []),
        parent: Bill.fromDB(json, []),
        time: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}bill_time'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'product': product?.id,
        'client': client?.id,
        'bill': parent?.product,
        'time': this.time?.millisecondsSinceEpoch,
      };
}

class $BillSetArgs<T> extends WhereModel<T> {
  const $BillSetArgs({
    this.self = '',
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final String name;

  final String model;

  final String nameCast;
}
