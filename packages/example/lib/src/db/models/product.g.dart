// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

extension ProductQuery on Product {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Product(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
			last_name TEXT,
			first_name TEXT,
			blocked BIT NOT NULL
	)''';

  static const $ProductSelectArgs $default = $ProductSelectArgs(
      id: true, lastName: true, firstName: true, blocked: true);

  static String $createSelect(
    $ProductSelectArgs? select, [
    String childName = '',
  ]) =>
      select?.$check == true
          ? [
              if (select?.id ?? false)
                '${childName}product.id as ${childName}product_id',
              if (select?.lastName ?? false)
                '${childName}product.last_name as ${childName}product_last_name',
              if (select?.firstName ?? false)
                '${childName}product.first_name as ${childName}product_first_name',
              if (select?.blocked ?? false)
                '${childName}product.blocked as ${childName}product_blocked'
            ].join(',')
          : $createSelect($default);
  static String $createWhere(
    $ProductWhereArgs? where, [
    String childName = '',
  ]) =>
      [
        if (where?.id != null) '${childName}product.id = ${where?.id}',
        if (where?.lastName != null)
          '${childName}product.last_name = \'${where?.lastName}\'',
        if (where?.firstName != null)
          '${childName}product.first_name = \'${where?.firstName}\'',
        if (where?.blocked != null)
          '${childName}product.blocked = ${where?.blocked}'
      ].join(' AND ').whereStr;
  static Future<List<Product>> getAll(
    Database database, {
    $ProductSelectArgs? select,
    $ProductWhereArgs? where,
  }) async =>
      (await database
              .rawQuery('''SELECT ${$createSelect(select)} FROM Product product
''') as List<Map>)
          .map(Product.fromDB)
          .toList();
  Future<int> insert(Database database) async {
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Product (id,
last_name,
first_name,
blocked) 
       VALUES(?, ?, ?, ?)''', [
      id,
      lastName,
      firstName,
      blocked,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Product', toDB(), where: "product.id = ?", whereArgs: [id]);
  }

  static Future<Product?> getById(
    Database database,
    int? id, {
    $ProductSelectArgs? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Product product
WHERE product.id = ?
''', [id]) as List<Map>);
    return res.isNotEmpty ? Product.fromDB(res.first) : null;
  }

  Future<void> delete(Database database) async {
    await database
        .rawQuery('''DELETE FROM Product product WHERE product.id = ?''', [id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database
        .rawQuery('''DELETE FROM Product product WHERE product.id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Product''');
  }

  static Product $fromDB(
    Map json, [
    String childName = '',
  ]) =>
      Product(
        id: json['${childName}product_id'] as int?,
        lastName: json['${childName}product_last_name'] as String?,
        firstName: json['${childName}product_first_name'] as String?,
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
