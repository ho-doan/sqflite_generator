import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'album.g.dart';

@entityTest
class Album {
  @primaryKey
  final int albumId;
  final String title;
  // TODO(hodoan): FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int artistId;

  const Album({
    required this.albumId,
    required this.title,
    required this.artistId,
  });

  factory Album.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      AlbumQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
