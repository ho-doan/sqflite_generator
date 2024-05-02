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
			valueBool BIT NOT NULL,
			valueDynamic NONE NOT NULL,
			valueIntNull INTEGER,
			valueDoubleNull REAL,
			valueBoolNull BIT
	)''';

  static const String _selectAll = '''SELECT category.id as category_id,
category.name as category_name,
category.value_time as category_value_time,
category.value_int as category_value_int,
category.value_double as category_value_double,
category.value_bool as category_value_bool,
category.value_dynamic as category_value_dynamic,
category.value_int_null as category_value_int_null,
category.value_double_null as category_value_double_null,
category.value_bool_null as category_value_bool_null FROM Category category''';

  Future<List<Category>> getAll(Database database) async =>
      (await database.rawQuery(CategoryQuery._selectAll) as List<Map>)
          .map(Category.fromJson)
          .toList();
  Future<void> insert(
    Database database,
    Category model,
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
    ]);
  }

  Future<void> update(
    Database database,
    Category model,
  ) async {
    await database.update('Category', model.toJson());
  }

  Future<Category?> getById(
    Database database,
    int id,
  ) async {
    final res = (await database.rawQuery('''SELECT category.id as category_id,
category.name as category_name,
category.value_time as category_value_time,
category.value_int as category_value_int,
category.value_double as category_value_double,
category.value_bool as category_value_bool,
category.value_dynamic as category_value_dynamic,
category.value_int_null as category_value_int_null,
category.value_double_null as category_value_double_null,
category.value_bool_null as category_value_bool_null,
WHERE category.id = ? FROM Category category''', [id]) as List<Map>);
    return res.isNotEmpty ? Category.fromJson(res.first) : null;
  }

  Future<void> delete(
    Database database,
    Category model,
  ) async {
    await database
        .rawQuery('''DELETE FROM Category category WHERE id = ?''', [model.id]);
  }

  Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Category''');
  }

// TODO(hodoan): convert value
  static Category $fromJson(Map json) => Category(
        id: json['category_id'] as int,
        name: json['category_name'] as String,
        valueTime: json['category_value_time'] as DateTime,
        valueInt: json['category_value_int'] as int,
        valueDouble: json['category_value_double'] as double,
        valueBool: json['category_value_bool'] as bool,
        valueDynamic: json['category_value_dynamic'] as dynamic,
        valueIntNull: json['category_value_int_null'] as int?,
        valueDoubleNull: json['category_value_double_null'] as double?,
        valueBoolNull: json['category_value_bool_null'] as bool?,
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
      };
}
