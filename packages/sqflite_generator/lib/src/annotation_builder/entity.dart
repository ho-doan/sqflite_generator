import 'package:analyzer/dart/element/element.dart';
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
            return '${e.nameDefault}: ${e.dartType}.fromJson(json[\'${e.name ?? e.nameDefault}\'])';
          }
          return '${e.nameDefault}: json[\'${e.name ?? e.nameDefault}\'] as ${e.dartType}';
        },
      ).join(','),
      ','
    ].join();
  }

  String get rawFindAll {
    return 'SELECT * FROM $className';
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
      columns: AColumnX.fields(fields),
      foreignKeys: AForeignKeyX.fields(fields),
      primaryKeys: APrimaryKeyX.fields(fields),
      indices: AIndexX.fields(fields),
    );
  }
}
