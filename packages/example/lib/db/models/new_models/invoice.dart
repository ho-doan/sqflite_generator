import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'invoice.g.dart';

@entityTest
class Invoice {
  @primaryKey
  final int invoiceId;
  // TODO(hodoan): FOREIGN KEY ([SupportRepId]) REFERENCES "employees" ([EmployeeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int customerId;
  final String invoiceDate;
  final String billingAddress;
  final String billingCity;
  final String? billingState;
  final String? billingCountry;
  final String? billingPostalCode;
  final double total;
  const Invoice({
    required this.invoiceId,
    required this.customerId,
    required this.invoiceDate,
    required this.billingAddress,
    required this.billingCity,
    this.billingState,
    this.billingCountry,
    this.billingPostalCode,
    required this.total,
  });

  factory Invoice.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      InvoiceQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
