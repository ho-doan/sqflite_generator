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

  static const $CategorySelectArgs $default = $CategorySelectArgs(
      key: true, product: ProductQuery.$default, id: true, name: true);

  static String $createSelect(
    $CategorySelectArgs? select, [
    String childName = '',
  ]) =>
      select?.$check == true
          ? [
              if (select?.key ?? false)
                '${childName}category.key as ${childName}category_key',
              ProductQuery.$createSelect(select?.product, ''),
              if (select?.id ?? false)
                '${childName}category.id as ${childName}category_id',
              if (select?.name ?? false)
                '${childName}category.name as ${childName}category_name'
            ].join(',')
          : $createSelect($default);
  static String $createWhere(
    $CategoryWhereArgs? where, [
    String childName = '',
  ]) =>
      [
        if (where?.key != null) '${childName}category.key = ${where?.key}',
        ProductQuery.$createWhere(where?.product, ''),
        if (where?.id != null) '${childName}category.id = \'${where?.id}\'',
        if (where?.name != null)
          '${childName}category.name = \'${where?.name}\''
      ].join(' AND ').whereStr;
  static Future<List<Category>> getAll(
    Database database, {
    $CategorySelectArgs? select,
    $CategoryWhereArgs? where,
  }) async =>
      (await database.rawQuery(
              '''SELECT ${$createSelect(select)} FROM Category category
 INNER JOIN Product product ON product.id = category.product_id
''') as List<Map>)
          .map(Category.fromDB)
          .toList();
  Future<int> insert(Database database) async {
    final $productIdProduct = await product.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Category (key,
product_id,
id,
name) 
       VALUES(?, ?, ?, ?)''', [
      key,
      $productIdProduct,
      id,
      name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product.update(database);
    return await database.update('Category', toDB(),
        where: "category.key = ?", whereArgs: [key]);
  }

  static Future<Category?> getById(
    Database database,
    int? key, {
    $CategorySelectArgs? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Category category
WHERE category.key = ?
 INNER JOIN Product product ON product.id = category.product_id
''', [key]) as List<Map>);
    return res.isNotEmpty ? Category.fromDB(res.first) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Category category WHERE category.key = ?''', [key]);
  }

  static Future<void> deleteById(
    Database database,
    int? key,
  ) async {
    await database.rawQuery(
        '''DELETE FROM Category category WHERE category.key = ?''', [key]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Category''');
  }

  static Category $fromDB(
    Map json, [
    String childName = '',
  ]) =>
      Category(
        key: json['${childName}category_key'] as int?,
        product: Product.fromDB(json, ''),
        id: json['${childName}category_id'] as String,
        name: json['${childName}category_name'] as String,
      );
  Map<String, dynamic> $toDB() => {
        'key': key,
        'product_id': product.id,
        'id': id,
        'name': name,
      };
}

class $CategorySelectArgs {
  const $CategorySelectArgs({
    this.key,
    this.product,
    this.id,
    this.name,
  });

  final bool? key;

  final $ProductSelectArgs? product;

  final bool? id;

  final bool? name;

  bool get $check =>
      key == true || product?.$check == true || id == true || name == true;
}

class $CategoryWhereArgs {
  const $CategoryWhereArgs({
    this.key,
    this.product,
    this.id,
    this.name,
  });

  final int? key;

  final $ProductWhereArgs? product;

  final String? id;

  final String? name;
}
