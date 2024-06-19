import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

part 'cat.g.dart';

@entity
class Cat {
  @primaryKey
  final int? id;

  @ForeignKey(name: 'parentId')
  final Cat? parent;

  @ForeignKey(name: 'childId')
  final Cat? child;

  @column
  final DateTime? birth;

  const Cat({
    this.child,
    this.parent,
    this.birth,
    required this.id,
  });

  factory Cat.fromDB(Map<dynamic, dynamic> json, [String childName = '']) =>
      CatQuery.$fromDB(json);

  Map<String, dynamic> toDB() => $toDB();
}
