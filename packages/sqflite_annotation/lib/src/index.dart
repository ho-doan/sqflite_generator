part of '../sqflite_annotation.dart';

class Index extends Property {
  final bool unique;

  const Index({this.unique = false, super.name, super.version});
}

const index = Index(version: 1);
