import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/column.dart';
import 'package:sqflite_generator/src/annotation_builder/property.dart';

import 'annotation_builder/entity.dart';

class SqfliteModelGenerator extends GeneratorForAnnotation<Entity> {
  final _parsedElementCheckSet = <ClassElement>{};
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) return;

    if (_parsedElementCheckSet.contains(element)) return null;
    _parsedElementCheckSet.add(element);

    final entity = AEntity.of(element, [])!;

    final classSetBuilder = Class(
      (c) => c
        ..name = entity.setClassName
        ..types.add(refer('T'))
        ..extend = refer('WhereModel<T>')
        ..fields.addAll(entity.setFields)
        ..constructors.add(
          Constructor((c) => c
            ..constant = true
            ..initializers.add(Code('super(field: \'\$model.\$name\')'))
            // ..body = Code('super(field: \'\$model.\$name\')')
            ..optionalParameters.addAll(entity.setOptionalArgs)),
        ),
    );

    final classBuilderList = <Class>[];
    final classBuilderListExtends = <(String, Class)>[];

    for (final e in entity.primaryKeys) {
      // lever 1
      if (e.entityParent != null) {
        classBuilderList.addAll(
          [
            Class(
              (c) => c
                ..name = '_\$\$${e.entityParent!.setClassName}'
                ..types.add(refer('T'))
                ..extend = refer('${entity.setClassName}<T>')
                ..constructors.add(
                  Constructor(
                    (c) => c
                      ..constant = true
                      ..optionalParameters.addAll(entity.setOptionalArgsChild),
                  ),
                ),
            ),
          ],
        );
        classBuilderListExtends.add(
          (
            e.nameDefault,
            Class(
              (c) => c
                ..name = '_\$${e.entityParent!.setClassName}'
                ..methods.addAll(
                  [
                    for (final item in e.entityParent!.allss())
                      Method(
                        (f) => f
                          ..name = (item.$1.sublist(1)).join('_').toCamelCase()
                          ..returns = refer(
                              '_\$\$${e.entityParent!.setClassName}<${item.$2.typeSelect}>')
                          ..docs.addAll([
                            if (item.$2 is AColumn &&
                                item.$2.alters
                                    .any((e) => e.type == AlterTypeGen.drop))
                              '@Deprecated(\'no such column\')'
                          ])
                          ..docs.addAll([
                            '// $item',
                          ])
                          ..lambda = true
                          ..type = MethodType.getter
                          ..body = Code(
                              '''const _\$\$${e.entityParent!.setClassName}(
                            name: '${item.$2.nameToDB}',
                            nameCast: '${[
                            ...item.$1.sublist(0, item.$1.length - 1),
                            item.$2.nameToDB
                          ].join('_').toSnakeCase()}',
                            model: '${item.$1.sublist(0, item.$1.length - 1).join('_').toSnakeCase()}',
                            )'''),
                      ),
                  ],
                )
                ..constructors.add(
                  Constructor((c) => c..constant = true),
                ),
            )
          ),
        );
      }
    }

    final extensionBuilder = ExtensionBuilder()
      ..name = entity.extensionName
      ..on = refer(entity.classType)
      ..fields.addAll([
        for (final e in classBuilderListExtends)
          Field(
            (f) => f
              ..name = e.$1
              ..type = refer(e.$2.name)
              ..assignment = Code('${e.$2.name}()')
              ..modifier = FieldModifier.constant
              ..static = true,
          ),
        Field(
          (f) => f
            ..name = 'createTable'
            ..type = refer('String')
            ..assignment = Code("""'''${entity.rawCreateTable()}'''""")
            ..modifier = FieldModifier.constant
            ..static = true,
        ),
        Field(
          (f) => f
            ..name = 'debug'
            ..type = refer('String')
            ..assignment = Code("""'''${entity.rawDebug()}'''""")
            ..modifier = FieldModifier.constant
            ..static = true,
        ),
        Field(
          (f) => f
            ..name = 'alter'
            ..type = refer('Map<int,List<String>>')
            ..assignment = Code("""${entity.rawAlterTable}""")
            ..modifier = FieldModifier.constant
            ..static = true,
        ),
        for (final item in entity.allss())
          Field(
            (f) => f
              ..name = (item.$1.sublist(1)).join('_').toCamelCase()
              ..type = refer('${entity.setClassName}<${item.$2.typeSelect}>')
              ..docs.addAll([
                if (item.$2 is AColumn &&
                    item.$2.alters.any((e) => e.type == AlterTypeGen.drop))
                  '@Deprecated(\'no such column\')'
              ])
              ..docs.addAll([
                '// $item',
              ])
              ..assignment = Code('''${entity.setClassName}(
              name: '${item.$2.nameToDB}',
              nameCast: '${[
                ...item.$1.sublist(0, item.$1.length - 1),
                item.$2.nameToDB
              ].join('_').toSnakeCase()}',
              model: '${item.$1.sublist(0, item.$1.length - 1).join('_').toSnakeCase()}',
              )''')
              ..modifier = FieldModifier.constant
              ..static = true,
          ),
        Field(
          (f) => f
            ..name = entity.defaultSelectClass
            ..type = refer('Set<${entity.setClassName}>')
            ..assignment = Code('''{${[
              for (final e in entity.allss())
                if (!(e.$2 is AColumn &&
                    e.$2.alters.any((e) => e.type == AlterTypeGen.drop)))
                  '${entity.extensionName}.${e.$1.sublist(1).join('_').toCamelCase()}'
            ].join(',')},}''')
            ..static = true,
        ),
      ])
      ..methods.addAll([
        Method(
          (m) => m
            ..name = '\$createSelect'
            ..lambda = true
            ..static = true
            ..body = Code('''((select??{}).isEmpty ? \$default : select!)
            .map((e)=>'\$childName\${e.model}.\${e.name} as \${e.nameCast}')
            .join(',')''')
            ..requiredParameters.addAll([
              entity.selectArgs,
            ])
            ..optionalParameters.add(entity.selectChildArgs)
            ..returns = refer('String'),
        ),
        Method((m) => m
          ..name = 'getAll'
          ..static = true
          ..modifier = MethodModifier.async
          ..body = Code(entity.rawGetAll)
          ..requiredParameters.add(entity.databaseArgs)
          ..optionalParameters.addAll([
            entity.selectArgs,
            entity.whereArgs,
            entity.whereOrArgs,
            entity.orderByArgs,
            entity.limitArgs,
            entity.offsetArgs,
          ])
          ..returns = refer('Future<List<${entity.classType}>>')),
        Method((m) => m
          ..name = 'top'
          ..static = true
          ..lambda = true
          ..body = Code(entity.topSelect)
          ..requiredParameters.add(entity.databaseArgs)
          ..optionalParameters.addAll([
            entity.selectArgs,
            entity.whereArgs,
            entity.whereOrArgs,
            entity.orderByArgs,
            entity.topArgs,
          ])
          ..returns = refer('Future<List<${entity.classType}>>')),
        Method((m) => m
          ..name = 'count'
          ..static = true
          ..modifier = MethodModifier.async
          ..body = Code(entity.countSelect)
          ..requiredParameters.add(entity.databaseArgs)
          ..returns = refer('Future<int>')),
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
          ..returns = refer('Future<${entity.classType}?>')),
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
          ..body = Code('${entity.classType}(${entity.rawFromDB})')
          ..requiredParameters.addAll([entity.fromArgs, entity.fromArgsList])
          ..optionalParameters.add(entity.selectChildArgs)
          ..returns = refer(entity.classType)),
        Method((m) => m
          ..name = '\$toDB'
          ..lambda = true
          ..body = Code('{${entity.rawToDB}}')
          ..returns = refer('Map<String,dynamic>')),
      ]);

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      '// ignore_for_file: library_private_types_in_public_api',
      extensionBuilder.build().accept(emitter),
      classSetBuilder.accept(emitter),
      ...classBuilderList.map((e) => e.accept(emitter)),
      ...classBuilderListExtends.map((e) => e.$2.accept(emitter)),
    ].join('\n\n'));
  }
}
