import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'annotation_builder/entity.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class SqfliteModelGenerator extends GeneratorForAnnotation<Entity> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) return;

    final entity = AEntity.fromElement(element);

    final extensionBuilder = ExtensionBuilder()
      ..name = entity.extensionName
      ..on = refer(entity.className)
      ..fields.addAll([
        Field(
          (f) {
            f
              ..name = 'createTable'
              ..type = refer('String')
              ..assignment = Code("""'''${entity.rawCreateTable}'''""")
              ..static = true;
          },
        ),
        Field(
          (f) {
            f
              ..name = '_selectAll'
              ..type = refer('String')
              ..assignment = Code("""'''${entity.rawFindAll}'''""")
              ..modifier = FieldModifier.constant
              ..static = true;
          },
        ),
      ])
      ..methods.addAll([
        Method((m) {
          m
            ..name = 'getAll'
            ..lambda = true
            ..modifier = MethodModifier.async
            ..body = Code(
                '(await database.rawQuery(${entity.extensionName}._selectAll) as List<Map>)'
                '.map(${entity.className}.fromJson).toList()')
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = 'database'
                  ..type = refer('Database'),
              ),
            )
            ..returns = refer('Future<List<${entity.className}>>');
        }),
        Method((m) {
          m
            ..name = 'insert'
            ..modifier = MethodModifier.async
            ..body = Code(entity.rawInsert())
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'database'
                  ..type = refer('Database'),
              ),
              Parameter(
                (p) => p
                  ..name = 'model'
                  ..type = refer(entity.className),
              ),
            ])
            ..returns = refer('Future<void>');
        }),
        Method((m) {
          m
            ..name = '\$fromJson'
            ..lambda = true
            ..static = true
            ..docs.add('// TODO(hodoan): convert value')
            ..body = Code('${entity.className}(${entity.rawFromJson})')
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = 'json'
                  ..type = refer('Map'),
              ),
            )
            ..returns = refer(entity.className);
        }),
        Method((m) {
          m
            ..name = '\$toJson'
            ..docs.add('// TODO(hodoan): convert value')
            ..lambda = true
            ..body = Code('{${entity.rawToJson}}')
            ..returns = refer('Map<String,dynamic>');
        }),
      ]);

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      extensionBuilder.build().accept(emitter),
    ].join('\n\n'));
  }
}
