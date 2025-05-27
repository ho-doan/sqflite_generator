import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'playlist.g.dart';

@entityTest
class Playlist {
  @primaryKey
  final int playlistId;
  final String name;
  const Playlist({required this.playlistId, required this.name});

  factory Playlist.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      PlaylistQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
