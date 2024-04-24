import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(Column);

class AColumn extends AProperty {
  const AColumn({
    super.name,
    required super.dartType,
    required super.nameDefault,
    required super.element,
  });
  factory AColumn.fromElement(FieldElement element) {
    final type = element.type;
    return AColumn(
      name: AColumnX.name(element),
      dartType: type,
      nameDefault: element.displayName,
      element: element,
    );
  }
}

extension AColumnX on AColumn {
  static List<AColumn> fields(List<FieldElement> fields) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => AColumn.fromElement(e))
        .toList();
  }

  static String? name(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }
}
