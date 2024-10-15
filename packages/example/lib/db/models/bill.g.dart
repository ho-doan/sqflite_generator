// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension BillQuery on Bill {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
		time INTEGER,
			product_id INTEGER,
			client_id INTEGER,
			PRIMARY KEY(product_id, client_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id) REFERENCES Client (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const Map<int, List<String>> alter = {};

  static const $BillSetArgs<int> productId = $BillSetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product_product',
  );

  static const $BillSetArgs<String> productLastName = $BillSetArgs(
    name: 'lastName',
    nameCast: 'product_last_name',
    model: 'product_product',
  );

  static const $BillSetArgs<String> productFirstName = $BillSetArgs(
    name: 'firstName',
    nameCast: 'product_first_name',
    model: 'product_product',
  );

  static const $BillSetArgs<String> productBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product_product',
  );

  static const $BillSetArgs<int> clientId = $BillSetArgs(
    name: 'id',
    nameCast: 'client_id',
    model: 'client_client',
  );

  static const $BillSetArgs<String> clientProduct = $BillSetArgs(
    name: 'product',
    nameCast: 'client_product_id',
    model: 'client_client',
  );

  static const $BillSetArgs<String> clientFirstName = $BillSetArgs(
    name: 'firstName',
    nameCast: 'client_first_name',
    model: 'client_client',
  );

  static const $BillSetArgs<String> clientLastName = $BillSetArgs(
    name: 'lastName',
    nameCast: 'client_last_name',
    model: 'client_client',
  );

  static const $BillSetArgs<String> clientBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'client_blocked',
    model: 'client_client',
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

    final mapList = (await database
        .rawQuery('''SELECT ${$createSelect(select)} FROM Bill bill
 LEFT JOIN Product product ON product.id = bill.product_id
 LEFT JOIN Client client ON client.id = bill.client_id
${whereStr.isNotEmpty ? whereStr : ''}
''') as List<Map>);
    return mapList
        .groupBy(((m) => m[BillQuery.productId.nameCast]))
        .values
        .map((e) => Bill.fromDB(e.first, e))
        .toList();
  }

  Future<int> insert(Database database) async {
    final $productIdProduct = await product?.insert(database);
    final $clientIdClient = await client?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Bill (product_id,
client_id,
time) 
       VALUES(?, ?, ?)''', [
      $productIdProduct,
      $clientIdClient,
      this.time,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product?.update(database);
    await client?.update(database);
    return await database.update('Bill', toDB(),
        where: "bill.product_id = ? AND bill.client_id = ?",
        whereArgs: [product?.id, client?.id]);
  }

  static Future<Bill?> getById(
    Database database,
    int? productId,
    int? clientId, {
    Set<$BillSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Bill bill
 LEFT JOIN Product product ON product.id = bill.product_id
 LEFT JOIN Client client ON client.id = bill.client_id
WHERE bill.product_id = ? AND bill.client_id = ?
''', [productId, clientId]) as List<Map>);
    return res.isNotEmpty ? Bill.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Bill bill WHERE bill.product_id = ? AND bill.client_id = ?''',
        [product?.id, client?.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? productId,
    int? clientId,
  ) async {
    await database.rawQuery(
        '''DELETE FROM Bill bill WHERE bill.product_id = ? AND bill.client_id = ?''',
        [productId, clientId]);
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
        time: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}bill_time'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'product_id': product?.id,
        'client_id': client?.id,
        'time': this.time?.millisecondsSinceEpoch,
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
