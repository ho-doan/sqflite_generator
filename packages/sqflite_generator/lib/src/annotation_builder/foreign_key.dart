import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/entity.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(ForeignKey);

class AForeignKey extends AProperty {
  final ForeignAction onUpdate;
  final ForeignAction onDelete;

  final AEntity entityParent;

  const AForeignKey({
    super.name,
    super.rawFromJson,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
    required this.entityParent,
    required super.nameDefault,
    required super.dartType,
    required super.element,
    required super.className,
  });
  factory AForeignKey.fromElement(FieldElement element, String className) {
    return AForeignKey(
      nameDefault: element.displayName,
      dartType: element.type,
      element: element,
      entityParent: AEntity.fromElement(element.type.element as ClassElement),
      name: AForeignKeyX._name(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      rawFromJson: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
      className: className,
    );
  }
}

extension AForeignKeyX on AForeignKey {
  String get rawCreateForeign =>
      'FOREIGN KEY ($nameToJson) REFERENCES ${element.type.toString()} '
      '(${entityParent.primaryKeys.first.name ?? entityParent.primaryKeys.first.nameDefault})'
      ' ON UPDATE ${onUpdate.str} ON DELETE ${onDelete.str}';
  static List<AForeignKey> fields(List<FieldElement> fields, String className) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => AForeignKey.fromElement(e, className))
        .toList();
  }

  static String? _name(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }

  static ForeignAction _updValue(FieldElement element) {
    DartObject? dartObject;
    dartObject = _checker.firstAnnotationOfExact(element);

    final v =
        dartObject!.getField('onUpdate')!.getField('_name')!.toStringValue()!;

    return ForeignAction.values.byName(v);
  }

  static ForeignAction _delValue(FieldElement element) {
    DartObject? dartObject;
    dartObject = _checker.firstAnnotationOfExact(element);

    final v =
        dartObject!.getField('onDelete')!.getField('_name')!.toStringValue()!;

    return ForeignAction.values.byName(v);
  }
}
