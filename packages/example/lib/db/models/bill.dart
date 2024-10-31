import 'package:example/db/models/client.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'product.dart';

part 'bill.g.dart';

@entity
class Bill extends EntityQuery {
  @primaryKey
  @ForeignKey(name: 'Product')
  final Product? product;

  @primaryKey
  @ForeignKey(name: 'Client')
  final Client? client;

  @ForeignKey(name: 'Bill')
  final Bill? parent;

  @column
  final DateTime? time;

  const Bill({
    this.client,
    this.time,
    this.parent,
    required this.product,
  });

  factory Bill.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      BillQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
