import 'package:analyzer/dart/element/element.dart';
import 'package:change_case/change_case.dart';
import 'package:sqflite_generator/src/annotation_builder/column.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';
import 'package:sqflite_generator/src/annotation_builder/index.dart';
import 'package:sqflite_generator/src/annotation_builder/primary_key.dart';
import 'package:sqflite_generator/src/annotation_builder/property.dart';

class AEntity {
  final String? name;
  final List<AColumn> columns;
  final List<AForeignKey> foreignKeys;
  final List<APrimaryKey> primaryKeys;
  final List<AIndex> indices;
  final String className;
  String get extensionName => '${className}Query';

  String get rawCreateTable {
    final all = [
      ...primaryKeys.map(
        (e) => e.rawCreate(
          autoId: e.auto,
          isId: true,
          isIds: primaryKeys.length > 1,
        ),
      ),
      ...columns.map((e) => e.rawCreate()),
      ...indices.map((e) => e.rawCreate()),
      primaryKeys.rawCreate,
      ...foreignKeys.map((e) => e.rawCreateForeign),
    ].where((e) => e.isNotEmpty);
    return 'CREATE TABLE IF NOT EXISTS $className(\n\t\t${all.join(',\n\t\t\t')}\n\t)';
  }

  String get rawFromJson {
    return [
      [
        ...primaryKeys,
        ...columns,
        ...indices,
        ...foreignKeys,
      ].lst.map(
        (e) {
          if (e.rawFromJson) {
            return '${e.nameDefault}: ${e.dartType}.fromJson(json)';
          }
          return '${e.nameDefault}: json[\'${e.nameFromJson}\'] as ${e.dartType}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawToJson {
    return [
      [
        ...primaryKeys,
        ...columns,
        ...indices,
        ...foreignKeys,
      ].lst.map(
        (e) {
          if (e.rawFromJson) {
            return '\'${e.nameToJson}\': ${e.nameDefault}.id';
          }
          return '\'${e.nameToJson}\':${e.nameDefault}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawFindAll {
    final fields = [
      ...[
        ...primaryKeys,
        ...columns,
        ...indices,
        ...foreignKeys,
      ].lst,
      ...[
        for (final item in foreignKeys)
          ...[
            ...item.entityParent.primaryKeys,
            ...item.entityParent.columns,
            ...item.entityParent.indices,
            ...item.entityParent.foreignKeys,
          ].lst,
      ],
    ]
        .map((e) =>
            '${e.className.toSnakeCase()}.${e.nameToJson} as ${e.nameFromJson}')
        .join(',\n');

    final fores = foreignKeys.map((e) {
      return ' INNER JOIN ${e.entityParent.className} ${e.entityParent.className.toSnakeCase()}'
          ' ON ${e.entityParent.className.toSnakeCase()}.${e.entityParent.primaryKeys.first.nameToJson}'
          ' = ${className.toSnakeCase()}.${e.name}';
    }).toList();

    return [
      'SELECT $fields FROM $className ${className.toSnakeCase()}',
      ...fores
    ].join('\n');
  }

  String get rawFindOne {
    final fields = [
      ...[
        ...[
          ...primaryKeys,
          ...columns,
          ...indices,
          ...foreignKeys,
        ].lst,
        ...[
          for (final item in foreignKeys)
            ...[
              ...item.entityParent.primaryKeys,
              ...item.entityParent.columns,
              ...item.entityParent.indices,
              ...item.entityParent.foreignKeys,
            ].lst,
        ],
      ].map((e) =>
          '${e.className.toSnakeCase()}.${e.nameToJson} as ${e.nameFromJson}'),
      'WHERE ${className.toSnakeCase()}.${primaryKeys.first.nameToJson} = ?'
    ].join(',\n');

    final fores = foreignKeys.map((e) {
      return ' INNER JOIN ${e.entityParent.className} ${e.entityParent.className.toSnakeCase()}'
          ' ON ${e.entityParent.className.toSnakeCase()}.${e.entityParent.primaryKeys.first.nameToJson}'
          ' = ${className.toSnakeCase()}.${e.name}';
    }).toList();

    return [
      'SELECT $fields FROM $className ${className.toSnakeCase()}',
      ...fores
    ].join('\n');
  }

  String get delete {
    return [
      'DELETE FROM $className ${className.toSnakeCase()} WHERE ${primaryKeys.map((e) => '${e.nameToJson} = ?').join(' AND ')}',
    ].join('\n');
  }

  String get deleteAll {
    return [
      'DELETE * FROM $className',
    ].join('\n');
  }

  String rawInsert([String? parent]) {
    final fields = [
      ...primaryKeys,
      ...columns,
      ...indices,
      ...foreignKeys,
    ].lst;
    final fieldsRaw = fields.map((e) => e.nameToJson).join(',\n');

    final fieldsValue = fields.map((e) {
      if (e.rawFromJson) {
        // TODO(hodoan): hard id
        return '${parent ?? 'model'}.${e.nameDefault}.id';
      }
      return '${parent ?? 'model'}.${e.nameDefault}';
    }).join(',');

    return [
      ...foreignKeys.map(
        (e) => e.entityParent.rawInsert('model.${e.nameDefault}'),
      ),
      '''await database.rawInsert(\'\'\'INSERT INTO $className ($fieldsRaw) 
       VALUES(${List.generate(fields.length, (index) => '?').join(', ')})\'\'\',
       [
        $fieldsValue,
       ]
      );''',
    ].join('\n');
  }

  List<String> rawUpdate([String? parent]) {
    return {
      for (final fore in foreignKeys)
        ...fore.entityParent.rawUpdate('model.${fore.nameDefault}'),
      'await database.update(\'$className\',${parent ?? 'model'}.toJson());',
    }.toList();
  }

  const AEntity({
    this.name,
    required this.columns,
    required this.foreignKeys,
    required this.primaryKeys,
    required this.indices,
    required this.className,
  });

  factory AEntity.fromElement(ClassElement element) {
    final fields = element.fields.cast<FieldElement>();
    return AEntity(
      className: element.displayName,
      columns: AColumnX.fields(fields, element.displayName),
      foreignKeys: AForeignKeyX.fields(fields, element.displayName),
      primaryKeys: APrimaryKeyX.fields(fields, element.displayName),
      indices: AIndexX.fields(fields, element.displayName),
    );
  }
}
