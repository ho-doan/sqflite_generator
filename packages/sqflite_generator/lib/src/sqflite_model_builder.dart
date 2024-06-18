import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';

import 'annotation_builder/entity.dart';

const _analyzerIgnores = '// ignore_for_file: lines_longer_than_80_chars, '
    'prefer_relative_imports, directives_ordering, require_trailing_commas';

class SqfliteModelGenerator extends GeneratorForAnnotation<Entity> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) return;

    final entity = AEntity.fromElement(element);

    final classSelectBuilder = Class(
      (c) => c
        ..name = '\$${entity.className}SelectArgs'
        ..fields.addAll([
          for (final item in entity.aPs)
            Field(
              (f) => f
                ..name = item.nameDefault
                ..modifier = FieldModifier.final$
                ..type = refer(item is AForeignKey
                    ? '\$${item.entityParent.className}SelectArgs?'
                    : 'bool?'),
            ),
        ])
        ..constructors.add(Constructor((c) => c
          ..constant = true
          ..optionalParameters.addAll([
            for (final item in entity.aPs)
              Parameter(
                (f) => f
                  ..name = item.nameDefault
                  ..named = true
                  ..required = false
                  ..toThis = true,
              ),
          ])))
        ..methods.add(
          Method((m) => m
            ..name = '\$check'
            ..returns = refer('bool')
            ..lambda = true
            ..body = Code([
              for (final item in entity.aPs)
                item is AForeignKey
                    ? '${item.nameDefault}?.\$check == true'
                    : '${item.nameDefault} == true'
            ].join('||'))
            ..type = MethodType.getter),
        ),
    );
    final classWhereBuilder = Class(
      (c) => c
        ..name = '\$${entity.className}WhereArgs'
        ..fields.addAll([
          for (final item in entity.aPs)
            Field(
              (f) => f
                ..name = item.nameDefault
                ..modifier = FieldModifier.final$
                ..type = refer(item is AForeignKey
                    ? '\$${item.entityParent.className}WhereArgs?'
                    : '${item.dartType.toString().replaceFirst('?', '')}?'),
            )
        ])
        ..constructors.add(Constructor((c) => c
          ..constant = true
          ..optionalParameters.addAll([
            for (final item in entity.aPs)
              Parameter(
                (f) => f
                  ..name = item.nameDefault
                  ..named = true
                  ..toThis = true
                  ..required = false,
              )
          ]))),
    );

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
              ..modifier = FieldModifier.final$
              ..assignment = Code(
                  """'''${entity.rawFindAll('\${\$createSelect(\$default)}')}'''""")
              ..static = true;
          },
        ),
        Field(
          (f) {
            f
              ..name = '\$default'
              ..type = refer('\$${entity.className}SelectArgs')
              ..assignment = Code('''\$${entity.className}SelectArgs(${[
                for (final e in entity.aPs)
                  if (e is AForeignKey)
                    '${e.nameDefault}: ${e.entityParent.className}Query.\$default'
                  else
                    '${e.nameDefault}: true'
              ].join(',')})''')
              ..modifier = FieldModifier.constant
              ..static = true;
          },
        ),
      ])
      ..methods.addAll([
        Method((m) {
          m
            ..name = '\$createSelect'
            ..lambda = true
            ..static = true
            ..body = Code('''args?.\$check ==true?
                  ${[
              for (final e in entity.aPs)
                if (e is AForeignKey)
                  '${e.entityParent.className}Query.\$createSelect(args?.${e.nameDefault})'
                else
                  'if(args?.${e.nameDefault}??false) \'${e.className.toSnakeCase()}.${e.nameToDB} as ${e.nameFromDB}\''
            ]}
                .join(','):\$createSelect(\$default)''')
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'args'
                  ..type = refer('\$${entity.className}SelectArgs?'),
              ),
            ])
            ..returns = refer('String');
        }),
        Method((m) {
          m
            ..name = 'getAll'
            ..lambda = true
            ..static = true
            ..modifier = MethodModifier.async
            ..body = Code(
                '(await database.rawQuery(select!=null?\$createSelect(select): ${entity.extensionName}._selectAll) as List<Map>)'
                '.map(${entity.className}.fromDB).toList()')
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = 'database'
                  ..type = refer('Database'),
              ),
            )
            ..optionalParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'select'
                  ..type = refer('\$${entity.className}SelectArgs?')
                  ..named = true
                  ..required = false,
              ),
            ])
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
            ])
            ..returns = refer('Future<int>');
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
                'final res = (await database.rawQuery(\'\'\'${entity.rawFindOne('\${\$createSelect(select)}')}\'\'\',[id]) as List<Map>);'
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
            ..optionalParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'select'
                  ..type = refer('\$${entity.className}SelectArgs?')
                  ..named = true
                  ..required = false,
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
              '[${entity.primaryKeys.map((e) => e.nameDefault).join(',')}]);',
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
            ..name = 'deleteById'
            ..modifier = MethodModifier.async
            ..static = true
            ..body = Code(
              'await database.rawQuery(\'\'\'${entity.delete}\'\'\','
              '[${entity.primaryKeys.map((e) => e.nameDefault).join(',')}]);',
            )
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'database'
                  ..type = refer('Database'),
              ),
              for (final key in entity.primaryKeys)
                Parameter(
                  (p) => p
                    ..name = key.nameDefault
                    ..type = refer(key.dartType.toString()),
                ),
            ])
            ..returns = refer('Future<void>');
        }),
        Method((m) {
          m
            ..name = 'deleteAll'
            ..modifier = MethodModifier.async
            ..static = true
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
      classSelectBuilder.accept(emitter),
      classWhereBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
