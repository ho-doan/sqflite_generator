import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'entity.dart';
import 'property.dart';

final _checker = const TypeChecker.fromRuntime(Index);

class AIndex extends AProperty {
  final bool unique;

  const AIndex._({
    this.unique = false,
    super.name,
    required super.version,
    required super.step,
    required super.nameDefault,
    required super.dartType,
    required super.className,
    super.rawFromDB,
  });
  factory AIndex.fromElement(FieldElement element, String className, int step) {
    return AIndex._(
      step: step,
      nameDefault: element.displayName,
      dartType: element.type,
      name: AIndexX._name(element),
      version: AIndexX._version(element),
      rawFromDB: element.type.element is ClassElement &&
          AEntity.of(element.type.element as ClassElement, step + 1)
                  ?.primaryKeys
                  .isNotEmpty ==
              true,
      className: className,
    );
  }
}

extension AIndexX on AIndex {
  static List<AIndex> fields(
      List<FieldElement> fields, String className, int step) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => AIndex.fromElement(e, className, step))
        .toList();
  }

  static int _version(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('(super)')
            ?.getField('version')
            ?.toIntValue() ??
        -1;
  }

  static String? _name(FieldElement field) {
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
