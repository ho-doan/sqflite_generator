import 'package:sqflite_query/sqflite_query.dart';

part 'dog_category.g.dart';

@entity
class DogCategory {
  @primaryKey
  final int id;
  @column
  final String name;

  const DogCategory({
    required this.id,
    required this.name,
  });
}
