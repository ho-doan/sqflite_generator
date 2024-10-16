import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'product.dart';

part 'category.g.dart';

class ICategory {
  final String name;
  final String id;
  final Product product;

  const ICategory({
    required this.name,
    required this.id,
    required this.product,
  });
}

@entity
class Category extends ICategory implements EntityQuery {
  @primaryKey
  final int? key;

  const Category({
    required this.key,
    required super.id,
    required super.name,
    @ForeignKey(name: 'productId') required super.product,
  });

  factory Category.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      CategoryQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() {
    return $toDB();
  }
}
