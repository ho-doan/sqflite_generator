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
      ..fields.add(
        Field(
          (f) {
            f
              ..name = 'createTable'
              ..type = refer('String')
              ..assignment = Code("""'''${entity.rawCreateTable}'''""")
              ..static = true;
          },
        ),
      );

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      extensionBuilder.build().accept(emitter),
      // for (final s in lstClassBuilder) s.accept(emitter),
      // functionFromJsonBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
