import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(PrimaryKey);

class APrimaryKey extends AProperty {
  final bool auto;

  const APrimaryKey({
    this.auto = true,
    super.name,
    required super.nameDefault,
    required super.dartType,
    required super.element,
  });

  factory APrimaryKey.fromElement(FieldElement element) {
    return APrimaryKey(
      nameDefault: element.displayName,
      dartType: element.type,
      element: element,
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

  static String? name(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }
}
