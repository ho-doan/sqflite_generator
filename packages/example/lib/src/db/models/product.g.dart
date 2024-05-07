// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

extension ProductQuery on Product {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Product(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
			last_name TEXT NOT NULL,
			first_name TEXT NOT NULL,
			blocked BIT NOT NULL
	)''';

  static const String _selectAll = '''SELECT product.id as product_id,
product.last_name as product_last_name,
product.first_name as product_first_name,
product.blocked as product_blocked FROM Product product''';

  static Future<List<Product>> getAll(Database database) async =>
      (await database.rawQuery(ProductQuery._selectAll) as List<Map>)
          .map(Product.fromDB)
          .toList();
  Future<int> insert(Database database) async {
    final $productId =
        await database.rawInsert('''INSERT OR REPLACE INTO Product (id,
last_name,
first_name,
blocked) 
       VALUES(?, ?, ?, ?)''', [
      id,
      lastName,
      firstName,
      blocked,
    ]);
    return $productId;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Product', toDB(), where: "id = ?", whereArgs: [id]);
  }

  static Future<Product?> getById(
    Database database,
    int? id,
  ) async {
    final res = (await database.rawQuery('''SELECT product.id as product_id,
product.last_name as product_last_name,
product.first_name as product_first_name,
product.blocked as product_blocked,
WHERE product.id = ? FROM Product product''', [id]) as List<Map>);
    return res.isNotEmpty ? Product.fromDB(res.first) : null;
  }

  Future<void> delete(
    Database database,
    Product model,
  ) async {
    await database
        .rawQuery('''DELETE FROM Product product WHERE id = ?''', [model.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database
        .rawQuery('''DELETE FROM Product product WHERE id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Product''');
  }

  static Product $fromDB(Map json) => Product(
        id: json['product_id'] as int?,
        lastName: json['product_last_name'] as String,
        firstName: json['product_first_name'] as String,
        blocked: (json['product_blocked'] as int?) == 1,
      );
  Map<String, dynamic> $toDB() => {
        'id': id,
        'last_name': lastName,
        'first_name': firstName,
        'blocked': blocked,
      };
}
