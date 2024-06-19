import 'package:example/src/db/models/client.dart';
import 'package:example/src/db/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

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

  factory Bill.fromDB(Map<dynamic, dynamic> json, [String childName = '']) =>
      BillQuery.$fromDB(json);

  Map<String, dynamic> toDB() => $toDB();
}
