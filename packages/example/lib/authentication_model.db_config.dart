// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ConfigGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas, always_put_required_named_parameters_first

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer';
import 'package:flutter/services.dart';

import 'package:example/db/models/product.dart' as i0;

import 'package:example/db/models/client.dart' as i1;

import 'package:example/db/models/category.dart' as i2;

import 'package:example/db/models/cat.dart' as i3;

import 'package:example/db/models/bill.dart' as i4;

import 'package:example/authentication_model.dart' as i5;

import 'package:example/authentication_model.dart' as i6;

import 'dart:io';

import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'package:path_provider/path_provider.dart';

final List<String> _schemas = [
  'CREATE TABLE IF NOT EXISTS Migrations(key TEXT PRIMARY KEY)',
  i0.ProductQuery.createTable,
  i1.ClientQuery.createTable,
  i2.CategoryQuery.createTable,
  i3.CatQuery.createTable,
  i4.BillQuery.createTable,
  i5.BillMQuery.createTable,
  i6.BillDetailQuery.createTable
];

final List<Map<int, List<String>>> _alters = [
  i0.ProductQuery.alter,
  i1.ClientQuery.alter,
  i2.CategoryQuery.alter,
  i3.CatQuery.alter,
  i4.BillQuery.alter,
  i5.BillMQuery.alter,
  i6.BillDetailQuery.alter
];

Future<Database> $configSql([
  RootIsolateToken? token,
  List<MigrationModel>? migrations,
]) async {
  if (token != null) {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  }
  Directory? documentsDirectory;
  documentsDirectory = await getApplicationDocumentsDirectory();
  assert(documentsDirectory != null, 'directory is empty');
  final path = join(documentsDirectory!.path, 'demo.db');

  Future<void> onUpgrade(Database db, int version, [int? oldVersion]) async {
    if (oldVersion != null) {
      await Future.wait([
        for (final item in _alters)
          for (final e in item.entries)
            if (e.key == version)
              for (final sql in e.value) db.execute(sql),
      ]);
      log('db new alters ok');
      return;
    }
    await Future.wait([
      for (final item in _alters)
        for (final e in item.entries)
          if (e.key <= version)
            for (final sql in e.value) db.execute(sql),
    ]);
    log('db alters init ok');
  }

  final database = await openDatabase(
    path,
    version: 3,
    onOpen: (db) async {
      log('db open');
    },
    onCreate: (Database db, int version) async {
      log('db create');
      await Future.wait([for (final schema in _schemas) db.execute(schema)]);

      if (migrations != null) {
        final mis = await db.rawQuery('select key from Migrations');
        final keys =
            mis.map((e) => e['key'] as String?).whereType<String>().toList();

        final migrationLst = migrations.where(
          (e) => !keys.contains(e.uidKey),
        );
        await Future.wait([
          for (final schema in migrationLst) ...[
            db.rawQuery(schema.sqlInsert),
            db.rawQuery(
                "INSERT INTO Migrations(key) VALUES ('${schema.uidKey}')"),
          ],
        ]);
      }

      log('db end create');

      await onUpgrade(db, version);
    },
    onUpgrade: (db, oldVersion, newVersion) =>
        onUpgrade(db, newVersion, oldVersion),
    onConfigure: (db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    },
  );

  return database;
}

Future<void> $clearDatabase(Database db) => Future.wait([
      db.execute('DELETE * FROM Migrations'),
      i0.ProductQuery.deleteAll(db),
      i1.ClientQuery.deleteAll(db),
      i2.CategoryQuery.deleteAll(db),
      i3.CatQuery.deleteAll(db),
      i4.BillQuery.deleteAll(db),
      i5.BillMQuery.deleteAll(db),
      i6.BillDetailQuery.deleteAll(db),
    ]);
