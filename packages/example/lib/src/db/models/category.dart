import 'package:example/src/db/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'category.g.dart';

abstract class ICategory {
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

  Category({
    required this.key,
    required super.id,
    required super.name,
    @ForeignKey(name: 'productId') required super.product,
  });

  factory Category.fromDB(Map<dynamic, dynamic> json) =>
      CategoryQuery.$fromDB(json);

  Map<String, dynamic> toDB() => $toDB();
}
