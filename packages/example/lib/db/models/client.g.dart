// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension ClientQuery on Client {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Client(
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			client_first_name TEXT,
			client_last_name TEXT,
			client_blocked BIT NOT NULL,
			product_id INTEGER,
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''nameCast: first_name, name: first_name, model: Client, self: firstName modelParent: null,
nameCast: last_name, name: last_name, model: Client, self: lastName modelParent: null,
nameCast: blocked, name: blocked, model: Client, self: blocked modelParent: null,
nameCast: last_name, name: last_name, model: Product, self: lastName modelParent: Client,
nameCast: first_name, name: first_name, model: Product, self: firstName modelParent: Client,
nameCast: blocked, name: blocked, model: Product, self: blocked modelParent: Client''';

  static const Map<int, List<String>> alter = {};

// nameCast: first_name, name: first_name, model: Client, self: firstName modelParent: null
// name: client_first_name, children: [null] self: null, selfIs: true modelParent: null
  static const $ClientSetArgs<String> $firstName = $ClientSetArgs(
    name: 'first_name',
    self: 'Client',
    nameCast: 'first_name',
    model: 'firstName',
  );

// nameCast: last_name, name: last_name, model: Client, self: lastName modelParent: null
// name: client_last_name, children: [null] self: null, selfIs: true modelParent: null
  static const $ClientSetArgs<String> $lastName = $ClientSetArgs(
    name: 'last_name',
    self: 'Client',
    nameCast: 'last_name',
    model: 'lastName',
  );

// nameCast: blocked, name: blocked, model: Client, self: blocked modelParent: null
// name: client_blocked, children: [null] self: null, selfIs: true modelParent: null
  static const $ClientSetArgs<bool> $blocked = $ClientSetArgs(
    name: 'blocked',
    self: 'Client',
    nameCast: 'blocked',
    model: 'blocked',
  );

// nameCast: last_name, name: last_name, model: Product, self: lastName modelParent: Client
// name: product_last_name, children: [null] self: null, selfIs: false modelParent: Client
  static const $ClientSetArgs<String> $productProductLastName = $ClientSetArgs(
    name: 'last_name',
    self: 'Product',
    nameCast: 'Product_last_name',
    model: 'lastName',
  );

// nameCast: first_name, name: first_name, model: Product, self: firstName modelParent: Client
// name: product_first_name, children: [null] self: null, selfIs: false modelParent: Client
  static const $ClientSetArgs<String> $productProductFirstName = $ClientSetArgs(
    name: 'first_name',
    self: 'Product',
    nameCast: 'Product_first_name',
    model: 'firstName',
  );

// nameCast: blocked, name: blocked, model: Product, self: blocked modelParent: Client
// name: product_blocked, children: [null] self: null, selfIs: false modelParent: Client
  static const $ClientSetArgs<bool> $productProductBlocked = $ClientSetArgs(
    name: 'blocked',
    self: 'Product',
    nameCast: 'Product_blocked',
    model: 'blocked',
  );

  static const $ClientSetArgs<int> id = $ClientSetArgs(
    name: 'id',
    nameCast: 'client_id',
    model: 'client',
  );

  static const $ClientSetArgs<int> productId = $ClientSetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product',
  );

  static const $ClientSetArgs<String> productLastName = $ClientSetArgs(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product',
  );

  static const $ClientSetArgs<String> productFirstName = $ClientSetArgs(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product',
  );

  static const $ClientSetArgs<bool> productBlocked = $ClientSetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product',
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
    ClientQuery.productLastName,
    ClientQuery.productFirstName,
    ClientQuery.productBlocked,
    ClientQuery.firstName,
    ClientQuery.lastName,
    ClientQuery.blocked,
  };

  static String $createSelect(
    Set<$ClientSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
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
        .groupBy(((m) => m[ClientQuery.id.nameCast]))
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

  Future<int> insert(Database database) async {
    final $productIdProduct = await product.insert(database);
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Client (id,
product,
first_name,
last_name,
blocked) 
       VALUES(?, ?, ?, ?, ?)''', [
      this.id,
      $productIdProduct,
      this.firstName,
      this.lastName,
      this.blocked,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product.update(database);
    return await database
        .update('Client', toDB(), where: "id = ?", whereArgs: [this.id]);
  }

  static Future<Client?> getById(
    Database database,
    int? id, {
    Set<$ClientSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Client client
 LEFT JOIN Product product ON product.id = client.product
WHERE client.id = ?
''', [id]) as List<Map>);
    return res.isNotEmpty ? Client.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Client client WHERE client.id = ?''', [this.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database
        .rawQuery('''DELETE FROM Client client WHERE client.id = ?''', [id]);
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
        id: json['${childName}client_id'] as int?,
        product: Product.fromDB(json, []),
        firstName: json['${childName}client_first_name'] as String?,
        lastName: json['${childName}client_last_name'] as String?,
        blocked: (json['client_blocked'] as int?) == 1,
      );
  Map<String, dynamic> $toDB() => {
        'id': this.id,
        'product': product.id,
        'first_name': this.firstName,
        'last_name': this.lastName,
        'blocked': (this.blocked ?? false) ? 1 : 0,
      };
}

class $ClientSetArgs<T> extends WhereModel<T> {
  const $ClientSetArgs({
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
