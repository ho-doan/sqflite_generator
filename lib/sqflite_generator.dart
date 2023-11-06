library sqflite_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/sqflite_model_builder.dart';

Builder sqfliteModelBuilder(BuilderOptions options) =>
    SharedPartBuilder([SqfliteModelGenerator()], 'sqflite_model_builder');
