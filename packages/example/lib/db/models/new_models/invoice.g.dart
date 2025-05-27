// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $InvoiceQuerySample on Invoice {
  static const String selectAll = '''
	SELECT
			invoice_id,
			customer_id,
			invoice_date,
			billing_address,
			billing_city,
			billing_state,
			billing_country,
			billing_postal_code,
			total
	FROM Invoice;''';
}

class InvoiceFilter {
  const InvoiceFilter(this.value);

  final String value;

  InvoiceFilter get sortByInvoiceId => const InvoiceFilter('invoice_id');

  InvoiceFilter get sortByCustomerId => const InvoiceFilter('customer_id');

  InvoiceFilter get sortByInvoiceDate => const InvoiceFilter('invoice_date');

  InvoiceFilter get sortByBillingAddress =>
      const InvoiceFilter('billing_address');

  InvoiceFilter get sortByBillingCity => const InvoiceFilter('billing_city');

  InvoiceFilter get sortByBillingState => const InvoiceFilter('billing_state');

  InvoiceFilter get sortByBillingCountry =>
      const InvoiceFilter('billing_country');

  InvoiceFilter get sortByBillingPostalCode =>
      const InvoiceFilter('billing_postal_code');

  InvoiceFilter get sortByTotal => const InvoiceFilter('total');

  InvoiceFilter get sortByInvoiceIdDesc =>
      const InvoiceFilter('invoice_id DESC');

  InvoiceFilter get sortByCustomerIdDesc =>
      const InvoiceFilter('customer_id DESC');

  InvoiceFilter get sortByInvoiceDateDesc =>
      const InvoiceFilter('invoice_date DESC');

  InvoiceFilter get sortByBillingAddressDesc =>
      const InvoiceFilter('billing_address DESC');

  InvoiceFilter get sortByBillingCityDesc =>
      const InvoiceFilter('billing_city DESC');

  InvoiceFilter get sortByBillingStateDesc =>
      const InvoiceFilter('billing_state DESC');

  InvoiceFilter get sortByBillingCountryDesc =>
      const InvoiceFilter('billing_country DESC');

  InvoiceFilter get sortByBillingPostalCodeDesc =>
      const InvoiceFilter('billing_postal_code DESC');

  InvoiceFilter get sortByTotalDesc => const InvoiceFilter('total DESC');

  InvoiceFilter get sortByBillingStateNullsFirst =>
      const InvoiceFilter('billing_state NULLS FIRST');

  InvoiceFilter get sortByBillingCountryNullsFirst =>
      const InvoiceFilter('billing_country NULLS FIRST');

  InvoiceFilter get sortByBillingPostalCodeNullsFirst =>
      const InvoiceFilter('billing_postal_code NULLS FIRST');

  InvoiceFilter get sortByBillingStateNullsLast =>
      const InvoiceFilter('billing_state NULLS LAST');

  InvoiceFilter get sortByBillingCountryNullsLast =>
      const InvoiceFilter('billing_country NULLS LAST');

  InvoiceFilter get sortByBillingPostalCodeNullsLast =>
      const InvoiceFilter('billing_postal_code NULLS LAST');
}

class InvoiceWhere {
  const InvoiceWhere(this.value);

  final String value;

  InvoiceWhere or() => InvoiceWhere(" or ");

  InvoiceWhere invoiceIdEqual(dynamic value) =>
      InvoiceWhere("invoice_id = $value");

  InvoiceWhere invoiceIdNotEqual(dynamic value) =>
      InvoiceWhere("invoice_id != $value");

  InvoiceWhere customerIdEqual(dynamic value) =>
      InvoiceWhere("customer_id = $value");

  InvoiceWhere customerIdNotEqual(dynamic value) =>
      InvoiceWhere("customer_id != $value");

  InvoiceWhere invoiceDateEqual(dynamic value) =>
      InvoiceWhere("invoice_date = '$value'");

  InvoiceWhere invoiceDateNotEqual(dynamic value) =>
      InvoiceWhere("invoice_date != '$value'");

  InvoiceWhere billingAddressEqual(dynamic value) =>
      InvoiceWhere("billing_address = '$value'");

  InvoiceWhere billingAddressNotEqual(dynamic value) =>
      InvoiceWhere("billing_address != '$value'");

  InvoiceWhere billingCityEqual(dynamic value) =>
      InvoiceWhere("billing_city = '$value'");

  InvoiceWhere billingCityNotEqual(dynamic value) =>
      InvoiceWhere("billing_city != '$value'");

  InvoiceWhere billingStateEqual(dynamic value) =>
      InvoiceWhere("billing_state = '$value'");

  InvoiceWhere billingStateNotEqual(dynamic value) =>
      InvoiceWhere("billing_state != '$value'");

  InvoiceWhere billingCountryEqual(dynamic value) =>
      InvoiceWhere("billing_country = '$value'");

  InvoiceWhere billingCountryNotEqual(dynamic value) =>
      InvoiceWhere("billing_country != '$value'");

  InvoiceWhere billingPostalCodeEqual(dynamic value) =>
      InvoiceWhere("billing_postal_code = '$value'");

  InvoiceWhere billingPostalCodeNotEqual(dynamic value) =>
      InvoiceWhere("billing_postal_code != '$value'");

  InvoiceWhere totalEqual(dynamic value) => InvoiceWhere("total = '$value'");

  InvoiceWhere totalNotEqual(dynamic value) =>
      InvoiceWhere("total != '$value'");
}

extension InvoiceQuery on Invoice {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Invoice(
			invoice_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			customer_id INTEGER NOT NULL,
			invoice_date TEXT NOT NULL,
			billing_address TEXT NOT NULL,
			billing_city TEXT NOT NULL,
			billing_state TEXT,
			billing_country TEXT,
			billing_postal_code TEXT,
			total REAL NOT NULL
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, InvoiceSet>> $default = {
    InvoiceSetArgs.invoiceId,
    InvoiceSetArgs.customerId,
    InvoiceSetArgs.invoiceDate,
    InvoiceSetArgs.billingAddress,
    InvoiceSetArgs.billingCity,
    InvoiceSetArgs.billingState,
    InvoiceSetArgs.billingCountry,
    InvoiceSetArgs.billingPostalCode,
    InvoiceSetArgs.total,
  };

  static String $createSelect(Set<WhereModel<dynamic, InvoiceSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Invoice>> getAll(
    Database database, {
    Set<WhereModel<dynamic, InvoiceSet>>? select,
    Set<WhereResult<dynamic, InvoiceSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$InvoiceSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Invoice invoice
${const InvoiceSetArgs('', '').leftJoin('invoice')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Invoice $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[InvoiceSetArgs.invoiceId.nameCast]]))
        .values
        .map((e) => Invoice.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Invoice>> top(
    Database database, {
    Set<WhereModel<dynamic, InvoiceSet>>? select,
    Set<WhereResult<dynamic, InvoiceSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$InvoiceSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Invoice
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Invoice (invoice_id,
customer_id,
invoice_date,
billing_address,
billing_city,
billing_state,
billing_country,
billing_postal_code,
total) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      invoiceId,
      customerId,
      invoiceDate,
      billingAddress,
      billingCity,
      billingState,
      billingCountry,
      billingPostalCode,
      total,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('Invoice', toDB(),
        where: "invoice_id = ?", whereArgs: [invoiceId]);
  }

  static Future<Invoice?> getById(
    Database database,
    int invoiceId, {
    Set<WhereModel<dynamic, InvoiceSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Invoice invoice
${const InvoiceSetArgs('', '').leftJoin('invoice')}
WHERE invoice.invoiceId = ?
''', [invoiceId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList =
        res.groupBy((e) => [e[InvoiceSetArgs.invoiceId.nameCast]]).values.first;
    return Invoice.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Invoice invoice WHERE invoice.invoiceId = ?''',
        [invoiceId]);
  }

  static Future<void> deleteById(
    Database database,
    int invoiceId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Invoice invoice WHERE invoice.invoiceId = ?''',
        [invoiceId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Invoice''');
  }

  static Invoice $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Invoice(
          invoiceId: json['${childName}invoice_invoice_id'] as int,
          customerId: json['${childName}invoice_customer_id'] as int,
          invoiceDate: json['${childName}invoice_invoice_date'] as String,
          billingAddress: json['${childName}invoice_billing_address'] as String,
          billingCity: json['${childName}invoice_billing_city'] as String,
          billingState: json['${childName}invoice_billing_state'] as String?,
          billingCountry:
              json['${childName}invoice_billing_country'] as String?,
          billingPostalCode:
              json['${childName}invoice_billing_postal_code'] as String?,
          total: json['${childName}invoice_total'] as double);
  Map<String, dynamic> $toDB() => {
        'invoice_id': invoiceId,
        'customer_id': customerId,
        'invoice_date': invoiceDate,
        'billing_address': billingAddress,
        'billing_city': billingCity,
        'billing_state': billingState,
        'billing_country': billingCountry,
        'billing_postal_code': billingPostalCode,
        'total': total
      };
}

class $InvoiceSetArgs<T, M> extends WhereModel<T, M> {
  const $InvoiceSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class InvoiceSetArgs<T> {
  const InvoiceSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $InvoiceSetArgs<int, InvoiceSet> invoiceId =
      $InvoiceSetArgs<int, InvoiceSet>(
    name: 'invoice_id',
    nameCast: 'invoice_invoice_id',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<int, InvoiceSet> customerId =
      $InvoiceSetArgs<int, InvoiceSet>(
    name: 'customer_id',
    nameCast: 'invoice_customer_id',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> invoiceDate =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'invoice_date',
    nameCast: 'invoice_invoice_date',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> billingAddress =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'billing_address',
    nameCast: 'invoice_billing_address',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> billingCity =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'billing_city',
    nameCast: 'invoice_billing_city',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> billingState =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'billing_state',
    nameCast: 'invoice_billing_state',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> billingCountry =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'billing_country',
    nameCast: 'invoice_billing_country',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> billingPostalCode =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'billing_postal_code',
    nameCast: 'invoice_billing_postal_code',
    model: 'invoice',
  );

  static const $InvoiceSetArgs<String, InvoiceSet> total =
      $InvoiceSetArgs<String, InvoiceSet>(
    name: 'total',
    nameCast: 'invoice_total',
    model: 'invoice',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Invoice ${self}invoice ON ${self}invoice.invoiceId = $parentModel.${self2}invoiceId''',
      ].join('\n');

  $InvoiceSetArgs<int, T> get $invoiceId => $InvoiceSetArgs<int, T>(
        name: 'invoice_id',
        nameCast: 'invoice_invoice_id',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<int, T> get $customerId => $InvoiceSetArgs<int, T>(
        name: 'customer_id',
        nameCast: 'invoice_customer_id',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $invoiceDate => $InvoiceSetArgs<String, T>(
        name: 'invoice_date',
        nameCast: 'invoice_invoice_date',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $billingAddress => $InvoiceSetArgs<String, T>(
        name: 'billing_address',
        nameCast: 'invoice_billing_address',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $billingCity => $InvoiceSetArgs<String, T>(
        name: 'billing_city',
        nameCast: 'invoice_billing_city',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $billingState => $InvoiceSetArgs<String, T>(
        name: 'billing_state',
        nameCast: 'invoice_billing_state',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $billingCountry => $InvoiceSetArgs<String, T>(
        name: 'billing_country',
        nameCast: 'invoice_billing_country',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $billingPostalCode =>
      $InvoiceSetArgs<String, T>(
        name: 'billing_postal_code',
        nameCast: 'invoice_billing_postal_code',
        model: 'invoice',
        self: this.self,
      );

  $InvoiceSetArgs<String, T> get $total => $InvoiceSetArgs<String, T>(
        name: 'total',
        nameCast: 'invoice_total',
        model: 'invoice',
        self: this.self,
      );
}

class InvoiceSet {
  const InvoiceSet();
}
