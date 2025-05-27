part of '../sqflite_annotation.dart';

class Entity {
  final String? name;
  final bool isTest;

  const Entity({this.name, this.isTest = false});
}

const entity = Entity();
const entityTest = Entity(isTest: true);
