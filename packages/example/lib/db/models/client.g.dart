// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension ClientQuery on Client {
  static const _$$ProductSetArgs product$$ = _$$ProductSetArgs();

  static const String createTable = '''CREATE TABLE IF NOT EXISTS Client(
			id INTEGER,
			product_id INTEGER,
			first_name TEXT,
			last_name TEXT,
			blocked BIT NOT NULL,
			PRIMARY KEY (id,product_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''([Client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Client], fieldNames: [id], step: 1), parentClassName: []),
([Client, product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, id], step: 2), parentClassName: [product]),
([Client, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Client], fieldNames: [firstName], step: 1), parentClassName: []),
([Client, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Client], fieldNames: [lastName], step: 1), parentClassName: []),
([Client, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Client], fieldNames: [blocked], step: 1), parentClassName: [])''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static const $ClientSetArgs<int> id = $ClientSetArgs(
    name: 'id',
    nameCast: 'client_id',
    model: 'client',
  );

  static const $ClientSetArgs<int> productId = $ClientSetArgs(
    name: 'product_id',
    nameCast: 'client_product_id',
    model: 'client',
  );

  static const $ClientSetArgs<String> firstName = $ClientSetArgs(
    name: 'first_name',
    nameCast: 'client_first_name',
    model: 'client',
  );

  static const $ClientSetArgs<String> lastName = $ClientSetArgs(
    name: 'last_name',
    nameCast: 'client_last_name',
    model: 'client',
  );

  static const $ClientSetArgs<bool> blocked = $ClientSetArgs(
    name: 'blocked',
    nameCast: 'client_blocked',
    model: 'client',
  );

  static Set<$ClientSetArgs> $default = {
    ClientQuery.id,
    ClientQuery.productId,
    ClientQuery.firstName,
    ClientQuery.lastName,
    ClientQuery.blocked,
    ClientQuery.product$$.id,
    ClientQuery.product$$.lastName,
    ClientQuery.product$$.firstName,
    ClientQuery.product$$.blocked,
  };

// TODO(hodoan): check
  static String $createSelect(
    Set<$ClientSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<Client>> getAll(
    Database database, {
    Set<$ClientSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ClientSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Client client
 LEFT JOIN Product product ON product.id = client.product
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Client $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) =>
            [m[ClientQuery.id.nameCast], m[ClientQuery.productId.nameCast]]))
        .values
        .map((e) => Client.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Client>> top(
    Database database, {
    Set<$ClientSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$ClientSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Client
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    await product.insert(database);
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Client (id,
product,
product,
first_name,
last_name,
blocked) 
       VALUES(?, ?, ?, ?, ?)''', [
      id,
      product?.id,
      this.firstName,
      this.lastName,
      this.blocked,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product.update(database);
    return await database.update('Client', toDB(),
        where: "id = ? AND product_id = ?",
        whereArgs: [this.id, this.product?.id]);
  }

// TODO(hodoan): check
  static Future<Client?> getById(
    Database database,
    int? id,
    int? productId, {
    Set<$ClientSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Client client
 LEFT JOIN Product product ON product.id = client.product
WHERE client.id = ? AND client.product_id = ?
''', [id, productId]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? Client.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Client client WHERE client.id = ? AND client.product_id = ?''',
        [this.id, this.product?.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
    int? productId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Client client WHERE client.id = ? AND client.product_id = ?''',
        [id, productId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Client''');
  }

  static Client $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      Client(
          id: json['client_id'] as int?,
          firstName: json['${childName}client_first_name'] as String?,
          lastName: json['${childName}client_last_name'] as String?,
          blocked: (json['${childName}client_blocked'] as int?) == 1,
          product: Product.fromDB(json, lst, 'product_'));
  Map<String, dynamic> $toDB() => {
        'id': this.id,
        'product_id': this.product?.id,
        'first_name': this.firstName,
        'last_name': this.lastName,
        'blocked': (this.blocked ?? false) ? 1 : 0
      };
}

class $ClientSetArgs<T> extends WhereModel<T> {
  const $ClientSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$ClientSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}

class _$$$ProductSetArgs<T> extends $ClientSetArgs<T> {
  const _$$$ProductSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$ProductSetArgs {
  const _$$ProductSetArgs();

// ([product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, id], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<int> get id => const _$$$ProductSetArgs(
        name: 'id',
        nameCast: 'product_id',
        model: 'product',
      );

// ([Product, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, lastName], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<String> get lastName => const _$$$ProductSetArgs(
        name: 'last_name',
        nameCast: 'product_last_name',
        model: 'product',
      );

// ([Product, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, firstName], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<String> get firstName => const _$$$ProductSetArgs(
        name: 'first_name',
        nameCast: 'product_first_name',
        model: 'product',
      );

// ([Product, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, blocked], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<bool> get blocked => const _$$$ProductSetArgs(
        name: 'blocked',
        nameCast: 'product_blocked',
        model: 'product',
      );
}
