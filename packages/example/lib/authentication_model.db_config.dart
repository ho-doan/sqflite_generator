// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ConfigGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas, always_put_required_named_parameters_first

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer';
import 'package:flutter/services.dart';

import 'package:example/core/models/comment_link.dart' as i0;

import 'package:example/core/models/comment.dart' as i1;

import 'package:example/core/models/hospital_model.dart' as i2;

import 'package:example/db/models/product.dart' as i3;

import 'package:example/db/models/client.dart' as i4;

import 'package:example/db/models/category.dart' as i5;

import 'package:example/db/models/cat.dart' as i6;

import 'package:example/db/models/bill.dart' as i7;

import 'package:example/authentication_model.dart' as i8;

import 'package:example/authentication_model.dart' as i9;

import 'dart:io';

import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'package:path_provider/path_provider.dart';

final List<String> _schemas = [
  'CREATE TABLE IF NOT EXISTS Migrations(key TEXT PRIMARY KEY)',
  i0.CommentLinkModelQuery.createTable,
  i1.CommentModelQuery.createTable,
  i2.HospitalModelQuery.createTable,
  i3.ProductQuery.createTable,
  i4.ClientQuery.createTable,
  i5.CategoryQuery.createTable,
  i6.CatQuery.createTable,
  i7.BillQuery.createTable,
  i8.BillQuery.createTable,
  i9.BillDetailQuery.createTable
];

final List<Map<int, List<String>>> _alters = [
  i0.CommentLinkModelQuery.alter,
  i1.CommentModelQuery.alter,
  i2.HospitalModelQuery.alter,
  i3.ProductQuery.alter,
  i4.ClientQuery.alter,
  i5.CategoryQuery.alter,
  i6.CatQuery.alter,
  i7.BillQuery.alter,
  i8.BillQuery.alter,
  i9.BillDetailQuery.alter
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
      i0.CommentLinkModelQuery.deleteAll(db),
      i1.CommentModelQuery.deleteAll(db),
      i2.HospitalModelQuery.deleteAll(db),
      i3.ProductQuery.deleteAll(db),
      i4.ClientQuery.deleteAll(db),
      i5.CategoryQuery.deleteAll(db),
      i6.CatQuery.deleteAll(db),
      i7.BillQuery.deleteAll(db),
      i8.BillQuery.deleteAll(db),
      i9.BillDetailQuery.deleteAll(db),
    ]);
