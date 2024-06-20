import 'dart:developer';

import 'package:example/src/db/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

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
class Category extends ICategory {
  @primaryKey
  final int? key;

  const Category({
    required this.key,
    required super.id,
    required super.name,
    @ForeignKey(name: 'productId') required super.product,
  });

  factory Category.fromDB(Map<dynamic, dynamic> json) =>
      CategoryQuery.$fromDB(json);

  Map<String, dynamic> toDB() => $toDB();

  void get() {
    CategoryX.query.select([CategoryX.id, CategoryX.name]).where(
        [CategoryX.wId(1), CategoryX.wName('help')]);
  }
}

class $Category extends EEntity {
  const $Category();
}

extension CategoryX on Category {
  static EQuery<$Category, int> id = const EQuery('category.id');
  static Qu<$Category, int> wId(int value) => MapEntry(
        const EQuery('category.id'),
        value,
      );
  static Qu<$Category, String> wName(String value) => MapEntry(
        const EQuery('category.id'),
        value,
      );
  static EQuery<$Category, String> name = const EQuery('category.name');

  static $Category get _schema => const $Category();
  static DataBaseQuery query = DataBaseQuery(_schema, type: $Category);
}
