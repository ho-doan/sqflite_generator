import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
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
            ..static = true
            ..modifier = MethodModifier.async
            ..body = Code(
                '(await database.rawQuery(${entity.extensionName}._selectAll) as List<Map>)'
                '.map(${entity.className}.fromDB).toList()')
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
            ])
            ..returns = refer('Future<int>');
        }),
        Method((m) {
          m
            ..name = 'update'
            ..modifier = MethodModifier.async
            ..body = Code(entity.rawUpdate().join('\n'))
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
          final t = entity.primaryKeys.first;
          final c = entity.foreignKeys.firstWhereOrNull(
            (e) => e.nameDefault == t.nameDefault,
          );
          final type = c?.entityParent.primaryKeys.first.dartType.toString() ??
              t.dartType.toString();
          m
            ..name = 'getById'
            ..modifier = MethodModifier.async
            ..static = true
            ..body = Code(
                'final res = (await database.rawQuery(\'\'\'${entity.rawFindOne}\'\'\',[id]) as List<Map>);'
                'return res.isNotEmpty? ${entity.className}.fromDB(res.first):null;')
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'database'
                  ..type = refer('Database'),
              ),
              Parameter(
                (p) => p
                  ..name = 'id'
                  ..type = refer(type),
              ),
            ])
            ..returns = refer('Future<${entity.className}?>');
        }),
        Method((m) {
          m
            ..name = 'delete'
            ..modifier = MethodModifier.async
            ..body = Code(
              'await database.rawQuery(\'\'\'${entity.delete}\'\'\','
              '[${entity.primaryKeys.map((e) => 'model.${e.nameDefault}').join(',')}]);',
            )
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
            ..name = 'deleteAll'
            ..modifier = MethodModifier.async
            ..body = Code(
              'await database.rawDelete(\'\'\'${entity.deleteAll}\'\'\');',
            )
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'database'
                  ..type = refer('Database'),
              ),
            ])
            ..returns = refer('Future<void>');
        }),
        Method((m) {
          m
            ..name = '\$fromDB'
            ..lambda = true
            ..static = true
            ..body = Code('${entity.className}(${entity.rawFromDB})')
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
            ..name = '\$toDB'
            ..lambda = true
            ..body = Code('{${entity.rawToDB}}')
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
