// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ConfigGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

import 'package:example/src/db/models/product.dart' as i0;

import 'package:example/src/db/models/client.dart' as i1;

import 'package:example/src/db/models/category.dart' as i2;

final List<String> _schemas = [
  i0.ProductQuery.createTable,
  i1.ClientQuery.createTable,
  i2.CategoryQuery.createTable
];

Future<Database> $configSql([RootIsolateToken? token]) async {
  if (token != null) {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  }

  final documentsDirectory = await getApplicationDocumentsDirectory();
  final path = join(documentsDirectory.path, 'doggie_database.db');

  final database = await openDatabase(
    path,
    version: 1,
    onOpen: (db) {
      log('db open');
    },
    onCreate: (Database db, int version) async {
      log('db create');
      await Future.wait([for (final schema in _schemas) db.execute(schema)]);
      log('db end create');
    },
    onConfigure: (db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    },
  );

  return database;
}

Future<void> $clearDatabase(Database db) => Future.wait([
      i0.ProductQuery.deleteAll(db),
      i1.ClientQuery.deleteAll(db),
      i2.CategoryQuery.deleteAll(db)
    ]);
