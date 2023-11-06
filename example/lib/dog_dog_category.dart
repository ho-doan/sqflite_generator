import 'package:example/dog.dart';
import 'package:example/dog_category.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'dog_dog_category.g.dart';

enum TaskType { one, two }

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}

class TaskTypeConverter extends TypeConverter<TaskType?, String?> {
  @override
  TaskType? decode(String? databaseValue) {
    return databaseValue == null ? null : TaskType.values.byName(databaseValue);
  }

  @override
  String? encode(TaskType? value) {
    return value?.name;
  }
}

@entity
class DogDogCategory {
  @primaryKey
  @ForeignKey(parent: Dog)
  final int? dogId;

  @joinForeign
  final Dog? dog;

  @joinForeign
  final DogCategory? dogCategory;

  @primaryKey
  @ForeignKey(parent: DogCategory)
  final int dogCategoryId;

  @column
  final DateTime? created;

  @column
  final TaskType? task;

  @column
  final String name;

  const DogDogCategory({
    this.dogId,
    required this.dogCategoryId,
    required this.name,
    this.dog,
    this.dogCategory,
    this.created,
    this.task,
  });
}
