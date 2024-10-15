part of '../sqflite_annotation.dart';

class Property {
  final String? name;
  final int version;
  final List<AlterDB> alters;

  const Property({
    this.name,
    this.version = 1,
    required this.alters,
  });
}

enum AlterType {
  add,
  @Deprecated('not support')
  rename,
  drop,
}

class AlterDB {
  final int version;
  final AlterType type;

  const AlterDB({
    required this.version,
    required this.type,
  });
}
