// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

extension BillQuery on Bill {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Bill(
			product_id INTEGER,
			client_id INTEGER,
			client_client_product_id INTEGER,
			parent_parent_bill_product_id INTEGER,
			parent_parent_bill_client_id INTEGER,
			parent_parent_bill_client_product_id INTEGER,
			parent_client_client_id INTEGER,
			parent_client_parent_client_client_product_id INTEGER,
			time INTEGER,
			PRIMARY KEY [product_id, client_id, client_client_product_id],
			FOREIGN KEY (product_id) REFERENCES Product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (client_id,client_client_product_id) REFERENCES Client (id,client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_parent_bill_product_id,parent_parent_bill_client_id,parent_parent_bill_client_product_id) REFERENCES Bill (bill_product_id,bill_client_id,bill_client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (parent_client_client_id,parent_client_parent_client_client_product_id) REFERENCES Client (id,client_product_id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static const String debug =
      '''(product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(client_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(client_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(client_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(parent_bill_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(parent_bill_client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(parent_bill_bill_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(parent_bill_bill_client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_bill_client_product, nameDefault: product, name: null, nameToDB: product, nameFromDB: client_product, dartType: Product, _isQues: false, _sqlType: NONE, _isNull: NOT NULLrawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(time, nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_bill_client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_bill_client_product, nameDefault: product, name: null, nameToDB: product, nameFromDB: client_product, dartType: Product, _isQues: false, _sqlType: NONE, _isNull: NOT NULLrawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(time, nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_bill_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(time, nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(client_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_client_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(parent_client_client_product_id, nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(firstName, nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(lastName, nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false),
(blocked, nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false),
(time, nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false)''';

  static const Map<int, List<String>> alter = {};

// APkEx(nameCast: product_id, name: id, name2: product_id, model: Product, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [product], fk: null)
  static const $BillSetArgs<int> productId = $BillSetArgs(
    name: 'id',
    nameCast: 'product_id',
    model: 'product',
  );

// APkEx(nameCast: client_id, name: id, name2: client_id, model: Client, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [client], fk: null)
  static const $BillSetArgs<int> clientId = $BillSetArgs(
    name: 'id',
    nameCast: 'client_id',
    model: 'client',
  );

// APkEx(nameCast: product_id, name: id, name2: client_product_id, model: Product, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [client, Client], fk: null)
  static const $BillSetArgs<int> clientProductId = $BillSetArgs(
    name: 'id',
    nameCast: 'client_product_id',
    model: 'product',
  );

// APkEx(nameCast: product_last_name, name: product_last_name, name2: null, model: Product, children: [], property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: product_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [product], fk: null)
  static const $BillSetArgs<String> productLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'product_last_name',
    model: 'product',
  );

// APkEx(nameCast: product_first_name, name: product_first_name, name2: null, model: Product, children: [], property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: product_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [product], fk: null)
  static const $BillSetArgs<String> productFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'product_first_name',
    model: 'product',
  );

// APkEx(nameCast: product_blocked, name: product_blocked, name2: null, model: Product, children: [], property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: product_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [product], fk: null)
  static const $BillSetArgs<bool> productBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'product_blocked',
    model: 'product',
  );

// APkEx(nameCast: client_first_name, name: client_first_name, name2: null, model: Client, children: [], property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [client], fk: null)
  static const $BillSetArgs<String> clientFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'client_first_name',
    model: 'client',
  );

// APkEx(nameCast: client_last_name, name: client_last_name, name2: null, model: Client, children: [], property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [client], fk: null)
  static const $BillSetArgs<String> clientLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'client_last_name',
    model: 'client',
  );

// APkEx(nameCast: client_blocked, name: client_blocked, name2: null, model: Client, children: [], property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [client], fk: null)
  static const $BillSetArgs<bool> clientBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'client_blocked',
    model: 'client',
  );

// APkEx(nameCast: product_id, name: id, name2: parent_product_id, model: Product, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parent, Bill], fk: nameDefault: parent, name: Bill, nameToDB: bill, nameFromDB: bill_bill, dartType: Bill?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $BillSetArgs<int> parentProductId = $BillSetArgs(
    name: 'id',
    nameCast: 'parent_product_id',
    model: 'product',
  );

// APkEx(nameCast: client_id, name: id, name2: parent_client_id, model: Client, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parent, Bill], fk: nameDefault: parent, name: Bill, nameToDB: bill, nameFromDB: bill_bill, dartType: Bill?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $BillSetArgs<int> parentClientId = $BillSetArgs(
    name: 'id',
    nameCast: 'parent_client_id',
    model: 'client',
  );

// APkEx(nameCast: product_id, name: id, name2: parent_client_product_id, model: Product, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parent, Bill, Client], fk: nameDefault: parent, name: Bill, nameToDB: bill, nameFromDB: bill_bill, dartType: Bill?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $BillSetArgs<int> parentClientProductId = $BillSetArgs(
    name: 'id',
    nameCast: 'parent_client_product_id',
    model: 'product',
  );

// APkEx(nameCast: bill_time, name: parent_time, name2: null, model: Bill, children: [], property: nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [parent], fk: null)
  static const $BillSetArgs<String> parentTime = $BillSetArgs(
    name: 'time',
    nameCast: 'bill_time',
    model: 'bill',
  );

// APkEx(nameCast: client_id, name: id, name2: parentClient_id, model: Client, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: client_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parentClient], fk: nameDefault: parentClient, name: Client, nameToDB: client, nameFromDB: bill_client, dartType: Client?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $BillSetArgs<int> parentClientId = $BillSetArgs(
    name: 'id',
    nameCast: 'parentClient_id',
    model: 'client',
  );

// APkEx(nameCast: product_id, name: id, name2: parentClient_product_id, model: Product, children: [], property: nameDefault: id, name: null, nameToDB: id, nameFromDB: product_id, dartType: int?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: APrimaryKey, nameSelf: null, parentClassName: [parentClient, Client], fk: nameDefault: parentClient, name: Client, nameToDB: client, nameFromDB: bill_client, dartType: Client?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: true)
  static const $BillSetArgs<int> parentClientProductId = $BillSetArgs(
    name: 'id',
    nameCast: 'parentClient_product_id',
    model: 'product',
  );

// APkEx(nameCast: client_first_name, name: parent_client_first_name, name2: null, model: Client, children: [], property: nameDefault: firstName, name: null, nameToDB: first_name, nameFromDB: client_first_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [parentClient], fk: null)
  static const $BillSetArgs<String> parentClientFirstName = $BillSetArgs(
    name: 'first_name',
    nameCast: 'client_first_name',
    model: 'client',
  );

// APkEx(nameCast: client_last_name, name: parent_client_last_name, name2: null, model: Client, children: [], property: nameDefault: lastName, name: null, nameToDB: last_name, nameFromDB: client_last_name, dartType: String?, _isQues: true, _sqlType: TEXT, _isNull: rawFromDB: false, pk: null, nameSelf: null, parentClassName: [parentClient], fk: null)
  static const $BillSetArgs<String> parentClientLastName = $BillSetArgs(
    name: 'last_name',
    nameCast: 'client_last_name',
    model: 'client',
  );

// APkEx(nameCast: client_blocked, name: parent_client_blocked, name2: null, model: Client, children: [], property: nameDefault: blocked, name: null, nameToDB: blocked, nameFromDB: client_blocked, dartType: bool, _isQues: false, _sqlType: BIT, _isNull: NOT NULLrawFromDB: false, pk: null, nameSelf: null, parentClassName: [parentClient], fk: null)
  static const $BillSetArgs<bool> parentClientBlocked = $BillSetArgs(
    name: 'blocked',
    nameCast: 'client_blocked',
    model: 'client',
  );

// APkEx(nameCast: bill_time, name: time, name2: null, model: Bill, children: [], property: nameDefault: time, name: null, nameToDB: time, nameFromDB: bill_time, dartType: DateTime?, _isQues: true, _sqlType: INTEGER, _isNull: rawFromDB: false, pk: null, nameSelf: time, parentClassName: [], fk: null)
  static const $BillSetArgs<String> time = $BillSetArgs(
    name: 'time',
    nameCast: 'bill_time',
    model: 'bill',
  );

  static Set<$BillSetArgs> $default = {
    BillQuery.productId,
    BillQuery.clientId,
    BillQuery.clientProductId,
    BillQuery.productLastName,
    BillQuery.productFirstName,
    BillQuery.productBlocked,
    BillQuery.clientFirstName,
    BillQuery.clientLastName,
    BillQuery.clientBlocked,
    BillQuery.parentProductId,
    BillQuery.parentClientId,
    BillQuery.parentClientProductId,
    BillQuery.parentTime,
    BillQuery.parentClientId,
    BillQuery.parentClientProductId,
    BillQuery.parentClientFirstName,
    BillQuery.parentClientLastName,
    BillQuery.parentClientBlocked,
    BillQuery.time,
  };

  static String $createSelect(
    Set<$BillSetArgs>? select, [
    String childName = '',
  ]) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) => '$childName${e.model}.${e.name} as ${e.nameCast}')
          .join(',');
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
        .groupBy(((m) => m[BillQuery.product.nameCast]))
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

  Future<int> insert(Database database) async {
    final $productIdProduct = await product?.insert(database);
    final $clientIdClient = await client?.insert(database);
    final $billIdParent = await parent?.insert(database);
    final $clientIdParentClient = await parentClient?.insert(database);
    final $id =
        await database.rawInsert('''INSERT OR REPLACE INTO Bill (product,
client,
product,
client,
bill,
client,
time) 
       VALUES(?, ?, ?, ?, ?, ?, ?)''', [
      this.product,
      this.client,
      $productIdProduct,
      $clientIdClient,
      $billIdParent,
      $clientIdParentClient,
      this.time,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await product?.update(database);
    await client?.update(database);
    await parent?.update(database);
    await parentClient?.update(database);
    return await database.update('Bill', toDB(),
        where: "product = ? AND client = ?",
        whereArgs: [product?.id, client?.id, client?.product]);
  }

  static Future<Bill?> getById(
    Database database,
    int? productId,
    int? clientId,
    int? productId,
    Product productProduct, {
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
WHERE bill.product = ? AND bill.client = ?
''', [productId, clientId, clientProduct]) as List<Map>);
    return res.isNotEmpty ? Bill.fromDB(res.first, res) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE FROM Bill bill WHERE bill.product = ? AND bill.client = ?''',
        [product?.id, client?.id, client?.product]);
  }

  static Future<void> deleteById(
    Database database,
    int? productId,
    int? clientId,
    int? productId,
    Product productProduct,
  ) async {
    await database.rawQuery(
        '''DELETE FROM Bill bill WHERE bill.product = ? AND bill.client = ?''',
        [productId, clientId, clientProduct]);
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
        id: json['${childName}product_id'] as int?,
        id: json['${childName}client_id'] as int?,
        id: json['${childName}product_id'] as int?,
        id: json['${childName}product_id'] as int?,
        id: json['${childName}client_id'] as int?,
        id: json['${childName}product_id'] as int?,
        id: json['${childName}client_id'] as int?,
        id: json['${childName}product_id'] as int?,
        time: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}bill_time'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'product': this.product,
        'client': this.client,
        'product': product?.id,
        'client': client?.id,
        'bill': parent?.product,
        'client': parentClient?.id,
        'time': this.time?.millisecondsSinceEpoch,
      };
}

class $BillSetArgs<T> extends WhereModel<T> {
  const $BillSetArgs({
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
