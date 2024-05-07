// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

extension CategoryQuery on Category {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Category(
		key INTEGER PRIMARY KEY AUTOINCREMENT,
			id TEXT NOT NULL,
			name TEXT NOT NULL,
			product_id INTEGER NOT NULL,
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String _selectAll = '''SELECT category.key as category_key,
category.id as category_id,
category.name as category_name,
category.product_id as category_product_id,
product.id as product_id,
product.last_name as product_last_name,
product.first_name as product_first_name,
product.blocked as product_blocked FROM Category category
 INNER JOIN Product product ON product.id = category.product_id''';

  static Future<List<Category>> getAll(Database database) async =>
      (await database.rawQuery(CategoryQuery._selectAll) as List<Map>)
          .map(Category.fromDB)
          .toList();
  Future<int> insert(Database database) async {
    final $productId = await product.insert(database);
    final $categoryId =
        await database.rawInsert('''INSERT OR REPLACE INTO Category (key,
id,
name,
product_id) 
       VALUES(?, ?, ?, ?)''', [
      key,
      id,
      name,
      $productId,
    ]);
    return $categoryId;
  }

  Future<int> update(Database database) async {
    await product.update(database);
    return await database
        .update('Category', toDB(), where: "key = ?", whereArgs: [key]);
  }

  static Future<Category?> getById(
    Database database,
    int? id,
  ) async {
    final res = (await database.rawQuery('''SELECT category.key as category_key,
category.id as category_id,
category.name as category_name,
category.product_id as category_product_id,
product.id as product_id,
product.last_name as product_last_name,
product.first_name as product_first_name,
product.blocked as product_blocked,
WHERE category.key = ? FROM Category category
 INNER JOIN Product product ON product.id = category.product_id''', [id])
        as List<Map>);
    return res.isNotEmpty ? Category.fromDB(res.first) : null;
  }

  Future<void> delete(
    Database database,
    Category model,
  ) async {
    await database.rawQuery(
        '''DELETE FROM Category category WHERE key = ?''', [model.key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database
        .rawQuery('''DELETE FROM Category category WHERE key = ?''', [key]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Category''');
  }

  static Category $fromDB(Map json) => Category(
        key: json['category_key'] as int?,
        id: json['category_id'] as String,
        name: json['category_name'] as String,
        product: Product.fromDB(json),
      );
  Map<String, dynamic> $toDB() => {
        'key': key,
        'id': id,
        'name': name,
        'product_id': product.id,
      };
}
