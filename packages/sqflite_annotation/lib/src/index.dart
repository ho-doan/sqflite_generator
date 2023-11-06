part of '../sqflite_annotation.dart';

class Index extends Property {
  final bool unique;

  const Index({
    this.unique = false,
    super.name,
  });
}

const index = Index();
