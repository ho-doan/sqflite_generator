import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/column.dart';
import 'package:sqflite_generator/src/annotation_builder/property.dart';
import 'package:sqflite_generator/src/extensions/sql_type.dart';

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
        ..types.addAll([refer('T'), refer('M')])
        ..extend = refer('WhereModel<T,M>')
        ..constructors.add(
          Constructor(
            (c) => c
              ..constant = true
              ..initializers.add(
                Code('super(field: \'\${self}_\$model.\$name\')'),
              )
              ..optionalParameters.addAll(entity.setOptionalArgs),
          ),
        ),
    );
    final classSetBuilderExternal2 = Class(
      (c) => c
        ..name = entity.setClassNameExternal2
        ..constructors.add(
          Constructor((c) => c..constant = true),
        ),
    );
    final classSetBuilderExternal = Class(
      (c) => c
        ..name = entity.setClassNameExternal
        ..types.addAll([refer('T')])
        ..fields.addAll(entity.setFieldsExternal)
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'leftJoin'
              ..returns = refer('String')
              ..lambda = true
              ..requiredParameters.add(Parameter(
                (p) => p
                  ..name = 'parentModel'
                  ..type = refer('String'),
              ))
              ..optionalParameters.add(Parameter(
                (p) => p
                  ..name = 'step'
                  ..type = refer('int')
                  ..defaultTo = Code('0'),
              ))
              ..body = Code(
                  """[if (self.isNotEmpty)'''LEFT JOIN ${entity.className} \${self}${entity.className.toSnakeCase()} ON ${[
                for (final item in entity.keysNew)
                  '\${self}${entity.className.toSnakeCase()}.${item.$2.args.fieldNames.join('_')} = \$parentModel.\${self2}${item.$2.args.fieldNames.join('_')}'
              ].join(' AND ')}''',
              ${[
                for (final item in entity.foreignKeys)
                  [
                    if (item.entityParent!.className == entity.className)
                      'if(step < 1)',
                    '\$\$${item.nameDefault}.leftJoin(parentModel, step+${item.entityParent!.className == entity.className ? 1 : 0})',
                  ].join('\n')
              ].join(',\n')}
              ].join('\\n')
              """),
          ),
          for (final item in entity.properties()) ...[
            if (item.args.parentClassNames.length == 2)
              Method(
                (f) => f
                  ..name = '\$\$${item.args.fieldNames.first}'
                  ..returns =
                      refer('${item.args.parentClassNames.last}SetArgs<T>')
                  ..docs.addAll([
                    '// ${item.args}',
                    if (item is AColumn &&
                        item.alters.any((e) => e.type == AlterTypeGen.drop))
                      '@Deprecated(\'no such column\')'
                  ])
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code(
                    '''${item.args.parentClassNames.last}SetArgs<T>(
                  '\${self}${item.args.fieldNames.sublist(0, item.args.fieldNames.length - 1).join('_').toSnakeCase()}_',
                  '${item.args.fieldNames.sublist(0, item.args.fieldNames.length - 1).join('_').toSnakeCase()}_'
                  )''',
                  ),
              ),
            Method(
              (f) => f
                ..name = '\$${item.args.fieldNames.join('_').toCamelCase()}'
                ..type = MethodType.getter
                ..returns =
                    refer('${entity.setClassName}<${item.typeSelect},T>')
                ..docs.addAll([
                  if (item is AColumn &&
                      item.alters.any((e) => e.type == AlterTypeGen.drop))
                    '@Deprecated(\'no such column\')'
                ])
                ..lambda = true
                ..body = Code('''${entity.setClassName}<${item.typeSelect},T>(
              name: '${item.args.fieldNames.join('_').toSnakeCase()}',
              nameCast: '${[
                  item.args.parentClassNames.first,
                  ...item.args.fieldNames
                ].join('_').toSnakeCase()}',
              model: '${item.args.parentClassNames.first.toSnakeCase()}',
              self: this.self,
              )'''),
            ),
          ],
          for (final item in entity.foreignKeys)
            if (!entity.primaryKeys.any(
              (e) => e.nameDefault == item.nameDefault,
            )) ...[
              Method(
                (f) => f
                  ..name = '\$\$${item.args.fieldNames.first}'
                  ..returns = refer('${item.entityParent!.className}SetArgs<T>')
                  ..docs.addAll([
                    if (item is AColumn &&
                        item.alters.any((e) => e.type == AlterTypeGen.drop))
                      '@Deprecated(\'no such column\')'
                  ])
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code(
                    '''${item.entityParent!.className}SetArgs<T>(
                  '\${self}${item.args.fieldNames.first.toSnakeCase()}_',
                  '${item.args.fieldNames.first.toSnakeCase()}_'
                  )''',
                  ),
              ),
            ]
        ])
        ..fields.addAll([
          for (final item in entity.properties()) ...[
            if (item.args.parentClassNames.length == 2)
              Field(
                (f) => f
                  ..name = '\$${item.args.fieldNames.first}'
                  ..type = refer(
                      '${item.args.parentClassNames.last}SetArgs<${entity.setClassNameExternal2}>')
                  ..docs.addAll([
                    '// ${item.args}',
                    if (item is AColumn &&
                        item.alters.any((e) => e.type == AlterTypeGen.drop))
                      '@Deprecated(\'no such column\')'
                  ])
                  ..static = true
                  ..modifier = FieldModifier.constant
                  ..assignment = Code(
                      '''${item.args.parentClassNames.last}SetArgs<${entity.setClassNameExternal2}>(
              '${item.args.fieldNames.sublist(0, item.args.fieldNames.length - 1).join('_').toSnakeCase()}_',
              '${item.args.fieldNames.sublist(0, item.args.fieldNames.length - 1).join('_').toSnakeCase()}_'
              )'''),
              ),
            Field(
              (f) => f
                ..name = item.args.fieldNames.join('_').toCamelCase()
                ..type = refer(
                    '${entity.setClassName}<${item.typeSelect},${entity.setClassNameExternal2}>')
                ..docs.addAll([
                  if (item is AColumn &&
                      item.alters.any((e) => e.type == AlterTypeGen.drop))
                    '@Deprecated(\'no such column\')'
                ])
                ..assignment = Code(
                    '''${entity.setClassName}<${item.typeSelect},${entity.setClassNameExternal2}>(
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
          ],
          for (final item in entity.foreignKeys)
            if (!entity.primaryKeys.any(
              (e) => e.nameDefault == item.nameDefault,
            )) ...[
              Field(
                (f) => f
                  ..name = '\$${item.args.fieldNames.first}'
                  ..type = refer(
                      '${item.entityParent!.className}SetArgs<${item.entityParent!.setClassNameExternal2}>')
                  ..docs.addAll([
                    if (item is AColumn &&
                        item.alters.any((e) => e.type == AlterTypeGen.drop))
                      '@Deprecated(\'no such column\')'
                  ])
                  ..modifier = FieldModifier.constant
                  ..static = true
                  ..assignment = Code(
                    '''${item.entityParent!.className}SetArgs<${item.entityParent!.setClassNameExternal2}>(
                  '${item.args.fieldNames.first.toSnakeCase()}_',
                  '${item.args.fieldNames.first.toSnakeCase()}_'
                  )''',
                  ),
              ),
            ],
        ])
        ..constructors.add(
          Constructor((c) => c
            ..constant = true
            ..requiredParameters.addAll(entity.setOptionalArgsExternal)),
        ),
    );

    final extensionBuilder = ExtensionBuilder()
      ..name = entity.extensionName
      ..on = refer(entity.classType)
      ..fields.addAll([
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
            ..name = 'alter'
            ..type = refer('Map<int,List<String>>')
            ..docs.add('// TODO(hodoan): check')
            ..assignment = Code("""${entity.rawAlterTable}""")
            ..modifier = FieldModifier.constant
            ..static = true,
        ),
        Field(
          (f) => f
            ..name = entity.defaultSelectClass
            ..type = refer(
                'Set<WhereModel<dynamic, ${entity.setClassNameExternal2}>>')
            ..assignment = Code('''{${[
              for (final e in entity.properties())
                if (!(e is AColumn &&
                    e.alters.any((e) => e.type == AlterTypeGen.drop)))
                  '${entity.setClassNameExternal}.${e.args.fieldNames.join('_').toCamelCase()}',
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
            .map((e)=>'\${'\${e.self}\${e.model}'.replaceFirst(RegExp('^_'), '')}.\${e.name} as \${e.self}\${e.nameCast}')
            .join(',')''')
            ..requiredParameters.addAll([
              entity.selectArgs,
            ])
            ..returns = refer('String'),
        ),
        // Set<JoinModel> return (List<SelfModel>,dynamic/* (...JoinModel) */)
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
          ..optionalParameters.addAll([
            entity.selectChildArgs,
            entity.selectChildStepArgs,
          ])
          ..returns = refer(entity.classType)),
        Method((m) => m
          ..name = '\$toDB'
          ..lambda = true
          ..body = Code('{${entity.rawToDB}}')
          ..returns = refer('Map<String,dynamic>')),
      ]);

    // TODO(hodoan): DISTINCT, https://www.sqlitetutorial.net/sqlite-distinct/
    final extensionBuilder2 = ExtensionBuilder()
      ..name = '\$${entity.extensionName}Sample'
      ..on = refer(entity.classType)
      ..fields.addAll([
        Field(
          (f) => f
            ..name = 'selectAll'
            ..type = refer('String')
            ..assignment = Code("""'''${entity.selectAll}'''""")
            ..modifier = FieldModifier.constant
            ..static = true,
        ),
      ]);

    final classSetBuilderFilter = Class(
      (c) => c
        ..name = '${entity.className}Filter'
        ..constructors.add(
          Constructor(
            (c) => c
              ..constant = true
              ..requiredParameters.addAll([
                Parameter(
                  (p) => p
                    ..name = 'value'
                    ..toThis = true,
                ),
              ]),
          ),
        )
        ..fields.addAll([
          Field(
            (f) => f
              ..name = 'value'
              ..type = refer('String')
              ..modifier = FieldModifier.final$,
          ),
        ])
        ..methods.addAll([
          for (final field in entity.aPs)
            Method(
              (m) => m
                ..name = 'sortBy${field.nameDefault.toPascalCase()}'
                ..lambda = true
                ..returns = Reference('${entity.className}Filter')
                ..type = MethodType.getter
                ..body = Code(
                    'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()}\')'),
            ),
          for (final field in entity.aPs)
            Method(
              (m) => m
                ..name = 'sortBy${field.nameDefault.toPascalCase()}Desc'
                ..lambda = true
                ..returns = Reference('${entity.className}Filter')
                ..type = MethodType.getter
                ..body = Code(
                    'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()} DESC\')'),
            ),
          for (final field in entity.aPs.where((e) => e.isQues))
            Method(
              (m) => m
                ..name = 'sortBy${field.nameDefault.toPascalCase()}NullsFirst'
                ..lambda = true
                ..returns = Reference('${entity.className}Filter')
                ..type = MethodType.getter
                ..body = Code(
                    'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()} NULLS FIRST\')'),
            ),
          for (final field in entity.aPs.where((e) => e.isQues))
            Method(
              (m) => m
                ..name = 'sortBy${field.nameDefault.toPascalCase()}NullsLast'
                ..lambda = true
                ..returns = Reference('${entity.className}Filter')
                ..type = MethodType.getter
                ..body = Code(
                    'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()} NULLS LAST\')'),
            ),
        ]),
    );
    final classSetBuilderWhere = Class(
      (c) => c
        ..name = '${entity.className}Where'
        ..constructors.add(
          Constructor(
            (c) => c
              ..constant = true
              ..requiredParameters.addAll([
                Parameter(
                  (p) => p
                    ..name = 'value'
                    ..toThis = true,
                ),
              ]),
          ),
        )
        ..fields.addAll([
          Field(
            (f) => f
              ..name = 'value'
              ..type = refer('String')
              ..modifier = FieldModifier.final$,
          ),
        ])
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'or'
              ..lambda = true
              ..returns = Reference('${entity.className}Where')
              ..body = Code('const ${entity.className}Where(" or ")'),
          ),
          for (final field in entity.aPs)
            if (field.sqlType != MTypeSql.integer &&
                field.sqlType != MTypeSql.bit) ...[
              Method(
                (m) => m
                  ..name = '${field.nameDefault}Equal'
                  ..lambda = true
                  ..returns = Reference('${entity.className}Where')
                  ..requiredParameters.addAll([
                    Parameter((p) => p
                      ..name = 'value'
                      ..type = Reference('dynamic'))
                  ])
                  ..body = Code(
                      '${entity.className}Where("${field.nameDefault.toSnakeCase()} = \'\$value\'")'),
              ),
              Method(
                (m) => m
                  ..name = '${field.nameDefault}NotEqual'
                  ..lambda = true
                  ..returns = Reference('${entity.className}Where')
                  ..requiredParameters.addAll([
                    Parameter((p) => p
                      ..name = 'value'
                      ..type = Reference('dynamic'))
                  ])
                  ..body = Code(
                      '${entity.className}Where("${field.nameDefault.toSnakeCase()} != \'\$value\'")'),
              ),
            ] else ...[
              Method(
                (m) => m
                  ..name = '${field.nameDefault}Equal'
                  ..lambda = true
                  ..returns = Reference('${entity.className}Where')
                  ..requiredParameters.addAll([
                    Parameter((p) => p
                      ..name = 'value'
                      ..type = Reference('dynamic'))
                  ])
                  ..body = Code(
                      '${entity.className}Where("${field.nameDefault.toSnakeCase()} = \$value")'),
              ),
              Method(
                (m) => m
                  ..name = '${field.nameDefault}NotEqual'
                  ..lambda = true
                  ..returns = Reference('${entity.className}Where')
                  ..requiredParameters.addAll([
                    Parameter((p) => p
                      ..name = 'value'
                      ..type = Reference('dynamic'))
                  ])
                  ..body = Code(
                      '${entity.className}Where("${field.nameDefault.toSnakeCase()} != \$value")'),
              ),
            ],
          // for (final field in entity.aPs)
          //   Method(
          //     (m) => m
          //       ..name = 'sortBy${field.nameDefault.toPascalCase()}Desc'
          //       ..lambda = true
          //       ..returns = Reference('${entity.className}Filter')
          //       ..type = MethodType.getter
          //       ..body = Code(
          //           'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()} DESC\')'),
          //   ),
          // for (final field in entity.aPs.where((e) => e.isQues))
          //   Method(
          //     (m) => m
          //       ..name = 'sortBy${field.nameDefault.toPascalCase()}NullsFirst'
          //       ..lambda = true
          //       ..returns = Reference('${entity.className}Filter')
          //       ..type = MethodType.getter
          //       ..body = Code(
          //           'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()} NULLS FIRST\')'),
          //   ),
          // for (final field in entity.aPs.where((e) => e.isQues))
          //   Method(
          //     (m) => m
          //       ..name = 'sortBy${field.nameDefault.toPascalCase()}NullsLast'
          //       ..lambda = true
          //       ..returns = Reference('${entity.className}Filter')
          //       ..type = MethodType.getter
          //       ..body = Code(
          //           'const ${entity.className}Filter(\'${field.nameDefault.toSnakeCase()} NULLS LAST\')'),
          //   ),
        ]),
    );

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      '// ignore_for_file: library_private_types_in_public_api',
      if (element.metadata.first.element.toString().contains('entityTest')) ...[
        extensionBuilder2.build().accept(emitter),
        classSetBuilderFilter.accept(emitter),
        classSetBuilderWhere.accept(emitter),
      ],
      extensionBuilder.build().accept(emitter),
      classSetBuilder.accept(emitter),
      classSetBuilderExternal.accept(emitter),
      classSetBuilderExternal2.accept(emitter),
    ].join('\n\n'));
  }
}
