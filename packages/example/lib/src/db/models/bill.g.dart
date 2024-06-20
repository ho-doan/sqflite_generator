// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

extension BillQuery on Bill {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
		time INTEGER,
			product_id INTEGER,
			client_id INTEGER,
			PRIMARY KEY(product_id, client_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id) REFERENCES Client (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const $BillSelectArgs $default = $BillSelectArgs(
      product: ProductQuery.$default, client: ClientQuery.$default, time: true);

  static String $createSelect(
    $BillSelectArgs? select, [
    String childName = '',
  ]) =>
      select?.$check == true
          ? [
              ProductQuery.$createSelect(select?.product, ''),
              ClientQuery.$createSelect(select?.client, ''),
              if (select?.time ?? false)
                '${childName}bill.time as ${childName}bill_time'
            ].join(',')
          : $createSelect($default);
  static String $createWhere(
    $BillWhereArgs? where, [
    String childName = '',
  ]) =>
      [
        ProductQuery.$createWhere(where?.product, ''),
        ClientQuery.$createWhere(where?.client, ''),
        if (where?.time != null) '${childName}bill.time = ${where?.time}'
      ].join(' AND ').whereStr;
  static Future<List<Bill>> getAll(
    Database database, {
    $BillSelectArgs? select,
    $BillWhereArgs? where,
  }) async =>
      (await database.rawQuery('''SELECT ${$createSelect(select)} FROM Bill bill
 INNER JOIN Product product ON product.id = bill.product_id
 INNER JOIN Client client ON client.id = bill.client_id
''') as List<Map>).map(Bill.fromDB).toList();
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
      time,
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
    $BillSelectArgs? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Bill bill
WHERE bill.product_id = ? AND bill.client_id = ?
 INNER JOIN Product product ON product.id = bill.product_id
 INNER JOIN Client client ON client.id = bill.client_id
''', [productId, clientId]) as List<Map>);
    return res.isNotEmpty ? Bill.fromDB(res.first) : null;
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
    Map json, [
    String childName = '',
  ]) =>
      Bill(
        product: Product?.fromDB(json, ''),
        client: Client?.fromDB(json, ''),
        time: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}bill_time'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'product_id': product?.id,
        'client_id': client?.id,
        'time': time?.millisecondsSinceEpoch,
      };
}

class $BillSelectArgs {
  const $BillSelectArgs({
    this.product,
    this.client,
    this.time,
  });

  final $ProductSelectArgs? product;

  final $ClientSelectArgs? client;

  final bool? time;

  bool get $check =>
      product?.$check == true || client?.$check == true || time == true;
}

class $BillWhereArgs {
  const $BillWhereArgs({
    this.product,
    this.client,
    this.time,
  });

  final $ProductWhereArgs? product;

  final $ClientWhereArgs? client;

  final DateTime? time;
}
