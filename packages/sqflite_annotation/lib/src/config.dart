part of '../sqflite_annotation.dart';

class SqlConfig {
  final String name;
  final int version;
  final bool isForeign;
  final String? isExternalDB;

  const SqlConfig(
    this.name, {
    this.version = 1,
    this.isForeign = true,
    this.isExternalDB,
  });
}
