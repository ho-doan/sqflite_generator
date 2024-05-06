library sqflite_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/config_builder/config_builder.dart';
import 'src/sqflite_model_builder.dart';

Builder sqfliteModelBuilder(BuilderOptions options) =>
    SharedPartBuilder([SqfliteModelGenerator()], 'sqflite_model_builder');

Builder configBuilder(BuilderOptions options) => LibraryBuilder(
      ConfigGenerator(),
      generatedExtension: '.db_config.dart',
    );
