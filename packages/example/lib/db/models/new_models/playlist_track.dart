import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'playlist_track.g.dart';

@entityTest
class PlaylistTrack {
  @primaryKey
  // TODO(hodoan): FOREIGN KEY ([PlaylistId]) REFERENCES "playlists" ([PlaylistId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int playlistId;
  @primaryKey
  // TODO(hodoan): FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId]) ON DELETE NO ACTION ON UPDATE NO ACTION
  final int trackId;

  const PlaylistTrack({required this.playlistId, required this.trackId});

  factory PlaylistTrack.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      PlaylistTrackQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
