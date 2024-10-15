part of '../sqflite_annotation.dart';

class Column extends Property {
  final ColumnDBConverter? converter;
  const Column({
    super.alters = const [],
    super.name,
    super.version,
    this.converter,
  });
}

const column = Column(version: 1);

abstract class ColumnDBConverter<T> {
  T fromJson(String? value);
  String toJson(T value);
  const ColumnDBConverter();
}
