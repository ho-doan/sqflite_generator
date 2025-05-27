import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'media_type.g.dart';

@entityTest
class MediaType {
  @primaryKey
  final int mediaTypeId;
  final String name;

  const MediaType({required this.mediaTypeId, required this.name});

  factory MediaType.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      MediaTypeQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
