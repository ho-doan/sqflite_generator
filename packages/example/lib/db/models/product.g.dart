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
      '''version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Product], fieldNames: [id], step: 1), parentClassName: [],
version: -1, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Product], fieldNames: [lastName], step: 1), parentClassName: [],
version: 1, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Product], fieldNames: [firstName], step: 1), parentClassName: [],
version: 1, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Product], fieldNames: [blocked], step: 1), parentClassName: []''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, ProductSet>> $default = {
    ProductSetArgs.id,
    ProductSetArgs.lastName,
    ProductSetArgs.firstName,
    ProductSetArgs.blocked,
  };

// TODO(hodoan): check
  static String $createSelect(Set<WhereModel<dynamic, ProductSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<Product>> getAll(
    Database database, {
    Set<WhereModel<dynamic, ProductSet>>? select,
    Set<WhereResult<dynamic, ProductSet>>? where,
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
${ProductSetArgs('', '').leftJoin('product')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Product $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[ProductSetArgs.id.nameCast]]))
        .values
        .map((e) => Product.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Product>> top(
    Database database, {
    Set<WhereModel<dynamic, ProductSet>>? select,
    Set<WhereResult<dynamic, ProductSet>>? where,
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
        .update('Product', toDB(), where: "id = ?", whereArgs: [this.id]);
  }

// TODO(hodoan): check
  static Future<Product?> getById(
    Database database,
    int? id, {
    Set<WhereModel<dynamic, ProductSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Product product
${ProductSetArgs('', '').leftJoin('product')}
WHERE product.id = ?
''', [id]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? Product.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Product product WHERE product.id = ?''', [this.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Product product WHERE product.id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Product''');
  }

  static Product $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
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

class $ProductSetArgs<T, M> extends WhereModel<T, M> {
  const $ProductSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class ProductSetArgs<T> {
  const ProductSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $ProductSetArgs<int, ProductSet> id =
      $ProductSetArgs<int, ProductSet>(
    name: 'id',
    nameCast: 'product_id',
    model: 'product',
  );

  static const $ProductSetArgs<String, ProductSet> lastName =
      $ProductSetArgs<String, ProductSet>(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product',
  );

  static const $ProductSetArgs<String, ProductSet> firstName =
      $ProductSetArgs<String, ProductSet>(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product',
  );

  static const $ProductSetArgs<bool, ProductSet> blocked =
      $ProductSetArgs<bool, ProductSet>(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Product ${self}product ON ${self}product.id = $parentModel.${self2}id''',
      ].join('\n');

  $ProductSetArgs<int, T> get $id => $ProductSetArgs<int, T>(
        name: 'id',
        nameCast: 'product_id',
        model: 'product',
        self: this.self,
      );

  $ProductSetArgs<String, T> get $lastName => $ProductSetArgs<String, T>(
        name: 'last_name',
        nameCast: 'product_last_name',
        model: 'product',
        self: this.self,
      );

  $ProductSetArgs<String, T> get $firstName => $ProductSetArgs<String, T>(
        name: 'first_name',
        nameCast: 'product_first_name',
        model: 'product',
        self: this.self,
      );

  $ProductSetArgs<bool, T> get $blocked => $ProductSetArgs<bool, T>(
        name: 'blocked',
        nameCast: 'product_blocked',
        model: 'product',
        self: this.self,
      );
}

class ProductSet {
  const ProductSet();
}
