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

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, ProductSet>> $default = {
    ProductSetArgs.id,
    ProductSetArgs.lastName,
    ProductSetArgs.firstName,
    ProductSetArgs.blocked,
  };

  static String $createSelect(Set<WhereModel<dynamic, ProductSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
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
${const ProductSetArgs('', '').leftJoin('product')}
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
      lastName,
      firstName,
      blocked,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database
        .update('Product', toDB(), where: "id = ?", whereArgs: [id]);
  }

  static Future<Product?> getById(
    Database database,
    int? id, {
    Set<WhereModel<dynamic, ProductSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Product product
${const ProductSetArgs('', '').leftJoin('product')}
WHERE product.id = ?
''', [id]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[ProductSetArgs.id.nameCast]]).values.first;
    return Product.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Product product WHERE product.id = ?''', [id]);
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
          id: json['${childName}product_id'] as int?,
          lastName: json['${childName}product_last_name'] as String?,
          firstName: json['${childName}product_first_name'] as String?,
          blocked: (json['${childName}product_blocked'] as int?) == 1);
  Map<String, dynamic> $toDB() => {
        'id': id,
        'last_name': lastName,
        'first_name': firstName,
        'blocked': (blocked ?? false) ? 1 : 0
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
