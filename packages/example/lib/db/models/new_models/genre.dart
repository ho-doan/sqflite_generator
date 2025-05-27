import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'genre.g.dart';

@entityTest
class Genre {
  @primaryKey
  final int genreId;
  final String name;

  const Genre({required this.genreId, required this.name});
  factory Genre.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      GenreQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
