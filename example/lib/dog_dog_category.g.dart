// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_dog_category.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file:

extension DogDogCategoryQuery on DogDogCategory {
  static String createTable =
      '''CREATE TABLE IF NOT EXISTS DogDogCategory(dogId INTEGER,
dogCategoryId INTEGER NOT NULL,
created INTEGER,
task TEXT,
name TEXT NOT NULL,
PRIMARY KEY(dogId,dogCategoryId),
FOREIGN KEY Dog* on dogId NO ACTION NO ACTION,
FOREIGN KEY DogCategory* on dogCategoryId NO ACTION NO ACTION)''';
}
