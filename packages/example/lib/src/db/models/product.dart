import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'product.g.dart';

@entity
class Product {
  @primaryKey
  final int? id;

  @column
  final String firstName;
  final String lastName;

  @column
  final bool blocked;

  Product({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.blocked,
  });

  factory Product.fromDB(Map<dynamic, dynamic> json) =>
      ProductQuery.$fromDB(json);

  Map<String, dynamic> toDB() => $toDB();
}
