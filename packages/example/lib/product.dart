import 'package:example/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'product.g.dart';

@entity
class Product {
  @primaryKey
  final int id;
  @column
  final String name;
  @column
  final DateTime valueTime;
  @column
  final int valueInt;
  @column
  final double valueDouble;
  @column
  final bool valueBool;
  @column
  final dynamic valueDynamic;

  final DateTime? valueTimeNull;
  @column
  final int? valueIntNull;
  @column
  final double? valueDoubleNull;
  @column
  final bool? valueBoolNull;

  @ForeignKey(name: 'categoryId')
  final Category category;

  const Product({
    required this.id,
    required this.name,
    required this.valueTime,
    required this.valueInt,
    required this.valueDouble,
    required this.valueBool,
    this.valueDynamic,
    this.valueBoolNull,
    this.valueDoubleNull,
    this.valueIntNull,
    this.valueTimeNull,
    required this.category,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) =>
      ProductQuery.$fromJson(json);
}
