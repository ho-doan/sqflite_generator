// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension CategoryQuery on Category {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Category(
		key INTEGER PRIMARY KEY AUTOINCREMENT,
			id TEXT NOT NULL,
			name TEXT NOT NULL,
			product_id INTEGER NOT NULL,
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const Map<int, List<String>> alter = {};

  static const $CategorySetArgs<int> key = $CategorySetArgs(
    name: 'key',
    nameCast: 'category_key',
    model: 'category',
  );

  static const $CategorySetArgs<int> productId = $CategorySetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product_product',
  );

  static const $CategorySetArgs<String> productLastName = $CategorySetArgs(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product_product',
  );

  static const $CategorySetArgs<String> productFirstName = $CategorySetArgs(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product_product',
  );

  static const $CategorySetArgs<bool> productBlocked = $CategorySetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product_product',
  );

  static const $CategorySetArgs<String> id = $CategorySetArgs(
    name: 'id',
    nameCast: 'category_id',
    model: 'category',
  );

  static const $CategorySetArgs<String> name = $CategorySetArgs(
    name: 'name',
    nameCast: 'category_name',
    model: 'category',
  );

  static Set<$CategorySetArgs> $default = {
    CategoryQuery.key,
    CategoryQuery.productId,
    CategoryQuery.productLastName,
    CategoryQuery.productFirstName,
    CategoryQuery.productBlocked,
    CategoryQuery.id,
    CategoryQuery.name,
  };

  static String $createSelect(
    Set<$CategorySetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
  static Future<List<Category>> getAll(
    Database database, {
    Set<$CategorySetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CategorySetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Category category
 LEFT JOIN Product product ON product.id = category.product_id
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : null}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Category $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => m[CategoryQuery.key.nameCast]))
        .values
        .map((e) => Category.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Category>> top(
    Database database, {
    Set<$CategorySetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CategorySetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Category
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

  Future<int> insert(Database database) async {
    final $productIdProduct = await product.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Category (key,
product_id,
id,
name) 
       VALUES(?, ?, ?, ?)''', [
      this.key,
      $productIdProduct,
      this.id,
      this.name,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product.update(database);
    return await database
        .update('Category', toDB(), where: "key = ?", whereArgs: [this.key]);
  }

  static Future<Category?> getById(
    Database database,
    int? key, {
    Set<$CategorySetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Category category
 LEFT JOIN Product product ON product.id = category.product_id
WHERE category.key = ?
''', [key]) as List<Map>);
    return res.isNotEmpty ? Category.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Category category WHERE category.key = ?''', [this.key]);
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
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      Category(
        key: json['${childName}category_key'] as int?,
        product: Product.fromDB(json, []),
        id: json['${childName}category_id'] as String,
        name: json['${childName}category_name'] as String,
      );
  Map<String, dynamic> $toDB() => {
        'key': this.key,
        'product_id': product.id,
        'id': this.id,
        'name': this.name,
      };
}

class $CategorySetArgs<T> extends WhereModel<T> {
  const $CategorySetArgs({
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String name;

  final String model;

  final String nameCast;
}
