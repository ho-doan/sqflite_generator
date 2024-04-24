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
    super.rawFromJson,
    required super.nameDefault,
    required super.dartType,
    required super.element,
  });

  factory APrimaryKey.fromElement(FieldElement element) {
    return APrimaryKey(
      name: APrimaryKeyX._name(element),
      nameDefault: element.displayName,
      dartType: element.type,
      element: element,
      rawFromJson: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
    );
  }
}

extension APrimaryKeyX on APrimaryKey {
  static List<APrimaryKey> fields(List<FieldElement> fields) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => APrimaryKey.fromElement(e))
        .toList();
  }

  static String? _name(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }
}
