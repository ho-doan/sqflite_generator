import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'product.dart';

part 'client.g.dart';

@entity
class Client {
  @primaryKey
  final int? id;

  @column
  final String? firstName;

  @column
  final String? lastName;

  @column
  final bool blocked;

  @ForeignKey(name: 'productId')
  final Product product;

  const Client({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.blocked,
    required this.product,
  });

  factory Client.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      ClientQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
