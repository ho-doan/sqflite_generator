import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'entity.dart';
import 'property.dart';

final _checker = const TypeChecker.fromRuntime(Index);

class AIndex extends AProperty {
  final bool unique;

  const AIndex({
    this.unique = false,
    super.name,
    required super.nameDefault,
    required super.dartType,
    required super.className,
    super.rawFromDB,
  });
  factory AIndex.fromElement(FieldElement element, String className) {
    return AIndex(
      nameDefault: element.displayName,
      dartType: element.type,
      rawFromDB: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
      className: className,
    );
  }
}

extension AIndexX on AIndex {
  static List<AIndex> fields(List<FieldElement> fields, String className) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => AIndex.fromElement(e, className))
        .toList();
  }

  static String? name(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }

  static bool isElement(Element e) {
    return _checker.hasAnnotationOfExact(e);
  }
}
