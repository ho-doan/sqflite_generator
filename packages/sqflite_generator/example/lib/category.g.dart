// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file:

extension CategoryQuery on Category {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Category(
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			name TEXT NOT NULL,
			valueTime INTEGER NOT NULL,
			valueInt INTEGER NOT NULL,
			valueDouble REAL NOT NULL,
			valueBool INTEGER NOT NULL,
			valueDynamic NONE NOT NULL,
			valueIntNull INTEGER,
			valueDoubleNull REAL,
			valueBoolNull INTEGER
	)''';

  static const String _selectAll = '''SELECT * FROM Category''';

  Future<List<Category>> getAll(Database database) async =>
      (await database.rawQuery(CategoryQuery._selectAll) as List<Map>)
          .map(Category.fromJson)
          .toList();
  static Category $fromJson(Map json) => Category(
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
      );
}
