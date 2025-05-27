import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'invoice_item.g.dart';

@entityTest
class InvoiceItem {
  @primaryKey
  final int invoiceLineId;
  // TODO(hodoan): FOREIGN KEY ([InvoiceId]) REFERENCES "invoices" ([InvoiceId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int invoiceId;
  // TODO(hodoan): FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int trackId;
  final double unitPrice;
  final int quantity;

  const InvoiceItem({
    required this.invoiceLineId,
    required this.invoiceId,
    required this.trackId,
    required this.unitPrice,
    required this.quantity,
  });

  factory InvoiceItem.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      InvoiceItemQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
