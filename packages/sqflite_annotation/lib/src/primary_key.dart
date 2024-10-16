part of '../sqflite_annotation.dart';

class PrimaryKey extends Property {
  final bool auto;

  const PrimaryKey({
    super.alters = const [],
    this.auto = true,
    super.name,
    super.version,
  });
}

const primaryKey = PrimaryKey(version: 1);
const primaryKeyNoIncrement = PrimaryKey(version: 1, auto: false);
