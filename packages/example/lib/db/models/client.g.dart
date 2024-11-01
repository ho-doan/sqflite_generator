// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension ClientQuery on Client {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Client(
			id INTEGER,
			product_id INTEGER,
			client_first_name TEXT,
			client_last_name TEXT,
			client_blocked BIT NOT NULL,
			PRIMARY KEY(id, product_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''nameCast: id, name: id, model: client, self: null modelParent: null,
nameCast: first_name, name: first_name, model: client, self: null modelParent: null,
nameCast: last_name, name: last_name, model: client, self: null modelParent: null,
nameCast: blocked, name: blocked, model: client, self: null modelParent: null,
nameCast: id, name: id, model: product, self: null modelParent: null,
nameCast: product_last_name, name: last_name, model: product, self: product modelParent: Client,
nameCast: product_first_name, name: first_name, model: product, self: product modelParent: Client,
nameCast: product_blocked, name: blocked, model: product, self: product modelParent: Client''';

  static const Map<int, List<String>> alter = {};

// nameCast: id, name: id, model: client, self: null modelParent: null
// name: id, children: [null] self: nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, selfIs: false modelParent: null property: nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false
  static const $ClientSetArgs<int> id = $ClientSetArgs(
    name: 'id',
    nameCast: 'id',
    model: 'client',
  );

// nameCast: first_name, name: first_name, model: client, self: null modelParent: null
// name: client_first_name, children: [null] self: null, selfIs: true modelParent: null property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $ClientSetArgs<String> firstName = $ClientSetArgs(
    name: 'first_name',
    nameCast: 'first_name',
    model: 'client',
  );

// nameCast: last_name, name: last_name, model: client, self: null modelParent: null
// name: client_last_name, children: [null] self: null, selfIs: true modelParent: null property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $ClientSetArgs<String> lastName = $ClientSetArgs(
    name: 'last_name',
    nameCast: 'last_name',
    model: 'client',
  );

// nameCast: blocked, name: blocked, model: client, self: null modelParent: null
// name: client_blocked, children: [null] self: null, selfIs: true modelParent: null property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false
  static const $ClientSetArgs<bool> blocked = $ClientSetArgs(
    name: 'blocked',
    nameCast: 'blocked',
    model: 'client',
  );

// nameCast: id, name: id, model: product, self: null modelParent: null
// name: id, children: [null] self: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, selfIs: false modelParent: null property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false
  static const $ClientSetArgs<int> id = $ClientSetArgs(
    name: 'id',
    nameCast: 'id',
    model: 'product',
  );

// nameCast: product_last_name, name: last_name, model: product, self: product modelParent: Client
// name: product_last_name, children: [null] self: null, selfIs: false modelParent: Client property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $ClientSetArgs<String> productLastName = $ClientSetArgs(
    name: 'last_name',
    self: 'product',
    nameCast: 'product_last_name',
    model: 'product',
  );

// nameCast: product_first_name, name: first_name, model: product, self: product modelParent: Client
// name: product_first_name, children: [null] self: null, selfIs: false modelParent: Client property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false
  static const $ClientSetArgs<String> productFirstName = $ClientSetArgs(
    name: 'first_name',
    self: 'product',
    nameCast: 'product_first_name',
    model: 'product',
  );

// nameCast: product_blocked, name: blocked, model: product, self: product modelParent: Client
// name: product_blocked, children: [null] self: null, selfIs: false modelParent: Client property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false
  static const $ClientSetArgs<bool> productBlocked = $ClientSetArgs(
    name: 'blocked',
    self: 'product',
    nameCast: 'product_blocked',
    model: 'product',
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
    return await database.update('Client', toDB(),
        where: "id = ? AND product = ?", whereArgs: [this.id, product.id]);
  }

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
WHERE client.id = ? AND client.product = ?
''', [id, productId]) as List<Map>);
    return res.isNotEmpty ? Client.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Client client WHERE client.id = ? AND client.product = ?''',
        [this.id, product.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
    int? productId,
  ) async {
    await database.rawQuery(
        '''DELETE FROM Client client WHERE client.id = ? AND client.product = ?''',
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
