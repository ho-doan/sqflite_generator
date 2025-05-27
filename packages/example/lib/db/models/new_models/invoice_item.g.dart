// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $InvoiceItemQuerySample on InvoiceItem {
  static const String selectAll = '''
	SELECT
			invoice_line_id,
			invoice_id,
			track_id,
			unit_price,
			quantity
	FROM InvoiceItem;''';
}

class InvoiceItemFilter {
  const InvoiceItemFilter(this.value);

  final String value;

  InvoiceItemFilter get sortByInvoiceLineId =>
      const InvoiceItemFilter('invoice_line_id');

  InvoiceItemFilter get sortByInvoiceId =>
      const InvoiceItemFilter('invoice_id');

  InvoiceItemFilter get sortByTrackId => const InvoiceItemFilter('track_id');

  InvoiceItemFilter get sortByUnitPrice =>
      const InvoiceItemFilter('unit_price');

  InvoiceItemFilter get sortByQuantity => const InvoiceItemFilter('quantity');

  InvoiceItemFilter get sortByInvoiceLineIdDesc =>
      const InvoiceItemFilter('invoice_line_id DESC');

  InvoiceItemFilter get sortByInvoiceIdDesc =>
      const InvoiceItemFilter('invoice_id DESC');

  InvoiceItemFilter get sortByTrackIdDesc =>
      const InvoiceItemFilter('track_id DESC');

  InvoiceItemFilter get sortByUnitPriceDesc =>
      const InvoiceItemFilter('unit_price DESC');

  InvoiceItemFilter get sortByQuantityDesc =>
      const InvoiceItemFilter('quantity DESC');
}

class InvoiceItemWhere {
  const InvoiceItemWhere(this.value);

  final String value;

  InvoiceItemWhere or() => InvoiceItemWhere(" or ");

  InvoiceItemWhere invoiceLineIdEqual(dynamic value) =>
      InvoiceItemWhere("invoice_line_id = $value");

  InvoiceItemWhere invoiceLineIdNotEqual(dynamic value) =>
      InvoiceItemWhere("invoice_line_id != $value");

  InvoiceItemWhere invoiceIdEqual(dynamic value) =>
      InvoiceItemWhere("invoice_id = $value");

  InvoiceItemWhere invoiceIdNotEqual(dynamic value) =>
      InvoiceItemWhere("invoice_id != $value");

  InvoiceItemWhere trackIdEqual(dynamic value) =>
      InvoiceItemWhere("track_id = $value");

  InvoiceItemWhere trackIdNotEqual(dynamic value) =>
      InvoiceItemWhere("track_id != $value");

  InvoiceItemWhere unitPriceEqual(dynamic value) =>
      InvoiceItemWhere("unit_price = '$value'");

  InvoiceItemWhere unitPriceNotEqual(dynamic value) =>
      InvoiceItemWhere("unit_price != '$value'");

  InvoiceItemWhere quantityEqual(dynamic value) =>
      InvoiceItemWhere("quantity = $value");

  InvoiceItemWhere quantityNotEqual(dynamic value) =>
      InvoiceItemWhere("quantity != $value");
}

extension InvoiceItemQuery on InvoiceItem {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS InvoiceItem(
			invoice_line_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			invoice_id INTEGER NOT NULL,
			track_id INTEGER NOT NULL,
			unit_price REAL NOT NULL,
			quantity INTEGER NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, InvoiceItemSet>> $default = {
    InvoiceItemSetArgs.invoiceLineId,
    InvoiceItemSetArgs.invoiceId,
    InvoiceItemSetArgs.trackId,
    InvoiceItemSetArgs.unitPrice,
    InvoiceItemSetArgs.quantity,
  };

  static String $createSelect(
          Set<WhereModel<dynamic, InvoiceItemSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<InvoiceItem>> getAll(
    Database database, {
    Set<WhereModel<dynamic, InvoiceItemSet>>? select,
    Set<WhereResult<dynamic, InvoiceItemSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$InvoiceItemSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM InvoiceItem invoice_item
${const InvoiceItemSetArgs('', '').leftJoin('invoice_item')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all InvoiceItem $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[InvoiceItemSetArgs.invoiceLineId.nameCast]]))
        .values
        .map((e) => InvoiceItem.fromDB(e.first, e))
        .toList();
  }

  static Future<List<InvoiceItem>> top(
    Database database, {
    Set<WhereModel<dynamic, InvoiceItemSet>>? select,
    Set<WhereResult<dynamic, InvoiceItemSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$InvoiceItemSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM InvoiceItem
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO InvoiceItem (invoice_line_id,
invoice_id,
track_id,
unit_price,
quantity) 
       VALUES(?, ?, ?, ?, ?)''', [
      invoiceLineId,
      invoiceId,
      trackId,
      unitPrice,
      quantity,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('InvoiceItem', toDB(),
        where: "invoice_line_id = ?", whereArgs: [invoiceLineId]);
  }

  static Future<InvoiceItem?> getById(
    Database database,
    int invoiceLineId, {
    Set<WhereModel<dynamic, InvoiceItemSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM InvoiceItem invoice_item
${const InvoiceItemSetArgs('', '').leftJoin('invoice_item')}
WHERE invoice_item.invoiceLineId = ?
''', [invoiceLineId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList = res
        .groupBy((e) => [e[InvoiceItemSetArgs.invoiceLineId.nameCast]])
        .values
        .first;
    return InvoiceItem.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM InvoiceItem invoice_item WHERE invoice_item.invoiceLineId = ?''',
        [invoiceLineId]);
  }

  static Future<void> deleteById(
    Database database,
    int invoiceLineId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM InvoiceItem invoice_item WHERE invoice_item.invoiceLineId = ?''',
        [invoiceLineId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM InvoiceItem''');
  }

  static InvoiceItem $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      InvoiceItem(
          invoiceLineId:
              json['${childName}invoice_item_invoice_line_id'] as int,
          invoiceId: json['${childName}invoice_item_invoice_id'] as int,
          trackId: json['${childName}invoice_item_track_id'] as int,
          unitPrice: json['${childName}invoice_item_unit_price'] as double,
          quantity: json['${childName}invoice_item_quantity'] as int);
  Map<String, dynamic> $toDB() => {
        'invoice_line_id': invoiceLineId,
        'invoice_id': invoiceId,
        'track_id': trackId,
        'unit_price': unitPrice,
        'quantity': quantity
      };
}

class $InvoiceItemSetArgs<T, M> extends WhereModel<T, M> {
  const $InvoiceItemSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class InvoiceItemSetArgs<T> {
  const InvoiceItemSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $InvoiceItemSetArgs<int, InvoiceItemSet> invoiceLineId =
      $InvoiceItemSetArgs<int, InvoiceItemSet>(
    name: 'invoice_line_id',
    nameCast: 'invoice_item_invoice_line_id',
    model: 'invoice_item',
  );

  static const $InvoiceItemSetArgs<int, InvoiceItemSet> invoiceId =
      $InvoiceItemSetArgs<int, InvoiceItemSet>(
    name: 'invoice_id',
    nameCast: 'invoice_item_invoice_id',
    model: 'invoice_item',
  );

  static const $InvoiceItemSetArgs<int, InvoiceItemSet> trackId =
      $InvoiceItemSetArgs<int, InvoiceItemSet>(
    name: 'track_id',
    nameCast: 'invoice_item_track_id',
    model: 'invoice_item',
  );

  static const $InvoiceItemSetArgs<String, InvoiceItemSet> unitPrice =
      $InvoiceItemSetArgs<String, InvoiceItemSet>(
    name: 'unit_price',
    nameCast: 'invoice_item_unit_price',
    model: 'invoice_item',
  );

  static const $InvoiceItemSetArgs<int, InvoiceItemSet> quantity =
      $InvoiceItemSetArgs<int, InvoiceItemSet>(
    name: 'quantity',
    nameCast: 'invoice_item_quantity',
    model: 'invoice_item',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN InvoiceItem ${self}invoice_item ON ${self}invoice_item.invoiceLineId = $parentModel.${self2}invoiceLineId''',
      ].join('\n');

  $InvoiceItemSetArgs<int, T> get $invoiceLineId => $InvoiceItemSetArgs<int, T>(
        name: 'invoice_line_id',
        nameCast: 'invoice_item_invoice_line_id',
        model: 'invoice_item',
        self: this.self,
      );

  $InvoiceItemSetArgs<int, T> get $invoiceId => $InvoiceItemSetArgs<int, T>(
        name: 'invoice_id',
        nameCast: 'invoice_item_invoice_id',
        model: 'invoice_item',
        self: this.self,
      );

  $InvoiceItemSetArgs<int, T> get $trackId => $InvoiceItemSetArgs<int, T>(
        name: 'track_id',
        nameCast: 'invoice_item_track_id',
        model: 'invoice_item',
        self: this.self,
      );

  $InvoiceItemSetArgs<String, T> get $unitPrice =>
      $InvoiceItemSetArgs<String, T>(
        name: 'unit_price',
        nameCast: 'invoice_item_unit_price',
        model: 'invoice_item',
        self: this.self,
      );

  $InvoiceItemSetArgs<int, T> get $quantity => $InvoiceItemSetArgs<int, T>(
        name: 'quantity',
        nameCast: 'invoice_item_quantity',
        model: 'invoice_item',
        self: this.self,
      );
}

class InvoiceItemSet {
  const InvoiceItemSet();
}
