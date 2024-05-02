// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file:

extension UserQuery on User {
  static String createTable = '''CREATE TABLE IF NOT EXISTS User(
		categoryId INTEGER NOT NULL,
			productId INTEGER NOT NULL,
			PRIMARY KEY(categoryId,productId),
			FOREIGN KEY (categoryId) REFERENCES Category (id) ON NO ACTION NO ACTION,
			FOREIGN KEY (productId) REFERENCES Product (id) ON NO ACTION NO ACTION
	)''';

  static const String _selectAll =
      '''SELECT user.category_id as user_category_id,
user.product_id as user_product_id,
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
product.id as product_id,
product.name as product_name,
product.value_time as product_value_time,
product.value_int as product_value_int,
product.value_double as product_value_double,
product.value_bool as product_value_bool,
product.value_dynamic as product_value_dynamic,
product.value_int_null as product_value_int_null,
product.value_double_null as product_value_double_null,
product.value_bool_null as product_value_bool_null,
product.category_id as product_category_id FROM User user
 INNER JOIN Category category ON category.id = user.categoryId
 INNER JOIN Product product ON product.id = user.productId''';

  Future<List<User>> getAll(Database database) async =>
      (await database.rawQuery(UserQuery._selectAll) as List<Map>)
          .map(User.fromJson)
          .toList();
  Future<void> insert(
    Database database,
    User model,
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
      model.product.id,
      model.product.name,
      model.product.valueTime,
      model.product.valueInt,
      model.product.valueDouble,
      model.product.valueBool,
      model.product.valueDynamic,
      model.product.valueIntNull,
      model.product.valueDoubleNull,
      model.product.valueBoolNull,
      model.product.category.id,
    ]);
    await database.rawInsert('''INSERT INTO User (category_id,
product_id) 
       VALUES(?, ?)''', [
      model.category.id,
      model.product.id,
    ]);
  }

  Future<void> update(
    Database database,
    User model,
  ) async {
    await database.update('Category', model.category.toJson());
    await database.update('Product', model.product.toJson());
    await database.update('User', model.toJson());
  }

  Future<User?> getById(
    Database database,
    int id,
  ) async {
    final res =
        (await database.rawQuery('''SELECT user.category_id as user_category_id,
user.product_id as user_product_id,
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
product.id as product_id,
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
WHERE user.category_id = ? FROM User user
 INNER JOIN Category category ON category.id = user.categoryId
 INNER JOIN Product product ON product.id = user.productId''', [id])
            as List<Map>);
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }

  Future<void> delete(
    Database database,
    User model,
  ) async {
    await database.rawQuery(
        '''DELETE FROM User user WHERE category_id = ? AND product_id = ?''',
        [model.category, model.product]);
  }

  Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM User''');
  }

// TODO(hodoan): convert value
  static User $fromJson(Map json) => User(
        category: Category.fromJson(json),
        product: Product.fromJson(json),
      );
// TODO(hodoan): convert value
  Map<String, dynamic> $toJson() => {
        'category_id': category.id,
        'product_id': product.id,
      };
}
