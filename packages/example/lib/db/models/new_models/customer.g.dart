// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $CustomerQuerySample on Customer {
  static const String selectAll = '''
	SELECT
			customer_id,
			first_name,
			last_name,
			company,
			address,
			city,
			state,
			country,
			postal_code,
			phone,
			fax,
			email,
			support_rep_id
	FROM Customer;''';
}

class CustomerFilter {
  const CustomerFilter(this.value);

  final String value;

  CustomerFilter get sortByCustomerId => const CustomerFilter('customer_id');

  CustomerFilter get sortByFirstName => const CustomerFilter('first_name');

  CustomerFilter get sortByLastName => const CustomerFilter('last_name');

  CustomerFilter get sortByCompany => const CustomerFilter('company');

  CustomerFilter get sortByAddress => const CustomerFilter('address');

  CustomerFilter get sortByCity => const CustomerFilter('city');

  CustomerFilter get sortByState => const CustomerFilter('state');

  CustomerFilter get sortByCountry => const CustomerFilter('country');

  CustomerFilter get sortByPostalCode => const CustomerFilter('postal_code');

  CustomerFilter get sortByPhone => const CustomerFilter('phone');

  CustomerFilter get sortByFax => const CustomerFilter('fax');

  CustomerFilter get sortByEmail => const CustomerFilter('email');

  CustomerFilter get sortBySupportRepId =>
      const CustomerFilter('support_rep_id');

  CustomerFilter get sortByCustomerIdDesc =>
      const CustomerFilter('customer_id DESC');

  CustomerFilter get sortByFirstNameDesc =>
      const CustomerFilter('first_name DESC');

  CustomerFilter get sortByLastNameDesc =>
      const CustomerFilter('last_name DESC');

  CustomerFilter get sortByCompanyDesc => const CustomerFilter('company DESC');

  CustomerFilter get sortByAddressDesc => const CustomerFilter('address DESC');

  CustomerFilter get sortByCityDesc => const CustomerFilter('city DESC');

  CustomerFilter get sortByStateDesc => const CustomerFilter('state DESC');

  CustomerFilter get sortByCountryDesc => const CustomerFilter('country DESC');

  CustomerFilter get sortByPostalCodeDesc =>
      const CustomerFilter('postal_code DESC');

  CustomerFilter get sortByPhoneDesc => const CustomerFilter('phone DESC');

  CustomerFilter get sortByFaxDesc => const CustomerFilter('fax DESC');

  CustomerFilter get sortByEmailDesc => const CustomerFilter('email DESC');

  CustomerFilter get sortBySupportRepIdDesc =>
      const CustomerFilter('support_rep_id DESC');

  CustomerFilter get sortByCompanyNullsFirst =>
      const CustomerFilter('company NULLS FIRST');

  CustomerFilter get sortByAddressNullsFirst =>
      const CustomerFilter('address NULLS FIRST');

  CustomerFilter get sortByCityNullsFirst =>
      const CustomerFilter('city NULLS FIRST');

  CustomerFilter get sortByStateNullsFirst =>
      const CustomerFilter('state NULLS FIRST');

  CustomerFilter get sortByCountryNullsFirst =>
      const CustomerFilter('country NULLS FIRST');

  CustomerFilter get sortByPostalCodeNullsFirst =>
      const CustomerFilter('postal_code NULLS FIRST');

  CustomerFilter get sortByPhoneNullsFirst =>
      const CustomerFilter('phone NULLS FIRST');

  CustomerFilter get sortByFaxNullsFirst =>
      const CustomerFilter('fax NULLS FIRST');

  CustomerFilter get sortByEmailNullsFirst =>
      const CustomerFilter('email NULLS FIRST');

  CustomerFilter get sortBySupportRepIdNullsFirst =>
      const CustomerFilter('support_rep_id NULLS FIRST');

  CustomerFilter get sortByCompanyNullsLast =>
      const CustomerFilter('company NULLS LAST');

  CustomerFilter get sortByAddressNullsLast =>
      const CustomerFilter('address NULLS LAST');

  CustomerFilter get sortByCityNullsLast =>
      const CustomerFilter('city NULLS LAST');

  CustomerFilter get sortByStateNullsLast =>
      const CustomerFilter('state NULLS LAST');

  CustomerFilter get sortByCountryNullsLast =>
      const CustomerFilter('country NULLS LAST');

  CustomerFilter get sortByPostalCodeNullsLast =>
      const CustomerFilter('postal_code NULLS LAST');

  CustomerFilter get sortByPhoneNullsLast =>
      const CustomerFilter('phone NULLS LAST');

  CustomerFilter get sortByFaxNullsLast =>
      const CustomerFilter('fax NULLS LAST');

  CustomerFilter get sortByEmailNullsLast =>
      const CustomerFilter('email NULLS LAST');

  CustomerFilter get sortBySupportRepIdNullsLast =>
      const CustomerFilter('support_rep_id NULLS LAST');
}

class CustomerWhere {
  const CustomerWhere(this.value);

  final String value;

  CustomerWhere or() => CustomerWhere(" or ");

  CustomerWhere customerIdEqual(dynamic value) =>
      CustomerWhere("customer_id = $value");

  CustomerWhere customerIdNotEqual(dynamic value) =>
      CustomerWhere("customer_id != $value");

  CustomerWhere firstNameEqual(dynamic value) =>
      CustomerWhere("first_name = '$value'");

  CustomerWhere firstNameNotEqual(dynamic value) =>
      CustomerWhere("first_name != '$value'");

  CustomerWhere lastNameEqual(dynamic value) =>
      CustomerWhere("last_name = '$value'");

  CustomerWhere lastNameNotEqual(dynamic value) =>
      CustomerWhere("last_name != '$value'");

  CustomerWhere companyEqual(dynamic value) =>
      CustomerWhere("company = '$value'");

  CustomerWhere companyNotEqual(dynamic value) =>
      CustomerWhere("company != '$value'");

  CustomerWhere addressEqual(dynamic value) =>
      CustomerWhere("address = '$value'");

  CustomerWhere addressNotEqual(dynamic value) =>
      CustomerWhere("address != '$value'");

  CustomerWhere cityEqual(dynamic value) => CustomerWhere("city = '$value'");

  CustomerWhere cityNotEqual(dynamic value) =>
      CustomerWhere("city != '$value'");

  CustomerWhere stateEqual(dynamic value) => CustomerWhere("state = '$value'");

  CustomerWhere stateNotEqual(dynamic value) =>
      CustomerWhere("state != '$value'");

  CustomerWhere countryEqual(dynamic value) =>
      CustomerWhere("country = '$value'");

  CustomerWhere countryNotEqual(dynamic value) =>
      CustomerWhere("country != '$value'");

  CustomerWhere postalCodeEqual(dynamic value) =>
      CustomerWhere("postal_code = '$value'");

  CustomerWhere postalCodeNotEqual(dynamic value) =>
      CustomerWhere("postal_code != '$value'");

  CustomerWhere phoneEqual(dynamic value) => CustomerWhere("phone = '$value'");

  CustomerWhere phoneNotEqual(dynamic value) =>
      CustomerWhere("phone != '$value'");

  CustomerWhere faxEqual(dynamic value) => CustomerWhere("fax = '$value'");

  CustomerWhere faxNotEqual(dynamic value) => CustomerWhere("fax != '$value'");

  CustomerWhere emailEqual(dynamic value) => CustomerWhere("email = '$value'");

  CustomerWhere emailNotEqual(dynamic value) =>
      CustomerWhere("email != '$value'");

  CustomerWhere supportRepIdEqual(dynamic value) =>
      CustomerWhere("support_rep_id = $value");

  CustomerWhere supportRepIdNotEqual(dynamic value) =>
      CustomerWhere("support_rep_id != $value");
}

extension CustomerQuery on Customer {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Customer(
			customer_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			first_name TEXT NOT NULL,
			last_name TEXT NOT NULL,
			company TEXT,
			address TEXT,
			city TEXT,
			state TEXT,
			country TEXT,
			postal_code TEXT,
			phone TEXT,
			fax TEXT,
			email TEXT,
			support_rep_id INTEGER
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, CustomerSet>> $default = {
    CustomerSetArgs.customerId,
    CustomerSetArgs.firstName,
    CustomerSetArgs.lastName,
    CustomerSetArgs.company,
    CustomerSetArgs.address,
    CustomerSetArgs.city,
    CustomerSetArgs.state,
    CustomerSetArgs.country,
    CustomerSetArgs.postalCode,
    CustomerSetArgs.phone,
    CustomerSetArgs.fax,
    CustomerSetArgs.email,
    CustomerSetArgs.supportRepId,
  };

  static String $createSelect(Set<WhereModel<dynamic, CustomerSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Customer>> getAll(
    Database database, {
    Set<WhereModel<dynamic, CustomerSet>>? select,
    Set<WhereResult<dynamic, CustomerSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CustomerSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Customer customer
${const CustomerSetArgs('', '').leftJoin('customer')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Customer $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[CustomerSetArgs.customerId.nameCast]]))
        .values
        .map((e) => Customer.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Customer>> top(
    Database database, {
    Set<WhereModel<dynamic, CustomerSet>>? select,
    Set<WhereResult<dynamic, CustomerSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$CustomerSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Customer
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO Customer (customer_id,
first_name,
last_name,
company,
address,
city,
state,
country,
postal_code,
phone,
fax,
email,
support_rep_id) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', [
      customerId,
      firstName,
      lastName,
      company,
      address,
      city,
      state,
      country,
      postalCode,
      phone,
      fax,
      email,
      supportRepId,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('Customer', toDB(),
        where: "customer_id = ?", whereArgs: [customerId]);
  }

  static Future<Customer?> getById(
    Database database,
    int customerId, {
    Set<WhereModel<dynamic, CustomerSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Customer customer
${const CustomerSetArgs('', '').leftJoin('customer')}
WHERE customer.customerId = ?
''', [customerId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList = res
        .groupBy((e) => [e[CustomerSetArgs.customerId.nameCast]])
        .values
        .first;
    return Customer.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Customer customer WHERE customer.customerId = ?''',
        [customerId]);
  }

  static Future<void> deleteById(
    Database database,
    int customerId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Customer customer WHERE customer.customerId = ?''',
        [customerId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Customer''');
  }

  static Customer $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Customer(
          customerId: json['${childName}customer_customer_id'] as int,
          firstName: json['${childName}customer_first_name'] as String,
          lastName: json['${childName}customer_last_name'] as String,
          company: json['${childName}customer_company'] as String?,
          address: json['${childName}customer_address'] as String?,
          city: json['${childName}customer_city'] as String?,
          state: json['${childName}customer_state'] as String?,
          country: json['${childName}customer_country'] as String?,
          postalCode: json['${childName}customer_postal_code'] as String?,
          phone: json['${childName}customer_phone'] as String?,
          fax: json['${childName}customer_fax'] as String?,
          email: json['${childName}customer_email'] as String?,
          supportRepId: json['${childName}customer_support_rep_id'] as int?);
  Map<String, dynamic> $toDB() => {
        'customer_id': customerId,
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'phone': phone,
        'fax': fax,
        'email': email,
        'support_rep_id': supportRepId
      };
}

class $CustomerSetArgs<T, M> extends WhereModel<T, M> {
  const $CustomerSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class CustomerSetArgs<T> {
  const CustomerSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $CustomerSetArgs<int, CustomerSet> customerId =
      $CustomerSetArgs<int, CustomerSet>(
    name: 'customer_id',
    nameCast: 'customer_customer_id',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> firstName =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'first_name',
    nameCast: 'customer_first_name',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> lastName =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'last_name',
    nameCast: 'customer_last_name',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> company =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'company',
    nameCast: 'customer_company',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> address =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'address',
    nameCast: 'customer_address',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> city =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'city',
    nameCast: 'customer_city',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> state =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'state',
    nameCast: 'customer_state',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> country =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'country',
    nameCast: 'customer_country',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> postalCode =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'postal_code',
    nameCast: 'customer_postal_code',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> phone =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'phone',
    nameCast: 'customer_phone',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> fax =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'fax',
    nameCast: 'customer_fax',
    model: 'customer',
  );

  static const $CustomerSetArgs<String, CustomerSet> email =
      $CustomerSetArgs<String, CustomerSet>(
    name: 'email',
    nameCast: 'customer_email',
    model: 'customer',
  );

  static const $CustomerSetArgs<int, CustomerSet> supportRepId =
      $CustomerSetArgs<int, CustomerSet>(
    name: 'support_rep_id',
    nameCast: 'customer_support_rep_id',
    model: 'customer',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Customer ${self}customer ON ${self}customer.customerId = $parentModel.${self2}customerId''',
      ].join('\n');

  $CustomerSetArgs<int, T> get $customerId => $CustomerSetArgs<int, T>(
        name: 'customer_id',
        nameCast: 'customer_customer_id',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $firstName => $CustomerSetArgs<String, T>(
        name: 'first_name',
        nameCast: 'customer_first_name',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $lastName => $CustomerSetArgs<String, T>(
        name: 'last_name',
        nameCast: 'customer_last_name',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $company => $CustomerSetArgs<String, T>(
        name: 'company',
        nameCast: 'customer_company',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $address => $CustomerSetArgs<String, T>(
        name: 'address',
        nameCast: 'customer_address',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $city => $CustomerSetArgs<String, T>(
        name: 'city',
        nameCast: 'customer_city',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $state => $CustomerSetArgs<String, T>(
        name: 'state',
        nameCast: 'customer_state',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $country => $CustomerSetArgs<String, T>(
        name: 'country',
        nameCast: 'customer_country',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $postalCode => $CustomerSetArgs<String, T>(
        name: 'postal_code',
        nameCast: 'customer_postal_code',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $phone => $CustomerSetArgs<String, T>(
        name: 'phone',
        nameCast: 'customer_phone',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $fax => $CustomerSetArgs<String, T>(
        name: 'fax',
        nameCast: 'customer_fax',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<String, T> get $email => $CustomerSetArgs<String, T>(
        name: 'email',
        nameCast: 'customer_email',
        model: 'customer',
        self: this.self,
      );

  $CustomerSetArgs<int, T> get $supportRepId => $CustomerSetArgs<int, T>(
        name: 'support_rep_id',
        nameCast: 'customer_support_rep_id',
        model: 'customer',
        self: this.self,
      );
}

class CustomerSet {
  const CustomerSet();
}
