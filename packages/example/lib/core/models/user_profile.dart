import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart'; // Updated import

part 'user_profile.g.dart'; // Keep this for code generation

@entity
class UserProfile {
  @primaryKeyNoIncrement
  // TODO(hodoan): Check FK
  final int userNo; // UserNo, set as primary key
  final String? name; // Name
  final int? photoId; // PhotoId
  final String? greeting; // Greeting
  final int stampDate; // StampDate
  final int stampTime; // StampTime

  UserProfile({
    required this.userNo,
    this.name,
    this.photoId,
    this.greeting,
    required this.stampDate,
    required this.stampTime,
  });

  // Factory constructor for creating an instance from DB
  factory UserProfile.fromDB(
    Map<dynamic, dynamic> json,
    List<Map<dynamic, dynamic>> lst, [
    String childName = '',
  ]) =>
      UserProfileQuery.$fromDB(json, lst, childName);

  // Method to convert instance back to DB format (Map)
  Map<String, dynamic> toDB() => $toDB();
}
