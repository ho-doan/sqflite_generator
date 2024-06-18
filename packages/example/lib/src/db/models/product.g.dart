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

  static final String _selectAll =
      '''SELECT ${$createSelect($default)} FROM Product product''';

  static const $ProductSelectArgs $default = $ProductSelectArgs(
      id: true, lastName: true, firstName: true, blocked: true);

  static String $createSelect($ProductSelectArgs? args) => args?.$check == true
      ? [
          if (args?.id ?? false) 'product.id as product_id',
          if (args?.lastName ?? false) 'product.last_name as product_last_name',
          if (args?.firstName ?? false)
            'product.first_name as product_first_name',
          if (args?.blocked ?? false) 'product.blocked as product_blocked'
        ].join(',')
      : $createSelect($default);
  static Future<List<Product>> getAll(
    Database database, {
    $ProductSelectArgs? select,
  }) async =>
      (await database.rawQuery(select != null
              ? $createSelect(select)
              : ProductQuery._selectAll) as List<Map>)
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
    int? id, {
    $ProductSelectArgs? select,
  }) async {
    final res = (await database.rawQuery(
            '''SELECT ${$createSelect(select)} FROM Product product''', [id])
        as List<Map>);
    return res.isNotEmpty ? Product.fromDB(res.first) : null;
  }

  Future<void> delete(Database database) async {
    await database
        .rawQuery('''DELETE FROM Product product WHERE id = ?''', [id]);
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

class $ProductSelectArgs {
  const $ProductSelectArgs({
    this.id,
    this.lastName,
    this.firstName,
    this.blocked,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? blocked;

  bool get $check =>
      id == true || lastName == true || firstName == true || blocked == true;
}

class $ProductWhereArgs {
  const $ProductWhereArgs({
    this.id,
    this.lastName,
    this.firstName,
    this.blocked,
  });

  final int? id;

  final String? lastName;

  final String? firstName;

  final bool? blocked;
}
