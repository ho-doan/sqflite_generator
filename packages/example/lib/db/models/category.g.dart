// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension CategoryQuery on Category {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Category(
			key INTEGER PRIMARY KEY AUTOINCREMENT,
			id INTEGER,
			id TEXT NOT NULL,
			name TEXT NOT NULL,
			FOREIGN KEY (id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''(key, nameDefault: key, name: null, nameToDB: key, nameFromDB: category_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(id, nameDefault: id, name: null, nameToDB: id, nameFromDB: category_id, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false),
(name, nameDefault: name, name: null, nameToDB: name, nameFromDB: category_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false)''';

  static const Map<int, List<String>> alter = {};

// APkEx(nameCast: category_key, name: key, name2: null, model: Category, children: [], property: nameDefault: key, name: null, nameToDB: key, nameFromDB: category_key, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [], fk: null)
  static const $CategorySetArgs<int> key = $CategorySetArgs(
    name: 'key',
    nameCast: 'category_key',
    model: 'category',
  );

// APkEx(nameCast: product_id, name: id, name2: product_id, model: Product, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [], fk: nameDefault: product, name: Product, nameToDB: product, nameFromDB: category_product, dartType: Product, _isQues: false, _sqlType: INTEGER, _isNull: NOT NULLrawFromDB: true)
  static const $CategorySetArgs<int> productId = $CategorySetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product',
  );

// APkEx(nameCast: product_last_name, name: product_last_name, name2: null, model: Product, children: [], property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [], fk: null)
  static const $CategorySetArgs<String> productLastName = $CategorySetArgs(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product',
  );

// APkEx(nameCast: product_first_name, name: product_first_name, name2: null, model: Product, children: [], property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [], fk: null)
  static const $CategorySetArgs<String> productFirstName = $CategorySetArgs(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product',
  );

// APkEx(nameCast: product_blocked, name: product_blocked, name2: null, model: Product, children: [], property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [], fk: null)
  static const $CategorySetArgs<bool> productBlocked = $CategorySetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product',
  );

// APkEx(nameCast: category_id, name: id, name2: null, model: Category, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: category_id, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: id, parentClassName: [], fk: null)
  static const $CategorySetArgs<String> id = $CategorySetArgs(
    name: 'id',
    nameCast: 'category_id',
    model: 'category',
  );

// APkEx(nameCast: category_name, name: name, name2: null, model: Category, children: [], property: nameDefault: name, name: null, nameToDB: name, nameFromDB: category_name, dartType: String, _isQues: false, _sqlType: TEXT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: name, parentClassName: [], fk: null)
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
 LEFT JOIN Product product ON product.id = category.product
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
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
product,
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
 LEFT JOIN Product product ON product.id = category.product
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
        id: json['${childName}product_id'] as int?,
        id: json['${childName}category_id'] as String,
        name: json['${childName}category_name'] as String,
      );
  Map<String, dynamic> $toDB() => {
        'key': this.key,
        'product': product.id,
        'id': this.id,
        'name': this.name,
      };
}

class $CategorySetArgs<T> extends WhereModel<T> {
  const $CategorySetArgs({
    this.self = '',
    required this.name,
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final String name;

  final String model;

  final String nameCast;
}
