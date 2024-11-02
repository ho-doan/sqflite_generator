// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension BillQuery on Bill {
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
([Bill, product, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [product]),
([Bill, product, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [product]),
([Bill, product, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [product]),
([Bill, client, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [client]),
([Bill, client, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [client]),
([Bill, client, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [client]),
([Bill, parent, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [parent]),
([Bill, parentClient, parentClient, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [parentClient]),
([Bill, parentClient, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [parentClient]),
([Bill, parentClient, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [parentClient]),
([Bill, parentClient, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [parentClient]),
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

// ([Bill, product, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [product])
  static const $BillSetArgs<String> productLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'bill_product_last_name',
    model: 'bill_product',
  );

// ([Bill, product, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [product])
  static const $BillSetArgs<String> productFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'bill_product_first_name',
    model: 'bill_product',
  );

// ([Bill, product, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [product])
  static const $BillSetArgs<bool> productBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'bill_product_blocked',
    model: 'bill_product',
  );

// ([Bill, client, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [client])
  static const $BillSetArgs<String> clientFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'bill_client_first_name',
    model: 'bill_client',
  );

// ([Bill, client, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [client])
  static const $BillSetArgs<String> clientLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'bill_client_last_name',
    model: 'bill_client',
  );

// ([Bill, client, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [client])
  static const $BillSetArgs<bool> clientBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'bill_client_blocked',
    model: 'bill_client',
  );

// ([Bill, parent, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [parent])
  static const $BillSetArgs<String> parentTime = $BillSetArgs(
    name: 'time',
    nameCast: 'bill_parent_time',
    model: 'bill_parent',
  );

// ([Bill, parentClient, parentClient, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, parentClassName: [parentClient])
  static const $BillSetArgs<int> parentClientParentClientId = $BillSetArgs(
    name: 'id',
    nameCast: 'bill_parent_client_parent_client_id',
    model: 'bill_parent_client_parent_client',
  );

// ([Bill, parentClient, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [parentClient])
  static const $BillSetArgs<String> parentClientFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'bill_parent_client_first_name',
    model: 'bill_parent_client',
  );

// ([Bill, parentClient, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, parentClassName: [parentClient])
  static const $BillSetArgs<String> parentClientLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'bill_parent_client_last_name',
    model: 'bill_parent_client',
  );

// ([Bill, parentClient, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, parentClassName: [parentClient])
  static const $BillSetArgs<bool> parentClientBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'bill_parent_client_blocked',
    model: 'bill_parent_client',
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
    BillQuery.productLastName,
    BillQuery.productFirstName,
    BillQuery.productBlocked,
    BillQuery.clientFirstName,
    BillQuery.clientLastName,
    BillQuery.clientBlocked,
    BillQuery.parentTime,
    BillQuery.parentClientParentClientId,
    BillQuery.parentClientFirstName,
    BillQuery.parentClientLastName,
    BillQuery.parentClientBlocked,
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
