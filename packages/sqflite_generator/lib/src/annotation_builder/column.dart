import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/entity.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';
import 'package:sqflite_generator/src/annotation_builder/index.dart';
import 'package:sqflite_generator/src/annotation_builder/primary_key.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(Column);

class AColumn extends AProperty {
  const AColumn({
    super.name,
    required super.version,
    super.rawFromDB,
    required super.dartType,
    required super.nameDefault,
    required super.className,
  });
  factory AColumn.fromElement(FieldElement element, String className) {
    final type = element.type;
    return AColumn(
      name: AColumnX._name(element),
      version: AColumnX._version(element),
      dartType: type,
      nameDefault: element.displayName,
      rawFromDB: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
      className: className,
    );
  }
  factory AColumn.fromConsElement(ParameterElement element, String className) {
    final type = element.type;
    return AColumn(
      name: AColumnX._name(element),
      version: AColumnX._version(element),
      dartType: type,
      nameDefault: element.displayName,
      rawFromDB: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
      className: className,
    );
  }
}

extension AColumnX on AColumn {
  static List<AColumn> fields(
    List<FieldElement> fields,
    String className,
    List<ParameterElement> cons,
    List<APrimaryKey> primaries,
    List<AIndex> indies,
    List<AForeignKey> fores,
  ) {
    final aColumns =
        fields.where((e) => _checker.hasAnnotationOfExact(e)).toList();
    final columns = <ParameterElement>[];
    for (final f in cons) {
      if (primaries.any((e) => e.nameDefault == f.displayName)) {
        continue;
      }
      if (indies.any((e) => e.nameDefault == f.displayName)) {
        continue;
      }
      if (fores.any((e) => e.nameDefault == f.displayName)) {
        continue;
      }
      if (!aColumns.any((e) => e.displayName == f.displayName)) {
        columns.add(f);
      }
    }
    return [
      ...columns.map((e) => AColumn.fromConsElement(e, className)).toList(),
      ...aColumns.map((e) => AColumn.fromElement(e, className)).toList(),
    ];
  }

  static int _version(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('(super)')
            ?.getField('version')
            ?.toIntValue() ??
        -1;
  }

  static String? _name(Element field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }
}
