import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'product.g.dart';

@entity
class Product {
  @primaryKey
  final int? id;

  @column
  final String? firstName;
  final String? lastName;

  @column
  final bool blocked;

  Product({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.blocked,
  });

  factory Product.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      ProductQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
