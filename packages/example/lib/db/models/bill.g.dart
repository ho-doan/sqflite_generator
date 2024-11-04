// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension BillQuery on Bill {
  static const _$$ProductSetArgs product$$ = _$$ProductSetArgs();

  static const _$$ClientSetArgs client$$ = _$$ClientSetArgs();

  static const _$$ProductSetArgs clientProduct$$ = _$$ProductSetArgs();

  static const _$$BillSetArgs parent$$ = _$$BillSetArgs();

  static const _$$ClientSetArgs parentClient$$ = _$$ClientSetArgs();

  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
			product_id INTEGER,
			client_id INTEGER,
			client_product_id INTEGER,
			parent_product_id INTEGER,
			parent_client_id INTEGER,
			parent_client_product_id INTEGER,
			parent_client_id INTEGER,
			parent_client_product_id INTEGER,
			time INTEGER,
			PRIMARY KEY (product_id,client_id,client_product_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id,client_product_id) REFERENCES Client (id,product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_product_id,parent_client_id,parent_client_product_id) REFERENCES Bill (product_id,client_id,client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_client_id,parent_client_product_id) REFERENCES Client (id,product_id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''([Bill, product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, id], step: 2), parentClassName: [product]),
([Bill, client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, id], step: 2), parentClassName: [client]),
([Bill, client, Product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client, Product], fieldNames: [client, product, id], step: 3), parentClassName: [client, Client]),
([Bill, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill], fieldNames: [time], step: 1), parentClassName: [])''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static const $BillSetArgs<int> productId = $BillSetArgs(
    name: 'product_id',
    nameCast: 'bill_product_id',
    model: 'bill',
  );

  static const $BillSetArgs<int> clientId = $BillSetArgs(
    name: 'client_id',
    nameCast: 'bill_client_id',
    model: 'bill',
  );

  static const $BillSetArgs<int> clientProductId = $BillSetArgs(
    name: 'client_product_id',
    nameCast: 'bill_client_product_id',
    model: 'bill',
  );

  static const $BillSetArgs<String> time = $BillSetArgs(
    name: 'time',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static Set<$BillSetArgs> $default = {
    BillQuery.productId,
    BillQuery.clientId,
    BillQuery.clientProductId,
    BillQuery.time,
    BillQuery.product$$.id,
    BillQuery.product$$.lastName,
    BillQuery.product$$.firstName,
    BillQuery.product$$.blocked,
    BillQuery.client$$.id,
    BillQuery.client$$.firstName,
    BillQuery.client$$.lastName,
    BillQuery.client$$.blocked,
    BillQuery.clientProduct$$.id,
    BillQuery.clientProduct$$.lastName,
    BillQuery.clientProduct$$.firstName,
    BillQuery.clientProduct$$.blocked,
    BillQuery.parent$$.productId,
    BillQuery.parent$$.clientId,
    BillQuery.parent$$.clientProductId,
    BillQuery.parent$$.time,
    BillQuery.parentClient$$.id,
    BillQuery.parentClient$$.firstName,
    BillQuery.parentClient$$.lastName,
    BillQuery.parentClient$$.blocked,
  };

// TODO(hodoan): check
  static String $createSelect(
    Set<$BillSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<Bill>> getAll(
    Database database, {
    Set<$BillSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Bill bill
 LEFT JOIN Product product ON product.id = bill.product
 LEFT JOIN Client client_client ON client_client.id = bill.client AND client_client.product = bill.client
 LEFT JOIN Bill parent_bill ON parent_bill.product = bill.bill AND parent_bill.client = bill.bill
 LEFT JOIN Client parent_client_client ON parent_client_client.id = bill.client AND parent_client_client.product = bill.client
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Bill $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [
              m[BillQuery.productId.nameCast],
              m[BillQuery.clientId.nameCast],
              m[BillQuery.clientProductId.nameCast]
            ]))
        .values
        .map((e) => Bill.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Bill>> top(
    Database database, {
    Set<$BillSetArgs>? select,
    Set<WhereResult>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$BillSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Bill
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    await product?.insert(database);
    await client?.insert(database);
    await parent?.insert(database);
    await parentClient?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Bill (product,
client,
product,
client,
bill,
client,
time) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      product?.id,
      client?.id,
      client?.product?.id,
      this.time?.millisecondsSinceEpoch,
      parent?.product?.id,
      parent?.client?.id,
      parent?.client?.product?.id,
      parentClient?.id,
      parentClient?.product?.id,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product?.update(database);
    await client?.update(database);
    await parent?.update(database);
    await parentClient?.update(database);
    return await database.update('Bill', toDB(),
        where: "product_id = ? AND client_id = ? AND client_product_id = ?",
        whereArgs: [
          this.product?.id,
          this.client?.id,
          this.client?.product?.id
        ]);
  }

// TODO(hodoan): check
  static Future<Bill?> getById(
    Database database,
    int? productId,
    int? clientId,
    int? clientProductId, {
    Set<$BillSetArgs>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Bill bill
 LEFT JOIN Product product ON product.id = bill.product
 LEFT JOIN Client client_client ON client_client.id = bill.client AND client_client.product = bill.client
 LEFT JOIN Bill parent_bill ON parent_bill.product = bill.bill AND parent_bill.client = bill.bill
 LEFT JOIN Client parent_client_client ON parent_client_client.id = bill.client AND parent_client_client.product = bill.client
WHERE bill.product_id = ? AND bill.client_id = ? AND bill.client_product_id = ?
''', [productId, clientId, clientProductId]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? Bill.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Bill bill WHERE bill.product_id = ? AND bill.client_id = ? AND bill.client_product_id = ?''',
        [this.product?.id, this.client?.id, this.client?.product?.id]);
  }

  static Future<void> deleteById(
    Database database,
    int? productId,
    int? clientId,
    int? clientProductId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Bill bill WHERE bill.product_id = ? AND bill.client_id = ? AND bill.client_product_id = ?''',
        [productId, clientId, clientProductId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Bill''');
  }

  static Bill $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
  ]) =>
      Bill(
          time: DateTime.fromMillisecondsSinceEpoch(
            json['${childName}bill_time'] as int? ?? -1,
          ),
          product: Product.fromDB(json, lst, 'product_'),
          client: Client.fromDB(json, lst, 'client_'),
          parent: Bill.fromDB(json, lst, 'parent_'),
          parentClient: Client.fromDB(json, lst, 'parent_client_'));
  Map<String, dynamic> $toDB() => {
        'product_id': this.product?.id,
        'client_id': this.client?.id,
        'client_product_id': this.client?.product?.id,
        'time': this.time?.millisecondsSinceEpoch,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Bill, Product], fieldNames: [parent, product, id], step: 3), parentClassName: [parent, Bill]
        'parent_parent_bill_product_id': this.parent?.product?.id,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Bill, Client], fieldNames: [parent, client, id], step: 3), parentClassName: [parent, Bill]
        'parent_parent_bill_client_id': this.parent?.client?.id,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Bill, Client, Product], fieldNames: [parent, client, product, id], step: 4), parentClassName: [parent, Bill, Client]
        'parent_parent_bill_client_product_id':
            this.parent?.client?.product?.id,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [parentClient, id], step: 2), parentClassName: [parentClient]
        'parent_client_client_id': this.parentClient?.id,

// nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client, Product], fieldNames: [parentClient, product, id], step: 3), parentClassName: [parentClient, Client]
        'parent_client_parent_client_client_product_id':
            this.parentClient?.product?.id
      };
}

class $BillSetArgs<T> extends WhereModel<T> {
  const $BillSetArgs({
    this.self = '',
    required this.name,
    this.children = const [],
    required this.nameCast,
    required this.model,
  }) : super(field: '$model.$name');

  final String self;

  final List<$BillSetArgs<T>> children;

  final String name;

  final String model;

  final String nameCast;
}

class _$$$ProductSetArgs<T> extends $BillSetArgs<T> {
  const _$$$ProductSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$$ClientSetArgs<T> extends $BillSetArgs<T> {
  const _$$$ClientSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$$BillSetArgs<T> extends $BillSetArgs<T> {
  const _$$$BillSetArgs({
    super.self = '',
    required super.name,
    super.children = const [],
    required super.nameCast,
    required super.model,
  });
}

class _$$ProductSetArgs {
  const _$$ProductSetArgs();

// ([product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, id], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<int> get id => const _$$$ProductSetArgs(
        name: 'id',
        nameCast: 'product_id',
        model: 'product',
      );

// ([Product, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, lastName], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<String> get lastName => const _$$$ProductSetArgs(
        name: 'last_name',
        nameCast: 'product_last_name',
        model: 'product',
      );

// ([Product, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, firstName], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<String> get firstName => const _$$$ProductSetArgs(
        name: 'first_name',
        nameCast: 'product_first_name',
        model: 'product',
      );

// ([Product, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, blocked], step: 2), parentClassName: [product])
  _$$$ProductSetArgs<bool> get blocked => const _$$$ProductSetArgs(
        name: 'blocked',
        nameCast: 'product_blocked',
        model: 'product',
      );
}

class _$$ClientSetArgs {
  const _$$ClientSetArgs();

// ([client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, id], step: 2), parentClassName: [client])
  _$$$ClientSetArgs<int> get id => const _$$$ClientSetArgs(
        name: 'id',
        nameCast: 'client_id',
        model: 'client',
      );

// ([Client, firstName], nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, firstName], step: 2), parentClassName: [client])
  _$$$ClientSetArgs<String> get firstName => const _$$$ClientSetArgs(
        name: 'first_name',
        nameCast: 'client_first_name',
        model: 'client',
      );

// ([Client, lastName], nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, lastName], step: 2), parentClassName: [client])
  _$$$ClientSetArgs<String> get lastName => const _$$$ClientSetArgs(
        name: 'last_name',
        nameCast: 'client_last_name',
        model: 'client',
      );

// ([Client, blocked], nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLargs: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, blocked], step: 2), parentClassName: [client])
  _$$$ClientSetArgs<bool> get blocked => const _$$$ClientSetArgs(
        name: 'blocked',
        nameCast: 'client_blocked',
        model: 'client',
      );
}

class _$$BillSetArgs {
  const _$$BillSetArgs();

// ([Bill, product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, id], step: 2), parentClassName: [product])
  _$$$BillSetArgs<int> get productId => const _$$$BillSetArgs(
        name: 'id',
        nameCast: 'bill_product_id',
        model: 'bill_product',
      );

// ([Bill, client, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, id], step: 2), parentClassName: [client])
  _$$$BillSetArgs<int> get clientId => const _$$$BillSetArgs(
        name: 'id',
        nameCast: 'bill_client_id',
        model: 'bill_client',
      );

// ([Bill, client, Product, id], nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill, Client, Product], fieldNames: [client, product, id], step: 3), parentClassName: [client, Client])
  _$$$BillSetArgs<int> get clientProductId => const _$$$BillSetArgs(
        name: 'id',
        nameCast: 'bill_client_product_id',
        model: 'bill_client_product',
      );

// ([Bill, time], nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: args: APropertyArgs(parentClassName: [Bill], fieldNames: [time], step: 1), parentClassName: [])
  _$$$BillSetArgs<String> get time => const _$$$BillSetArgs(
        name: 'time',
        nameCast: 'bill_time',
        model: 'bill',
      );
}
