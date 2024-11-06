// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension BillQuery on Bill {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
			product_id INTEGER,
			client_id INTEGER,
			client_product_id INTEGER,
			parent_product_id INTEGER,
			parent_client_id INTEGER,
			parent_client_product_id INTEGER,
			client_parent_id INTEGER,
			client_parent_product_id INTEGER,
			time INTEGER,
			PRIMARY KEY (product_id,client_id,client_product_id),
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id,client_product_id) REFERENCES Client (id,product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_product_id,parent_client_id,parent_client_product_id) REFERENCES Bill (product_id,client_id,client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_parent_id,client_parent_product_id) REFERENCES Client (id,product_id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: , args: APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, id], step: 2),
version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: , args: APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, id], step: 2),
version: 1, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: , args: APropertyArgs(parentClassName: [Bill, Client, Product], fieldNames: [client, product, id], step: 3),
version: 1, nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: , args: APropertyArgs(parentClassName: [Bill], fieldNames: [time], step: 1)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, BillSet>> $default = {
    BillSetArgs.productId,
    BillSetArgs.clientId,
    BillSetArgs.clientProductId,
    BillSetArgs.time,
  };

  static String $createSelect(Set<WhereModel<dynamic, BillSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
// TODO(hodoan): check
  static Future<List<Bill>> getAll(
    Database database, {
    Set<WhereModel<dynamic, BillSet>>? select,
    Set<WhereResult<dynamic, BillSet>>? where,
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
${const BillSetArgs('', '').leftJoin('bill')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Bill $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [
              m[BillSetArgs.productId.nameCast],
              m[BillSetArgs.clientId.nameCast],
              m[BillSetArgs.clientProductId.nameCast]
            ]))
        .values
        .map((e) => Bill.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Bill>> top(
    Database database, {
    Set<WhereModel<dynamic, BillSet>>? select,
    Set<WhereResult<dynamic, BillSet>>? where,
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
    await clientParent?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Bill (product_id,
client_id,
client_product_id,
time,
parent_product_id,
parent_client_id,
parent_client_product_id,
client_parent_id,
client_parent_product_id) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      product?.id,
      client?.id,
      client?.product?.id,
      time?.millisecondsSinceEpoch,
      parent?.product?.id,
      parent?.client?.id,
      parent?.client?.product?.id,
      clientParent?.id,
      clientParent?.product?.id,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product?.update(database);
    await client?.update(database);
    await parent?.update(database);
    await clientParent?.update(database);
    return await database.update('Bill', toDB(),
        where: "product_id = ? AND client_id = ? AND client_product_id = ?",
        whereArgs: [product?.id, client?.id, client?.product?.id]);
  }

  static Future<Bill?> getById(
    Database database,
    int? productId,
    int? clientId,
    int? clientProductId, {
    Set<WhereModel<dynamic, BillSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Bill bill
${BillSetArgs('', '').leftJoin('bill')}
WHERE bill.product_id = ? AND bill.client_id = ? AND bill.client_product_id = ?
''', [productId, clientId, clientProductId]) as List<Map>);
// TODO(hodoan): check
    return res.isNotEmpty ? Bill.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Bill bill WHERE bill.product_id = ? AND bill.client_id = ? AND bill.client_product_id = ?''',
        [product?.id, client?.id, client?.product?.id]);
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
    int childStep = 0,
  ]) =>
      Bill(
          time: DateTime.fromMillisecondsSinceEpoch(
            json['${childName}bill_time'] as int? ?? -1,
          ),
          product: Product.fromDB(json, lst, 'product_'),
          client: Client.fromDB(json, lst, 'client_'),
          parent: childStep > 0 ? null : Bill.fromDB(json, lst, 'parent_', 1),
          clientParent: Client.fromDB(json, lst, 'client_parent_'));
  Map<String, dynamic> $toDB() => {
        'product_id': product?.id,
        'client_id': client?.id,
        'client_product_id': client?.product?.id,
        'time': time?.millisecondsSinceEpoch,
        'parent_product_id': parent?.product?.id,
        'parent_client_id': parent?.client?.id,
        'parent_client_product_id': parent?.client?.product?.id,
        'client_parent_id': clientParent?.id,
        'client_parent_product_id': clientParent?.product?.id
      };
}

class $BillSetArgs<T, M> extends WhereModel<T, M> {
  const $BillSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class BillSetArgs<T> {
  const BillSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

// APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, id], step: 2)
  static const ProductSetArgs<BillSet> $product =
      ProductSetArgs<BillSet>('product_', 'product_');

  static const $BillSetArgs<int, BillSet> productId =
      $BillSetArgs<int, BillSet>(
    name: 'product_id',
    nameCast: 'bill_product_id',
    model: 'bill',
  );

// APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, id], step: 2)
  static const ClientSetArgs<BillSet> $client =
      ClientSetArgs<BillSet>('client_', 'client_');

  static const $BillSetArgs<int, BillSet> clientId = $BillSetArgs<int, BillSet>(
    name: 'client_id',
    nameCast: 'bill_client_id',
    model: 'bill',
  );

  static const $BillSetArgs<int, BillSet> clientProductId =
      $BillSetArgs<int, BillSet>(
    name: 'client_product_id',
    nameCast: 'bill_client_product_id',
    model: 'bill',
  );

  static const $BillSetArgs<String, BillSet> time =
      $BillSetArgs<String, BillSet>(
    name: 'time',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static const BillSetArgs<BillSet> $parent =
      BillSetArgs<BillSet>('parent_', 'parent_');

  static const ClientSetArgs<ClientSet> $clientParent =
      ClientSetArgs<ClientSet>('client_parent_', 'client_parent_');

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Bill ${self}bill ON ${self}bill.product_id = $parentModel.${self2}product_id AND ${self}bill.client_id = $parentModel.${self2}client_id AND ${self}bill.client_product_id = $parentModel.${self2}client_product_id''',
        $$product.leftJoin(parentModel, step + 0),
        $$client.leftJoin(parentModel, step + 0),
        if (step < 1) $$parent.leftJoin(parentModel, step + 1),
        $$clientParent.leftJoin(parentModel, step + 0)
      ].join('\n');

// APropertyArgs(parentClassName: [Bill, Product], fieldNames: [product, id], step: 2)
  ProductSetArgs<T> get $$product =>
      ProductSetArgs<T>('${self}product_', 'product_');

  $BillSetArgs<int, T> get $productId => $BillSetArgs<int, T>(
        name: 'product_id',
        nameCast: 'bill_product_id',
        model: 'bill',
        self: this.self,
      );

// APropertyArgs(parentClassName: [Bill, Client], fieldNames: [client, id], step: 2)
  ClientSetArgs<T> get $$client =>
      ClientSetArgs<T>('${self}client_', 'client_');

  $BillSetArgs<int, T> get $clientId => $BillSetArgs<int, T>(
        name: 'client_id',
        nameCast: 'bill_client_id',
        model: 'bill',
        self: this.self,
      );

  $BillSetArgs<int, T> get $clientProductId => $BillSetArgs<int, T>(
        name: 'client_product_id',
        nameCast: 'bill_client_product_id',
        model: 'bill',
        self: this.self,
      );

  $BillSetArgs<String, T> get $time => $BillSetArgs<String, T>(
        name: 'time',
        nameCast: 'bill_time',
        model: 'bill',
        self: this.self,
      );

  BillSetArgs<T> get $$parent => BillSetArgs<T>('${self}parent_', 'parent_');

  ClientSetArgs<T> get $$clientParent =>
      ClientSetArgs<T>('${self}client_parent_', 'client_parent_');
}

class BillSet {
  const BillSet();
}
