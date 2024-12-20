import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'authentication_model.db_config.dart';

part 'authentication_model.g.dart';

const defaultVersion = 1;
const version2 = 2;
const version3 = 3;

@SqlConfig('demo.db', version: version3)
Future<Database> configSql([
  RootIsolateToken? token,
  List<MigrationModel>? migrations,
]) =>
    $configSql(token, migrations);

@entity
class BillM extends EntityQuery {
  final String name;

  @ForeignKey(name: 'BillDetail')
  final List<BillDetail> details;

  const BillM({
    this.key,
    required this.name,
    this.details = const [],
    this.memos = const [],
  });

  factory BillM.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      BillMQuery.$fromDB(json, lst, childName);

  @primaryKey
  final int? key;

  @Deprecated('not using when db version 3')
  @Column(
    converter: StringListConverter(),
    version: version2,
    alters: [
      AlterDB(version: version2, type: AlterType.add),
      AlterDB(version: version3, type: AlterType.drop),
    ],
  )
  final List<String> memos;

  Map<String, dynamic> toDB() => $toDB();
}

class StringListConverter extends ColumnDBConverter<List<String>> {
  const StringListConverter();
  @override
  List<String> fromJson(String? value) => value?.split(',') ?? [];

  @override
  String toJson(value) => value.join(',');
}

@entity
class BillDetail extends EntityQuery {
  final String name;

  @ForeignKey(name: 'BillM')
  final BillM? parent;

  const BillDetail({
    this.key,
    required this.name,
    this.parent,
  });

  factory BillDetail.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      BillDetailQuery.$fromDB(json, lst, childName);

  @primaryKey
  final int? key;
  Map<String, dynamic> toDB() => $toDB();
}
