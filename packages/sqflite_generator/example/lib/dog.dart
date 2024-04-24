import 'package:example/dog_category.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'dog.g.dart';

@entity
class Dog {
  @primaryKey
  final int id;
  @column
  final String name;
  @ForeignKey(parent: DogCategory)
  final int categoryId;

  @joinForeign
  final DogCategory? dogCategory;

  const Dog({
    required this.id,
    required this.name,
    required this.categoryId,
    this.dogCategory,
  });
}
