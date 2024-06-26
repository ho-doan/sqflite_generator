import 'package:example/src/db/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

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

  factory Client.fromDB(Map<dynamic, dynamic> json, [String childName = '']) =>
      ClientQuery.$fromDB(json);

  Map<String, dynamic> toDB() => $toDB();
}
