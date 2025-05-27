import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'artist.g.dart';

@entityTest
class Artist {
  @primaryKey
  final int artistId;
  final String name;

  const Artist({required this.artistId, required this.name});

  factory Artist.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      ArtistQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
