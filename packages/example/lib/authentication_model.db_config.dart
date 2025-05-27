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

import 'package:example/db/models/new_models/invoice_item.dart' as i1;

import 'package:example/db/models/new_models/invoice.dart' as i2;

import 'package:example/db/models/new_models/customer.dart' as i3;

import 'package:example/db/models/new_models/album.dart' as i4;

import 'package:example/db/models/new_models/track.dart' as i5;

import 'package:example/db/models/new_models/playlist_track.dart' as i6;

import 'package:example/db/models/new_models/artist.dart' as i7;

import 'package:example/db/models/new_models/genre.dart' as i8;

import 'package:example/db/models/new_models/playlist.dart' as i9;

import 'package:example/db/models/new_models/media_type.dart' as i10;

import 'package:example/db/models/new_models/employee.dart' as i11;

import 'package:example/db/models/client.dart' as i12;

import 'package:example/db/models/cat.dart' as i13;

import 'package:example/db/models/bill.dart' as i14;

import 'package:example/authentication_model.dart' as i15;

import 'package:example/authentication_model.dart' as i16;

import 'dart:io';

import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'package:path_provider/path_provider.dart';

final List<String> _schemas = [
  'CREATE TABLE IF NOT EXISTS Migrations(key TEXT PRIMARY KEY)',
  i0.ProductQuery.createTable,
  i1.InvoiceItemQuery.createTable,
  i2.InvoiceQuery.createTable,
  i3.CustomerQuery.createTable,
  i4.AlbumQuery.createTable,
  i5.TrackQuery.createTable,
  i6.PlaylistTrackQuery.createTable,
  i7.ArtistQuery.createTable,
  i8.GenreQuery.createTable,
  i9.PlaylistQuery.createTable,
  i10.MediaTypeQuery.createTable,
  i11.EmployeeQuery.createTable,
  i12.ClientQuery.createTable,
  i13.CatQuery.createTable,
  i14.BillQuery.createTable,
  i15.BillMQuery.createTable,
  i16.BillDetailQuery.createTable
];

final List<Map<int, List<String>>> _alters = [
  i0.ProductQuery.alter,
  i1.InvoiceItemQuery.alter,
  i2.InvoiceQuery.alter,
  i3.CustomerQuery.alter,
  i4.AlbumQuery.alter,
  i5.TrackQuery.alter,
  i6.PlaylistTrackQuery.alter,
  i7.ArtistQuery.alter,
  i8.GenreQuery.alter,
  i9.PlaylistQuery.alter,
  i10.MediaTypeQuery.alter,
  i11.EmployeeQuery.alter,
  i12.ClientQuery.alter,
  i13.CatQuery.alter,
  i14.BillQuery.alter,
  i15.BillMQuery.alter,
  i16.BillDetailQuery.alter
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
      i1.InvoiceItemQuery.deleteAll(db),
      i2.InvoiceQuery.deleteAll(db),
      i3.CustomerQuery.deleteAll(db),
      i4.AlbumQuery.deleteAll(db),
      i5.TrackQuery.deleteAll(db),
      i6.PlaylistTrackQuery.deleteAll(db),
      i7.ArtistQuery.deleteAll(db),
      i8.GenreQuery.deleteAll(db),
      i9.PlaylistQuery.deleteAll(db),
      i10.MediaTypeQuery.deleteAll(db),
      i11.EmployeeQuery.deleteAll(db),
      i12.ClientQuery.deleteAll(db),
      i13.CatQuery.deleteAll(db),
      i14.BillQuery.deleteAll(db),
      i15.BillMQuery.deleteAll(db),
      i16.BillDetailQuery.deleteAll(db),
    ]);
