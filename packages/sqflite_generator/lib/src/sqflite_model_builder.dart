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

    final entity = AEntity.of(
        element,
        APropertyArgs(
          parentClassNames: [],
          fieldNames: [],
          step: 0,
        ),
        [])!;

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

    final fieldList = <Field>[];

    generatorListClass(
      entity,
      entity,
      classBuilderList,
      classBuilderListExtends,
      fieldList,
    );
    generatorListClassFore(
      entity,
      entity,
      classBuilderList,
      classBuilderListExtends,
      fieldList,
    );

    final extensionBuilder = ExtensionBuilder()
      ..name = entity.extensionName
      ..on = refer(entity.classType)
      ..fields.addAll([
        ...fieldList,
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
            ..docs.add('// TODO(hodoan): check')
            ..assignment = Code("""${entity.rawAlterTable}""")
            ..modifier = FieldModifier.constant
            ..static = true,
        ),
        for (final item in entity.allsss())
          Field(
            (f) => f
              ..name = item.args.fieldNames.join('_').toCamelCase()
              ..type = refer('${entity.setClassName}<${item.typeSelect}>')
              ..docs.addAll([
                if (item is AColumn &&
                    item.alters.any((e) => e.type == AlterTypeGen.drop))
                  '@Deprecated(\'no such column\')'
              ])
              ..assignment = Code('''${entity.setClassName}(
              name: '${item.args.fieldNames.join('_').toSnakeCase()}',
              nameCast: '${[
                item.args.parentClassNames.first,
                ...item.args.fieldNames
              ].join('_').toSnakeCase()}',
              model: '${item.args.parentClassNames.first.toSnakeCase()}',
              )''')
              ..modifier = FieldModifier.constant
              ..static = true,
          ),
        Field(
          (f) => f
            ..name = entity.defaultSelectClass
            ..type = refer('Set<${entity.setClassName}>')
            ..assignment = Code('''{${[
              for (final e in entity.allsss())
                if (!(e is AColumn &&
                    e.alters.any((e) => e.type == AlterTypeGen.drop)))
                  '${entity.extensionName}.${e.args.fieldNames.join('_').toCamelCase()}',
              for (final f in fieldList)
                // for (final aExtend in classBuilderListExtends)
                for (final field in (classBuilderListExtends
                    .firstWhere((e) => e.$2.name == f.type?.symbol)).$2.methods)
                  '${entity.extensionName}.${f.name}.${field.name}'
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
            ..docs.add('// TODO(hodoan): check')
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
          ..docs.add('// TODO(hodoan): check')
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
          ..docs.add('// TODO(hodoan): check primary keys auto')
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
          ..docs.add('// TODO(hodoan): check')
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

void generatorListClass(
  AEntity entity,
  AEntity parent,
  List<Class> classBuilderList,
  List<(String, Class)> classBuilderListExtends,
  List<Field> fieldList, [
  List<String> nameDefaults = const [],
]) {
  if (nameDefaults.length > 9 / 3) return;
  for (final e in entity.primaryKeys) {
    if (e.entityParent != null) {
      final name = '_\$${e.entityParent!.setClassName}';
      final name2 = '_\$\$${e.entityParent!.setClassName}';
      final classExistIndex = classBuilderList.indexWhere(
        (c) => c.name == name2,
      );

      if (classExistIndex == -1) {
        classBuilderList.addAll(
          [
            Class(
              (c) => c
                ..name = name2
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
                ..name = name
                ..methods.addAll(
                  [
                    for (final item in e.entityParent!
                        .allssForChild2(parent, nameDefaults.length + 1))
                      Method(
                        (f) => f
                          ..name = item.args.fieldNames
                              .sublist(1)
                              .join('_')
                              .toCamelCase()
                          ..returns = refer('$name2<${item.typeSelect}>')
                          ..docs.addAll([
                            if (item is AColumn &&
                                item.alters
                                    .any((e) => e.type == AlterTypeGen.drop))
                              '@Deprecated(\'no such column\')'
                          ])
                          ..lambda = true
                          ..type = MethodType.getter
                          ..body = Code('''const $name2(
                            name: '${item.nameToDB}',
                            nameCast: '${[
                            ...item.args.parentClassNames
                                .sublist(nameDefaults.length + 1),
                            item.nameToDB
                          ].join('_').toSnakeCase()}',
                            model: '${item.args.parentClassNames.sublist(nameDefaults.length + 1).join('_').toSnakeCase()}',
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

      fieldList.add(
        Field(
          (f) => f
            ..name = '${[
              ...nameDefaults,
              e.nameDefault,
            ].join('_').toCamelCase()}\$\$'
            ..modifier = FieldModifier.constant
            ..type = refer(name)
            ..assignment = Code('$name()')
            ..static = true,
        ),
      );

      generatorListClass(
        e.entityParent!,
        parent,
        classBuilderList,
        classBuilderListExtends,
        fieldList,
        [
          ...nameDefaults,
          e.nameDefault,
        ],
      );
    }
  }
}

void generatorListClassFore(
  AEntity entity,
  AEntity parent,
  List<Class> classBuilderList,
  List<(String, Class)> classBuilderListExtends,
  List<Field> fieldList, [
  List<String> nameDefaults = const [],
]) {
  if (nameDefaults.length > 9 / 3) return;
  for (final e in entity.foreignKeys.where((e) =>
      !entity.primaryKeys.map((e) => e.nameDefault).contains(e.nameDefault))) {
    if (entity.className == e.className && nameDefaults.isNotEmpty) {
      continue;
    }
    if (e.entityParent != null) {
      final name = '_\$${e.entityParent!.setClassName}';
      final name2 = '_\$\$${e.entityParent!.setClassName}';
      final classExistIndex = classBuilderList.indexWhere(
        (c) => c.name == name2,
      );
      if (classExistIndex == -1) {
        classBuilderList.addAll(
          [
            Class(
              (c) => c
                ..name = name2
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
                ..name = name
                ..methods.addAll(
                  [
                    for (final item in e.entityParent!
                        .allssForChild(parent, nameDefaults.length + 1))
                      Method(
                        (f) => f
                          ..name = (item.$1.sublist(1)).join('_').toCamelCase()
                          ..returns = refer('$name2<${item.$2.typeSelect}>')
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
                          ..body = Code('''const $name2(
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
      fieldList.add(
        Field(
          (f) => f
            ..name = '${[
              ...nameDefaults,
              e.nameDefault,
            ].join('_').toCamelCase()}\$\$'
            ..modifier = FieldModifier.constant
            ..type = refer(name)
            ..assignment = Code('$name()')
            ..static = true,
        ),
      );
      if (entity.className != e.className) {
        generatorListClassFore(
          e.entityParent!,
          parent,
          classBuilderList,
          classBuilderListExtends,
          fieldList,
          [
            ...nameDefaults,
            e.nameDefault,
          ],
        );
      }
    }
  }
}
