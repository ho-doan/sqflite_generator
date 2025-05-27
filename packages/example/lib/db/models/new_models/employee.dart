import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'employee.g.dart';

@entityTest
class Employee {
  @primaryKey
  final int employeeId;
  final String lastName;
  final String firstName;
  final String? title;
  // TODO(hodoan): FOREIGN KEY ([ReportsTo]) REFERENCES "employees" ([EmployeeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int? reportsTo;
  final String? birthDate;
  final String? hireDate;
  final String? address;

  const Employee({
    required this.employeeId,
    required this.lastName,
    required this.firstName,
    this.title,
    this.reportsTo,
    this.birthDate,
    this.hireDate,
    this.address,
  });
  factory Employee.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      EmployeeQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
