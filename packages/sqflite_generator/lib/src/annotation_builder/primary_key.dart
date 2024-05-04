import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'entity.dart';
import 'property.dart';

final _checker = const TypeChecker.fromRuntime(PrimaryKey);

class APrimaryKey extends AProperty {
  final bool auto;

  const APrimaryKey({
    this.auto = true,
    super.name,
    required super.version,
    super.rawFromDB,
    required super.nameDefault,
    required super.dartType,
    required super.className,
  });

  factory APrimaryKey.fromElement(FieldElement element, String className) {
    return APrimaryKey(
      name: APrimaryKeyX._name(element),
      version: APrimaryKeyX._version(element),
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

extension APrimaryKeyX on APrimaryKey {
  static List<APrimaryKey> fields(List<FieldElement> fields, String className) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => APrimaryKey.fromElement(e, className))
        .toList();
  }

  static bool isElement(Element e) {
    return _checker.hasAnnotationOfExact(e);
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
}
