import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'cat.g.dart';

@entity
class Cat extends EntityQuery {
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

  factory Cat.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      CatQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
