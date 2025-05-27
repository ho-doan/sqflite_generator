import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'customer.g.dart';

@entityTest
class Customer extends EntityQuery {
  @primaryKey
  final int customerId;
  final String firstName;
  final String lastName;
  final String? company;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? phone;
  final String? fax;
  final String? email;
  // TODO(hodoan): FOREIGN KEY ([SupportRepId]) REFERENCES "employees" ([EmployeeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int? supportRepId;

  const Customer({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    this.company,
    this.address,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.phone,
    this.fax,
    this.email,
    this.supportRepId,
  });

  factory Customer.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      CustomerQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
