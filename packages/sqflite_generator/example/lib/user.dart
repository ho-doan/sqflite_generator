import 'package:example/category.dart';
import 'package:example/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'user.g.dart';

@entity
class User {
  @PrimaryKey(name: 'categoryId')
  @ForeignKey(name: 'categoryId')
  final Category category;
  @PrimaryKey(name: 'productId')
  @ForeignKey(name: 'productId')
  final Product product;

  const User({
    required this.category,
    required this.product,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) =>
      UserQuery.$fromJson(json);
}
