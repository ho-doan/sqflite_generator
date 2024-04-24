import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'category.g.dart';

@entity
class Category {
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

  const Category({
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
  });

  factory Category.fromJson(Map<dynamic, dynamic> json) =>
      CategoryQuery.$fromJson(json);
}
