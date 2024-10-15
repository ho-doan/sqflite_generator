import 'package:example/db/models/client.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'product.dart';

part 'bill.g.dart';

@entity
class Bill {
  @primaryKey
  @ForeignKey(name: 'productId')
  final Product? product;

  @primaryKey
  @ForeignKey(name: 'clientId')
  final Client? client;

  @column
  final DateTime? time;

  const Bill({
    this.client,
    this.time,
    required this.product,
  });

  factory Bill.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      BillQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
