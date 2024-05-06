import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

const TypeChecker _typeChecker = TypeChecker.fromRuntime(Entity);

class ConfigImportBuilder implements Generator {
  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final allDepsInStep = <ModelConfigGen>[];

    for (final cl in library.classes) {
      if (_typeChecker.hasAnnotationOfExact(cl)) {
        final libs = await buildStep.resolver.libraries.toList();
        allDepsInStep.add(await ModelConfigGen.fromLibs(libs, cl));
      }
    }
    if (allDepsInStep.isNotEmpty) {
      return jsonEncode(allDepsInStep.map((e) => e.toMap()).toList());
    }
    return null;
  }

  ConfigImportBuilder(Map options) {
    // if (options['class_name_pattern'] != null) {
    // _classNameMatcher = RegExp(options['class_name_pattern']);
    // }
  }
}

class ModelConfigGen {
  final String name;
  final List<String> imports;

  ModelConfigGen({
    required this.name,
    required this.imports,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'imports': imports,
      };

  factory ModelConfigGen.fromJson(dynamic json) => ModelConfigGen(
        name: json['name'] as String,
        imports: (json['imports'] as List).cast<String>(),
      );

  static Future<ModelConfigGen> fromLibs(
      List<LibraryElement> libs, ClassElement cl) async {
    final s =
        libs.where((e) => e.exportNamespace.definedNames.values.contains(cl));
    return ModelConfigGen(
      name: cl.displayName,
      imports: s.map((e) => e.identifier).toList(),
    );
  }
}
