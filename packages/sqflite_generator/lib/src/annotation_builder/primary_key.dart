import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';

import 'entity.dart';
import 'property.dart';

final _checker = const TypeChecker.fromRuntime(PrimaryKey);

class APrimaryKey extends AProperty {
  final bool auto;
  final AEntity? entityParent;
  final AForeignKey? foreignKey;

  const APrimaryKey._({
    required this.foreignKey,
    required super.parentClassName,
    required this.entityParent,
    required super.step,
    this.auto = true,
    super.name,
    required super.version,
    super.rawFromDB,
    required super.nameDefault,
    required super.dartType,
    required super.className,
  });

  factory APrimaryKey.fromElement(
    FieldElement element,
    String className,
    List<String> parentClassName,
    int step,
    AEntity? entityParent,
    AForeignKey? foreignKey,
  ) {
    return APrimaryKey._(
      foreignKey: foreignKey,
      parentClassName: parentClassName,
      entityParent: entityParent,
      auto: APrimaryKeyX._auto(element),
      step: step,
      name: APrimaryKeyX._name(element),
      version: APrimaryKeyX._version(element),
      nameDefault: element.displayName,
      dartType: element.type,
      // TODO(hodoan): check parentClassName
      rawFromDB: element.type.element is ClassElement &&
          AEntity.of(element.type.element as ClassElement, [], step + 1)
                  ?.primaryKeys
                  .isNotEmpty ==
              true,
      className: className,
    );
  }
}

extension APrimaryKeyX on APrimaryKey {
  static List<APrimaryKey> fields(
    List<FieldElement> fields,
    String className,
    List<String> parentClassName,
    int step,
    List<AForeignKey>? fores,
  ) {
    return fields.where((e) => _checker.hasAnnotationOfExact(e)).map((e) {
      final foreignKey = fores?.of(e.displayName);
      return APrimaryKey.fromElement(
        e,
        className,
        parentClassName,
        step,
        foreignKey?.entityParent,
        foreignKey,
      );
    }).toList();
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

  static bool _auto(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)!
        .getField('auto')!
        .toBoolValue()!;
  }
}
