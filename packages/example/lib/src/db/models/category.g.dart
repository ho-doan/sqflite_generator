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

  static final String _selectAll =
      '''SELECT ${$createSelect($default)} FROM Category category
 INNER JOIN Product product ON product.id = category.product_id''';

  static const $CategorySelectArgs $default = $CategorySelectArgs(
      key: true, id: true, name: true, product: ProductQuery.$default);

  static String $createSelect($CategorySelectArgs? args) => args?.$check == true
      ? [
          if (args?.key ?? false) 'category.key as category_key',
          if (args?.id ?? false) 'category.id as category_id',
          if (args?.name ?? false) 'category.name as category_name',
          ProductQuery.$createSelect(args?.product)
        ].join(',')
      : $createSelect($default);
  static Future<List<Category>> getAll(
    Database database, {
    $CategorySelectArgs? select,
  }) async =>
      (await database.rawQuery(select != null
              ? $createSelect(select)
              : CategoryQuery._selectAll) as List<Map>)
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
    int? id, {
    $CategorySelectArgs? select,
  }) async {
    final res = (await database
            .rawQuery('''SELECT ${$createSelect(select)} FROM Category category
 INNER JOIN Product product ON product.id = category.product_id''', [id])
        as List<Map>);
    return res.isNotEmpty ? Category.fromDB(res.first) : null;
  }

  Future<void> delete(Database database) async {
    await database
        .rawQuery('''DELETE FROM Category category WHERE key = ?''', [key]);
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

class $CategorySelectArgs {
  const $CategorySelectArgs({
    this.key,
    this.id,
    this.name,
    this.product,
  });

  final bool? key;

  final bool? id;

  final bool? name;

  final $ProductSelectArgs? product;

  bool get $check =>
      key == true || id == true || name == true || product?.$check == true;
}

class $CategoryWhereArgs {
  const $CategoryWhereArgs({
    this.key,
    this.id,
    this.name,
    this.product,
  });

  final int? key;

  final String? id;

  final String? name;

  final $ProductWhereArgs? product;
}
