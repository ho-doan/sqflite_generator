// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

extension ClientQuery on Client {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Client(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
			first_name TEXT NOT NULL,
			last_name TEXT NOT NULL,
			blocked BIT NOT NULL,
			product_id INTEGER NOT NULL,
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String _selectAll = '''SELECT client.id as client_id,
client.first_name as client_first_name,
client.last_name as client_last_name,
client.blocked as client_blocked,
client.product_id as client_product_id,
product.id as product_id,
product.last_name as product_last_name,
product.first_name as product_first_name,
product.blocked as product_blocked FROM Client client
 INNER JOIN Product product ON product.id = client.product_id''';

  static Future<List<Client>> getAll(Database database) async =>
      (await database.rawQuery(ClientQuery._selectAll) as List<Map>)
          .map(Client.fromDB)
          .toList();
  Future<int> insert(Database database) async {
    final $productId = await product.insert(database);
    final $clientId =
        await database.rawInsert('''INSERT OR REPLACE INTO Client (id,
first_name,
last_name,
blocked,
product_id) 
       VALUES(?, ?, ?, ?, ?)''', [
      id,
      firstName,
      lastName,
      blocked,
      $productId,
    ]);
    return $clientId;
  }

  Future<int> update(Database database) async {
    await product.update(database);
    return await database
        .update('Client', toDB(), where: "id = ?", whereArgs: [id]);
  }

  static Future<Client?> getById(
    Database database,
    int? id,
  ) async {
    final res = (await database.rawQuery('''SELECT client.id as client_id,
client.first_name as client_first_name,
client.last_name as client_last_name,
client.blocked as client_blocked,
client.product_id as client_product_id,
product.id as product_id,
product.last_name as product_last_name,
product.first_name as product_first_name,
product.blocked as product_blocked,
WHERE client.id = ? FROM Client client
 INNER JOIN Product product ON product.id = client.product_id''', [id])
        as List<Map>);
    return res.isNotEmpty ? Client.fromDB(res.first) : null;
  }

  Future<void> delete(
    Database database,
    Client model,
  ) async {
    await database
        .rawQuery('''DELETE FROM Client client WHERE id = ?''', [model.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database.rawQuery('''DELETE FROM Client client WHERE id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Client''');
  }

  static Client $fromDB(Map json) => Client(
        id: json['client_id'] as int?,
        firstName: json['client_first_name'] as String,
        lastName: json['client_last_name'] as String,
        blocked: (json['client_blocked'] as int?) == 1,
        product: Product.fromDB(json),
      );
  Map<String, dynamic> $toDB() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'blocked': blocked,
        'product_id': product.id,
      };
}
