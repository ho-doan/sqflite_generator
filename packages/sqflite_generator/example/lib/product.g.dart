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
			valueBool INTEGER NOT NULL,
			valueDynamic NONE NOT NULL,
			valueIntNull INTEGER,
			valueDoubleNull REAL,
			valueBoolNull INTEGER,
			FOREIGN KEY (categoryId) REFERENCES Category (id) ON NO ACTION NO ACTION
	)''';

  static const String _selectAll = '''SELECT * FROM Product''';

  Future<List<Product>> getAll(Database database) async =>
      (await database.rawQuery(ProductQuery._selectAll) as List<Map>)
          .map(Product.fromJson)
          .toList();
  static Product $fromJson(Map json) => Product(
        id: json['id'] as int,
        name: json['name'] as String,
        valueTime: json['valueTime'] as DateTime,
        valueInt: json['valueInt'] as int,
        valueDouble: json['valueDouble'] as double,
        valueBool: json['valueBool'] as bool,
        valueDynamic: json['valueDynamic'] as dynamic,
        valueIntNull: json['valueIntNull'] as int?,
        valueDoubleNull: json['valueDoubleNull'] as double?,
        valueBoolNull: json['valueBoolNull'] as bool?,
        category: Category.fromJson(json['categoryId']),
      );
}
