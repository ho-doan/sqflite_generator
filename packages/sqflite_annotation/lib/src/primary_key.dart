part of '../sqflite_annotation.dart';

class PrimaryKey extends Property {
  final bool auto;

  const PrimaryKey({
    this.auto = true,
    super.name,
  });
}

const primaryKey = PrimaryKey();
