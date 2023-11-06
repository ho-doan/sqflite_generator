part of '../sqflite_annotation.dart';

@experimental
abstract class TypeConverter<T, S> {
  /// Converts the [databaseValue] of type [S] into [T]
  T decode(S databaseValue);

  /// Converts the [value] of type [T] into the database-compatible type [S]
  S encode(T value);
}
