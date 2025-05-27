import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'track.g.dart';

@entityTest
class Track {
  @primaryKey
  final int trackId;
  final String name;
  // TODO(hodoan): FOREIGN KEY ([AlbumId]) REFERENCES "albums" ([AlbumId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int albumId;
  // TODO(hodoan): FOREIGN KEY ([MediaTypeId]) REFERENCES "media_types" ([MediaTypeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int mediaTypeId;
  // TODO(hodoan): FOREIGN KEY ([GenreId]) REFERENCES "genres" ([GenreId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int genreId;
  final String? composer;
  final int milliseconds;
  final int bytes;
  final double unitPrice;

  const Track({
    required this.trackId,
    required this.name,
    required this.albumId,
    required this.mediaTypeId,
    required this.genreId,
    this.composer,
    required this.milliseconds,
    required this.bytes,
    required this.unitPrice,
  });
  factory Track.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      TrackQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
