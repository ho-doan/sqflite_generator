// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ConfigGenerator
// **************************************************************************

// ignore_for_file:

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

import 'package:example/src/db/models/product.dart' as _i0;

import 'package:example/src/db/models/client.dart' as _i1;

import 'package:example/src/db/models/category.dart' as _i2;

final List<String> _schemas = [
  _i0.ProductQuery.createTable,
  _i1.ClientQuery.createTable,
  _i2.CategoryQuery.createTable
];

Future<Database> $configSql([RootIsolateToken? token]) async {
  // init
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
