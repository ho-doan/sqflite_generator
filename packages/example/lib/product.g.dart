// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file:

extension ProductQuery on Product {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Product(
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL,
			valueTime INTEGER NOT NULL,
			valueInt INTEGER NOT NULL,
			valueDouble REAL NOT NULL,
			valueBool BIT NOT NULL,
			valueDynamic NONE NOT NULL,
			valueIntNull INTEGER,
			valueDoubleNull REAL,
			valueBoolNull BIT,
			FOREIGN KEY (categoryId) REFERENCES Category (id) ON NO ACTION NO ACTION
	)''';

  static const String _selectAll = '''SELECT product.id as product_id,
product.name as product_name,
product.value_time as product_value_time,
product.value_int as product_value_int,
product.value_double as product_value_double,
product.value_bool as product_value_bool,
product.value_dynamic as product_value_dynamic,
product.value_int_null as product_value_int_null,
product.value_double_null as product_value_double_null,
product.value_bool_null as product_value_bool_null,
product.category_id as product_category_id,
category.id as category_id,
category.name as category_name,
category.value_time as category_value_time,
category.value_int as category_value_int,
category.value_double as category_value_double,
category.value_bool as category_value_bool,
category.value_dynamic as category_value_dynamic,
category.value_int_null as category_value_int_null,
category.value_double_null as category_value_double_null,
category.value_bool_null as category_value_bool_null FROM Product product
 INNER JOIN Category category ON category.id = product.categoryId''';

  Future<List<Product>> getAll(Database database) async =>
      (await database.rawQuery(ProductQuery._selectAll) as List<Map>)
          .map(Product.fromJson)
          .toList();
  Future<void> insert(
    Database database,
    Product model,
  ) async {
    await database.rawInsert('''INSERT INTO Category (id,
name,
value_time,
value_int,
value_double,
value_bool,
value_dynamic,
value_int_null,
value_double_null,
value_bool_null) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      model.category.id,
      model.category.name,
      model.category.valueTime,
      model.category.valueInt,
      model.category.valueDouble,
      model.category.valueBool,
      model.category.valueDynamic,
      model.category.valueIntNull,
      model.category.valueDoubleNull,
      model.category.valueBoolNull,
    ]);
    await database.rawInsert('''INSERT INTO Product (id,
name,
value_time,
value_int,
value_double,
value_bool,
value_dynamic,
value_int_null,
value_double_null,
value_bool_null,
category_id) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      model.id,
      model.name,
      model.valueTime,
      model.valueInt,
      model.valueDouble,
      model.valueBool,
      model.valueDynamic,
      model.valueIntNull,
      model.valueDoubleNull,
      model.valueBoolNull,
      model.category.id,
    ]);
  }

  Future<void> update(
    Database database,
    Product model,
  ) async {
    await database.update('Category', model.category.toJson());
    await database.update('Product', model.toJson());
  }

  Future<Product?> getById(
    Database database,
    int id,
  ) async {
    final res = (await database.rawQuery('''SELECT product.id as product_id,
product.name as product_name,
product.value_time as product_value_time,
product.value_int as product_value_int,
product.value_double as product_value_double,
product.value_bool as product_value_bool,
product.value_dynamic as product_value_dynamic,
product.value_int_null as product_value_int_null,
product.value_double_null as product_value_double_null,
product.value_bool_null as product_value_bool_null,
product.category_id as product_category_id,
category.id as category_id,
category.name as category_name,
category.value_time as category_value_time,
category.value_int as category_value_int,
category.value_double as category_value_double,
category.value_bool as category_value_bool,
category.value_dynamic as category_value_dynamic,
category.value_int_null as category_value_int_null,
category.value_double_null as category_value_double_null,
category.value_bool_null as category_value_bool_null,
WHERE product.id = ? FROM Product product
 INNER JOIN Category category ON category.id = product.categoryId''', [id])
        as List<Map>);
    return res.isNotEmpty ? Product.fromJson(res.first) : null;
  }

  Future<void> delete(
    Database database,
    Product model,
  ) async {
    await database
        .rawQuery('''DELETE FROM Product product WHERE id = ?''', [model.id]);
  }

  Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Product''');
  }

// TODO(hodoan): convert value
  static Product $fromJson(Map json) => Product(
        id: json['product_id'] as int,
        name: json['product_name'] as String,
        valueTime: json['product_value_time'] as DateTime,
        valueInt: json['product_value_int'] as int,
        valueDouble: json['product_value_double'] as double,
        valueBool: json['product_value_bool'] as bool,
        valueDynamic: json['product_value_dynamic'] as dynamic,
        valueIntNull: json['product_value_int_null'] as int?,
        valueDoubleNull: json['product_value_double_null'] as double?,
        valueBoolNull: json['product_value_bool_null'] as bool?,
        category: Category.fromJson(json),
      );
// TODO(hodoan): convert value
  Map<String, dynamic> $toJson() => {
        'id': id,
        'name': name,
        'value_time': valueTime,
        'value_int': valueInt,
        'value_double': valueDouble,
        'value_bool': valueBool,
        'value_dynamic': valueDynamic,
        'value_int_null': valueIntNull,
        'value_double_null': valueDoubleNull,
        'value_bool_null': valueBoolNull,
        'category_id': category.id,
      };
}
