// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension ProductQuery on Product {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Product(
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			last_name TEXT,
			first_name TEXT,
			blocked BIT NOT NULL
	)''';

  static const String debug =
      '''([Product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Product], fieldNames: [id], step: 1), parentClassName: []),
([Product, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Product], fieldNames: [lastName], step: 1), parentClassName: []),
([Product, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Product], fieldNames: [firstName], step: 1), parentClassName: []),
([Product, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Product], fieldNames: [blocked], step: 1), parentClassName: [])''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static const $ProductSetArgs<int> id = $ProductSetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product',
  );

  static const $ProductSetArgs<String> lastName = $ProductSetArgs(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product',
  );

  static const $ProductSetArgs<String> firstName = $ProductSetArgs(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product',
  );

  static const $ProductSetArgs<bool> blocked = $ProductSetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product',
  );

  static Set<$ProductSetArgs> $default = {
    ProductQuery.id,
    ProductQuery.lastName,
    ProductQuery.firstName,
    ProductQuery.blocked,
  };

// TODO(hodoan): check
  static String $createSelect(
    Set<$ProductSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<Product>> getAll(
    Database database, {
    Set<$ProductSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ProductSetArgs>>? orderBy,
    int? limit,
    int? offset,
  }) async {
    String whereStr = '';
    if (where != null &&
        where.isNotEmpty &&
        whereOr != null &&
        whereOr.isNotEmpty) {
      final s = [...whereOr, where];
      whereStr = s.whereSql;
    } else if (whereOr != null && whereOr.isNotEmpty) {
      whereStr = whereOr.whereSql;
    } else if (where != null && where.isNotEmpty) {
      whereStr = where.whereSql;
    }

    final sql = '''SELECT ${$createSelect(select)} FROM Product product
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Product $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[ProductQuery.id.nameCast]]))
        .values
        .map((e) => Product.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Product>> top(
    Database database, {
    Set<$ProductSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ProductSetArgs>>? orderBy,
    required int top,
  }) =>
      getAll(
        database,
        select: select,
        where: where,
        whereOr: whereOr,
        orderBy: orderBy,
        limit: top,
      );
  static Future<int> count(Database database) async {
    final mapList =
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Product
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Product (id,
last_name,
first_name,
blocked) 
       VALUES(?, ?, ?, ?)''', [
      id,
      this.lastName,
      this.firstName,
      this.blocked,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Product', toDB(), where: "id = ?", whereArgs: [id]);
  }

// TODO(hodoan): check
  static Future<Product?> getById(
    Database database,
    int? id, {
    Set<$ProductSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Product product
WHERE product.id = ?
''', [id]) as List<Map>);
    return res.isNotEmpty ? Product.fromDB(res.first, res) : null;
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
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      Product(
          id: json['product_id'] as int?,
          lastName: json['${childName}product_last_name'] as String?,
          firstName: json['${childName}product_first_name'] as String?,
          blocked: (json['${childName}product_blocked'] as int?) == 1);
  Map<String, dynamic> $toDB() => {
        'id': this.id,
        'last_name': this.lastName,
        'first_name': this.firstName,
        'blocked': (this.blocked ?? false) ? 1 : 0
      };
}

class $ProductSetArgs<T> extends WhereModel<T> {
  const $ProductSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$ProductSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}
