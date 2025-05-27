// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api

extension $EmployeeQuerySample on Employee {
  static const String selectAll = '''
	SELECT
			employee_id,
			last_name,
			first_name,
			title,
			reports_to,
			birth_date,
			hire_date,
			address
	FROM Employee;''';
}

class EmployeeFilter {
  const EmployeeFilter(this.value);

  final String value;

  EmployeeFilter get sortByEmployeeId => const EmployeeFilter('employee_id');

  EmployeeFilter get sortByLastName => const EmployeeFilter('last_name');

  EmployeeFilter get sortByFirstName => const EmployeeFilter('first_name');

  EmployeeFilter get sortByTitle => const EmployeeFilter('title');

  EmployeeFilter get sortByReportsTo => const EmployeeFilter('reports_to');

  EmployeeFilter get sortByBirthDate => const EmployeeFilter('birth_date');

  EmployeeFilter get sortByHireDate => const EmployeeFilter('hire_date');

  EmployeeFilter get sortByAddress => const EmployeeFilter('address');

  EmployeeFilter get sortByEmployeeIdDesc =>
      const EmployeeFilter('employee_id DESC');

  EmployeeFilter get sortByLastNameDesc =>
      const EmployeeFilter('last_name DESC');

  EmployeeFilter get sortByFirstNameDesc =>
      const EmployeeFilter('first_name DESC');

  EmployeeFilter get sortByTitleDesc => const EmployeeFilter('title DESC');

  EmployeeFilter get sortByReportsToDesc =>
      const EmployeeFilter('reports_to DESC');

  EmployeeFilter get sortByBirthDateDesc =>
      const EmployeeFilter('birth_date DESC');

  EmployeeFilter get sortByHireDateDesc =>
      const EmployeeFilter('hire_date DESC');

  EmployeeFilter get sortByAddressDesc => const EmployeeFilter('address DESC');

  EmployeeFilter get sortByTitleNullsFirst =>
      const EmployeeFilter('title NULLS FIRST');

  EmployeeFilter get sortByReportsToNullsFirst =>
      const EmployeeFilter('reports_to NULLS FIRST');

  EmployeeFilter get sortByBirthDateNullsFirst =>
      const EmployeeFilter('birth_date NULLS FIRST');

  EmployeeFilter get sortByHireDateNullsFirst =>
      const EmployeeFilter('hire_date NULLS FIRST');

  EmployeeFilter get sortByAddressNullsFirst =>
      const EmployeeFilter('address NULLS FIRST');

  EmployeeFilter get sortByTitleNullsLast =>
      const EmployeeFilter('title NULLS LAST');

  EmployeeFilter get sortByReportsToNullsLast =>
      const EmployeeFilter('reports_to NULLS LAST');

  EmployeeFilter get sortByBirthDateNullsLast =>
      const EmployeeFilter('birth_date NULLS LAST');

  EmployeeFilter get sortByHireDateNullsLast =>
      const EmployeeFilter('hire_date NULLS LAST');

  EmployeeFilter get sortByAddressNullsLast =>
      const EmployeeFilter('address NULLS LAST');
}

class EmployeeWhere {
  const EmployeeWhere(this.value);

  final String value;

  EmployeeWhere or() => EmployeeWhere(" or ");

  EmployeeWhere employeeIdEqual(dynamic value) =>
      EmployeeWhere("employee_id = $value");

  EmployeeWhere employeeIdNotEqual(dynamic value) =>
      EmployeeWhere("employee_id != $value");

  EmployeeWhere lastNameEqual(dynamic value) =>
      EmployeeWhere("last_name = '$value'");

  EmployeeWhere lastNameNotEqual(dynamic value) =>
      EmployeeWhere("last_name != '$value'");

  EmployeeWhere firstNameEqual(dynamic value) =>
      EmployeeWhere("first_name = '$value'");

  EmployeeWhere firstNameNotEqual(dynamic value) =>
      EmployeeWhere("first_name != '$value'");

  EmployeeWhere titleEqual(dynamic value) => EmployeeWhere("title = '$value'");

  EmployeeWhere titleNotEqual(dynamic value) =>
      EmployeeWhere("title != '$value'");

  EmployeeWhere reportsToEqual(dynamic value) =>
      EmployeeWhere("reports_to = $value");

  EmployeeWhere reportsToNotEqual(dynamic value) =>
      EmployeeWhere("reports_to != $value");

  EmployeeWhere birthDateEqual(dynamic value) =>
      EmployeeWhere("birth_date = '$value'");

  EmployeeWhere birthDateNotEqual(dynamic value) =>
      EmployeeWhere("birth_date != '$value'");

  EmployeeWhere hireDateEqual(dynamic value) =>
      EmployeeWhere("hire_date = '$value'");

  EmployeeWhere hireDateNotEqual(dynamic value) =>
      EmployeeWhere("hire_date != '$value'");

  EmployeeWhere addressEqual(dynamic value) =>
      EmployeeWhere("address = '$value'");

  EmployeeWhere addressNotEqual(dynamic value) =>
      EmployeeWhere("address != '$value'");
}

extension EmployeeQuery on Employee {
  static const String createTable = '''CREATE TABLE IF NOT EXISTS Employee(
			employee_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			last_name TEXT NOT NULL,
			first_name TEXT NOT NULL,
			title TEXT,
			reports_to INTEGER,
			birth_date TEXT,
			hire_date TEXT,
			address TEXT
	)''';

// TODO(hodoan): check
  static const Map<int, List<String>> alter = {};

  static Set<WhereModel<dynamic, EmployeeSet>> $default = {
    EmployeeSetArgs.employeeId,
    EmployeeSetArgs.lastName,
    EmployeeSetArgs.firstName,
    EmployeeSetArgs.title,
    EmployeeSetArgs.reportsTo,
    EmployeeSetArgs.birthDate,
    EmployeeSetArgs.hireDate,
    EmployeeSetArgs.address,
  };

  static String $createSelect(Set<WhereModel<dynamic, EmployeeSet>>? select) =>
      ((select ?? {}).isEmpty ? $default : select!)
          .map((e) =>
              '${'${e.self}${e.model}'.replaceFirst(RegExp('^_'), '')}.${e.name} as ${e.self}${e.nameCast}')
          .join(',');
  static Future<List<Employee>> getAll(
    Database database, {
    Set<WhereModel<dynamic, EmployeeSet>>? select,
    Set<WhereResult<dynamic, EmployeeSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$EmployeeSetArgs>>? orderBy,
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

    final sql = '''SELECT ${$createSelect(select)} FROM Employee employee
${const EmployeeSetArgs('', '').leftJoin('employee')}
${whereStr.isNotEmpty ? whereStr : ''}
${(orderBy ?? {}).isNotEmpty ? 'ORDER BY ${(orderBy ?? {}).map((e) => '${e.field.field.replaceFirst(RegExp('^_'), '')} ${e.type}').join(',')}' : ''}
${limit != null ? 'LIMIT $limit' : ''}
${offset != null ? 'OFFSET $offset' : ''}
''';
    if (kDebugMode) {
      print('get all Employee $sql');
    }
    final mapList = (await database.rawQuery(sql) as List<Map>);
    return mapList
        .groupBy(((m) => [m[EmployeeSetArgs.employeeId.nameCast]]))
        .values
        .map((e) => Employee.fromDB(e.first, e))
        .toList();
  }

  static Future<List<Employee>> top(
    Database database, {
    Set<WhereModel<dynamic, EmployeeSet>>? select,
    Set<WhereResult<dynamic, EmployeeSet>>? where,
    List<Set<WhereResult>>? whereOr,
    Set<OrderBy<$EmployeeSetArgs>>? orderBy,
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
        (await database.rawQuery('''SELECT count(*) as ns_count FROM Employee
''') as List<Map>);
    return mapList.first['ns_count'] as int;
  }

// TODO(hodoan): check primary keys auto
  Future<int> insert(Database database) async {
    final $id = await database
        .rawInsert('''INSERT OR REPLACE INTO Employee (employee_id,
last_name,
first_name,
title,
reports_to,
birth_date,
hire_date,
address) 
       VALUES(?, ?, ?, ?, ?, ?, ?, ?)''', [
      employeeId,
      lastName,
      firstName,
      title,
      reportsTo,
      birthDate,
      hireDate,
      address,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    return await database.update('Employee', toDB(),
        where: "employee_id = ?", whereArgs: [employeeId]);
  }

  static Future<Employee?> getById(
    Database database,
    int employeeId, {
    Set<WhereModel<dynamic, EmployeeSet>>? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Employee employee
${const EmployeeSetArgs('', '').leftJoin('employee')}
WHERE employee.employeeId = ?
''', [employeeId]) as List<Map>);
    if (res.isEmpty) return null;
    final mapList = res
        .groupBy((e) => [e[EmployeeSetArgs.employeeId.nameCast]])
        .values
        .first;
    return Employee.fromDB(mapList.first, mapList);
  }

  Future<void> delete(Database database) async {
    await database.rawQuery(
        '''DELETE * FROM Employee employee WHERE employee.employeeId = ?''',
        [employeeId]);
  }

  static Future<void> deleteById(
    Database database,
    int employeeId,
  ) async {
    await database.rawQuery(
        '''DELETE * FROM Employee employee WHERE employee.employeeId = ?''',
        [employeeId]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Employee''');
  }

  static Employee $fromDB(
    Map json,
    List<Map> lst, [
    String childName = '',
    int childStep = 0,
  ]) =>
      Employee(
          employeeId: json['${childName}employee_employee_id'] as int,
          lastName: json['${childName}employee_last_name'] as String,
          firstName: json['${childName}employee_first_name'] as String,
          title: json['${childName}employee_title'] as String?,
          reportsTo: json['${childName}employee_reports_to'] as int?,
          birthDate: json['${childName}employee_birth_date'] as String?,
          hireDate: json['${childName}employee_hire_date'] as String?,
          address: json['${childName}employee_address'] as String?);
  Map<String, dynamic> $toDB() => {
        'employee_id': employeeId,
        'last_name': lastName,
        'first_name': firstName,
        'title': title,
        'reports_to': reportsTo,
        'birth_date': birthDate,
        'hire_date': hireDate,
        'address': address
      };
}

class $EmployeeSetArgs<T, M> extends WhereModel<T, M> {
  const $EmployeeSetArgs({
    super.self = '',
    required super.name,
    required super.nameCast,
    required super.model,
  }) : super(field: '${self}_$model.$name');
}

class EmployeeSetArgs<T> {
  const EmployeeSetArgs(
    this.self,
    this.self2,
  );

  final String self;

  final String self2;

  static const $EmployeeSetArgs<int, EmployeeSet> employeeId =
      $EmployeeSetArgs<int, EmployeeSet>(
    name: 'employee_id',
    nameCast: 'employee_employee_id',
    model: 'employee',
  );

  static const $EmployeeSetArgs<String, EmployeeSet> lastName =
      $EmployeeSetArgs<String, EmployeeSet>(
    name: 'last_name',
    nameCast: 'employee_last_name',
    model: 'employee',
  );

  static const $EmployeeSetArgs<String, EmployeeSet> firstName =
      $EmployeeSetArgs<String, EmployeeSet>(
    name: 'first_name',
    nameCast: 'employee_first_name',
    model: 'employee',
  );

  static const $EmployeeSetArgs<String, EmployeeSet> title =
      $EmployeeSetArgs<String, EmployeeSet>(
    name: 'title',
    nameCast: 'employee_title',
    model: 'employee',
  );

  static const $EmployeeSetArgs<int, EmployeeSet> reportsTo =
      $EmployeeSetArgs<int, EmployeeSet>(
    name: 'reports_to',
    nameCast: 'employee_reports_to',
    model: 'employee',
  );

  static const $EmployeeSetArgs<String, EmployeeSet> birthDate =
      $EmployeeSetArgs<String, EmployeeSet>(
    name: 'birth_date',
    nameCast: 'employee_birth_date',
    model: 'employee',
  );

  static const $EmployeeSetArgs<String, EmployeeSet> hireDate =
      $EmployeeSetArgs<String, EmployeeSet>(
    name: 'hire_date',
    nameCast: 'employee_hire_date',
    model: 'employee',
  );

  static const $EmployeeSetArgs<String, EmployeeSet> address =
      $EmployeeSetArgs<String, EmployeeSet>(
    name: 'address',
    nameCast: 'employee_address',
    model: 'employee',
  );

  String leftJoin(
    String parentModel, [
    int step = 0,
  ]) =>
      [
        if (self.isNotEmpty)
          '''LEFT JOIN Employee ${self}employee ON ${self}employee.employeeId = $parentModel.${self2}employeeId''',
      ].join('\n');

  $EmployeeSetArgs<int, T> get $employeeId => $EmployeeSetArgs<int, T>(
        name: 'employee_id',
        nameCast: 'employee_employee_id',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<String, T> get $lastName => $EmployeeSetArgs<String, T>(
        name: 'last_name',
        nameCast: 'employee_last_name',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<String, T> get $firstName => $EmployeeSetArgs<String, T>(
        name: 'first_name',
        nameCast: 'employee_first_name',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<String, T> get $title => $EmployeeSetArgs<String, T>(
        name: 'title',
        nameCast: 'employee_title',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<int, T> get $reportsTo => $EmployeeSetArgs<int, T>(
        name: 'reports_to',
        nameCast: 'employee_reports_to',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<String, T> get $birthDate => $EmployeeSetArgs<String, T>(
        name: 'birth_date',
        nameCast: 'employee_birth_date',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<String, T> get $hireDate => $EmployeeSetArgs<String, T>(
        name: 'hire_date',
        nameCast: 'employee_hire_date',
        model: 'employee',
        self: this.self,
      );

  $EmployeeSetArgs<String, T> get $address => $EmployeeSetArgs<String, T>(
        name: 'address',
        nameCast: 'employee_address',
        model: 'employee',
        self: this.self,
      );
}

class EmployeeSet {
  const EmployeeSet();
}
