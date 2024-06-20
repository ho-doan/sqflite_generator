import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';
import 'package:sqflite_generator/src/annotation_builder/property.dart';

import 'annotation_builder/entity.dart';

const _analyzerIgnores = '// ignore_for_file: lines_longer_than_80_chars, '
    'prefer_relative_imports, directives_ordering, require_trailing_commas';

class SqfliteModelGenerator extends GeneratorForAnnotation<Entity> {
  final _parsedElementCheckSet = <ClassElement>{};
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) return;

    if (_parsedElementCheckSet.contains(element)) return null;
    _parsedElementCheckSet.add(element);

    final entity = AEntity.of(element)!;

    final classSelectBuilder = Class(
      (c) => c
        ..name = entity.selectClassName
        ..fields.addAll(entity.selectFields)
        ..constructors.add(
          Constructor((c) => c
            ..constant = true
            ..optionalParameters.addAll(entity.fieldOptionalArgs)),
        )
        ..methods.add(
          Method((m) => m
            ..name = '\$check'
            ..returns = refer('bool')
            ..lambda = true
            ..body = Code(entity.$check.join('||'))
            ..type = MethodType.getter),
        ),
    );
    final classWhereBuilder = Class(
      (c) => c
        ..name = entity.whereClassName
        ..fields.addAll(entity.whereFields)
        ..constructors.add(
          Constructor((c) => c
            ..constant = true
            ..optionalParameters.addAll(entity.fieldOptionalArgs)),
        ),
    );

    final extensionBuilder = ExtensionBuilder()
      ..name = entity.extensionName
      ..on = refer(entity.className)
      ..fields.addAll([
        Field(
          (f) => f
            ..name = 'createTable'
            ..type = refer('String')
            ..assignment = Code("""'''${entity.rawCreateTable}'''""")
            ..static = true,
        ),
        Field(
          (f) => f
            ..name = entity.defaultSelectClass
            ..type = refer(entity.selectClassName)
            ..assignment = Code('''${entity.selectClassName}(${[
              for (final e in entity.aPs)
                if (e is AForeignKey)
                  '${e.nameDefault}: ${e.entityParent?.className}Query.${entity.defaultSelectClass}'
                else
                  '${e.nameDefault}: true'
            ].join(',')})''')
            ..modifier = entity.aPs.any(
                    (e) => e.dartType.toString().contains(entity.className))
                ? FieldModifier.final$
                : FieldModifier.constant
            ..static = true,
        ),
      ])
      ..methods.addAll([
        Method((m) => m
          ..name = '\$createSelect'
          ..lambda = true
          ..static = true
          ..body = Code('''select?.\$check ==true?
                  ${[
            for (final e in entity.aPs)
              if (e is AForeignKey)
                '${e.entityParent?.className}Query.\$createSelect(select?.${e.nameDefault}, ${e.subSelect})'
              else
                'if(select?.${e.nameDefault}??false) ${e.selectField()}'
          ]}
                .join(','):\$createSelect(${entity.defaultSelectClass})''')
          ..requiredParameters.addAll([
            entity.selectArgs,
          ])
          ..optionalParameters.add(entity.selectChildArgs)
          ..returns = refer('String')),
        Method((m) => m
          ..name = '\$createWhere'
          ..lambda = true
          ..static = true
          ..body = Code('''
                  ${[
            for (final e in entity.aPs)
              if (e is AForeignKey)
                '${e.entityParent?.className}Query.\$createWhere(where?.${e.nameDefault}, ${e.subSelect})'
              else
                'if(where?.${e.nameDefault}!=null) ${e.whereField}'
          ]}
                .join(' AND ').whereStr''')
          ..requiredParameters.addAll([
            entity.whereArgs,
          ])
          ..optionalParameters.add(entity.selectChildArgs)
          ..returns = refer('String')),
        Method((m) => m
          ..name = 'getAll'
          ..lambda = true
          ..static = true
          ..modifier = MethodModifier.async
          ..body = Code(entity.rawGetAll)
          ..requiredParameters.add(entity.databaseArgs)
          ..optionalParameters.addAll([
            entity.selectArgs,
            entity.whereArgs,
          ])
          ..returns = refer('Future<List<${entity.className}>>')),
        Method((m) => m
          ..name = 'insert'
          ..modifier = MethodModifier.async
          ..body = Code(entity.rawInsert())
          ..requiredParameters.addAll([entity.databaseArgs])
          ..returns = refer('Future<int>')),
        Method((m) => m
          ..name = 'update'
          ..modifier = MethodModifier.async
          ..body = Code(entity.rawUpdate().join('\n'))
          ..requiredParameters.addAll([entity.databaseArgs])
          ..returns = refer('Future<int>')),
        Method((m) => m
          ..name = 'getById'
          ..modifier = MethodModifier.async
          ..static = true
          ..body = Code(entity.rawFindOne)
          ..requiredParameters
              .addAll([entity.databaseArgs, ...entity.keysRequiredArgs])
          ..optionalParameters.addAll([entity.selectArgs])
          ..returns = refer('Future<${entity.className}?>')),
        Method((m) => m
          ..name = 'delete'
          ..modifier = MethodModifier.async
          ..body = Code(entity.delete(false))
          ..requiredParameters.addAll([
            entity.databaseArgs,
          ])
          ..returns = refer('Future<void>')),
        Method((m) => m
          ..name = 'deleteById'
          ..modifier = MethodModifier.async
          ..static = true
          ..body = Code(entity.delete(true))
          ..requiredParameters
              .addAll([entity.databaseArgs, ...entity.keysRequiredArgs])
          ..returns = refer('Future<void>')),
        Method((m) => m
          ..name = 'deleteAll'
          ..modifier = MethodModifier.async
          ..static = true
          ..body = Code(
            'await database.rawDelete(\'\'\'${entity.deleteAll}\'\'\');',
          )
          ..requiredParameters.addAll([entity.databaseArgs])
          ..returns = refer('Future<void>')),
        Method((m) => m
          ..name = '\$fromDB'
          ..lambda = true
          ..static = true
          ..body = Code('${entity.className}(${entity.rawFromDB})')
          ..requiredParameters.add(entity.fromArgs)
          ..optionalParameters.add(entity.selectChildArgs)
          ..returns = refer(entity.className)),
        Method((m) => m
          ..name = '\$toDB'
          ..lambda = true
          ..body = Code('{${entity.rawToDB}}')
          ..returns = refer('Map<String,dynamic>')),
      ]);

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      extensionBuilder.build().accept(emitter),
      classSelectBuilder.accept(emitter),
      classWhereBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
