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

  static const String _selectAll = '''SELECT * FROM User''';

  Future<List<User>> getAll(Database database) async =>
      (await database.rawQuery(UserQuery._selectAll) as List<Map>)
          .map(User.fromJson)
          .toList();
  static User $fromJson(Map json) => User(
        category: Category.fromJson(json['categoryId']),
        product: Product.fromJson(json['productId']),
      );
}
