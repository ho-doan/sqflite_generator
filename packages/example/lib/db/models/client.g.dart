// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension ClientQuery on Client {
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
      '''version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Client], fieldNames: [id], step: 1), parentClassName: [],
version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, id], step: 2), parentClassName: [product],
version: 1, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Client], fieldNames: [firstName], step: 1), parentClassName: [],
version: 1, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Client], fieldNames: [lastName], step: 1), parentClassName: [],
version: 1, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Client], fieldNames: [blocked], step: 1), parentClassName: []''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, ClientSet>> $default = {
    ClientSetArgs.id,
    ClientSetArgs.productId,
    ClientSetArgs.firstName,
    ClientSetArgs.lastName,
    ClientSetArgs.blocked,
  };

// TODO(hodoan): check
  static String $createSelect(Set<WhereModel<dynamic, ClientSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<Client>> getAll(
    Database database, {
    Set<WhereModel<dynamic, ClientSet>>? select,
    Set<WhereResult<dynamic, ClientSet>>? where,
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
${ClientSetArgs('', '').leftJoin('client')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Client $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [
              m[ClientSetArgs.id.nameCast],
              m[ClientSetArgs.productId.nameCast]
            ]))
        .values
        .map((e) => Client.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Client>> top(
    Database database, {
    Set<WhereModel<dynamic, ClientSet>>? select,
    Set<WhereResult<dynamic, ClientSet>>? where,
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
product_id,
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
    Set<WhereModel<dynamic, ClientSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Client client
${ClientSetArgs('', '').leftJoin('client')}
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
    int childStep = 0,
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

class $ClientSetArgs<T, M> extends WhereModel<T, M> {
  const $ClientSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class ClientSetArgs<T> {
  const ClientSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $ClientSetArgs<int, ClientSet> id =
      $ClientSetArgs<int, ClientSet>(
    name: 'id',
    nameCast: 'client_id',
    model: 'client',
  );

// APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, id], step: 2)
  static const ProductSetArgs<ClientSet> $product =
      ProductSetArgs<ClientSet>('product_', 'product_');

  static const $ClientSetArgs<int, ClientSet> productId =
      $ClientSetArgs<int, ClientSet>(
    name: 'product_id',
    nameCast: 'client_product_id',
    model: 'client',
  );

  static const $ClientSetArgs<String, ClientSet> firstName =
      $ClientSetArgs<String, ClientSet>(
    name: 'first_name',
    nameCast: 'client_first_name',
    model: 'client',
  );

  static const $ClientSetArgs<String, ClientSet> lastName =
      $ClientSetArgs<String, ClientSet>(
    name: 'last_name',
    nameCast: 'client_last_name',
    model: 'client',
  );

  static const $ClientSetArgs<bool, ClientSet> blocked =
      $ClientSetArgs<bool, ClientSet>(
    name: 'blocked',
    nameCast: 'client_blocked',
    model: 'client',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Client ${self}client ON ${self}client.id = $parentModel.${self2}id AND ${self}client.product_id = $parentModel.${self2}product_id''',
        $$product.leftJoin(parentModel, step + 0)
      ].join('\n');

  $ClientSetArgs<int, T> get $id => $ClientSetArgs<int, T>(
        name: 'id',
        nameCast: 'client_id',
        model: 'client',
        self: this.self,
      );

// APropertyArgs(parentClassName: [Client, Product], fieldNames: [product, id], step: 2)
  ProductSetArgs<T> get $$product =>
      ProductSetArgs<T>('${self}product_', 'product_');

  $ClientSetArgs<int, T> get $productId => $ClientSetArgs<int, T>(
        name: 'product_id',
        nameCast: 'client_product_id',
        model: 'client',
        self: this.self,
      );

  $ClientSetArgs<String, T> get $firstName => $ClientSetArgs<String, T>(
        name: 'first_name',
        nameCast: 'client_first_name',
        model: 'client',
        self: this.self,
      );

  $ClientSetArgs<String, T> get $lastName => $ClientSetArgs<String, T>(
        name: 'last_name',
        nameCast: 'client_last_name',
        model: 'client',
        self: this.self,
      );

  $ClientSetArgs<bool, T> get $blocked => $ClientSetArgs<bool, T>(
        name: 'blocked',
        nameCast: 'client_blocked',
        model: 'client',
        self: this.self,
      );
}

class ClientSet {
  const ClientSet();
}
