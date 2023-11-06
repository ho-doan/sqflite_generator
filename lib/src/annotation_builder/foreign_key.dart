import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(ForeignKey);

class AForeignKey extends AProperty {
  final String parent;
  final ForeignAction onUpdate;
  final ForeignAction onDelete;

  const AForeignKey({
    required this.parent,
    super.name,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
    required super.nameDefault,
    required super.dartType,
    required super.element,
  });
  factory AForeignKey.fromElement(FieldElement element) {
    return AForeignKey(
      nameDefault: element.displayName,
      dartType: element.type,
      element: element,
      parent: AForeignKeyX._parent(element)!,
      name: AForeignKeyX._name(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
    );
  }
}

extension AForeignKeyX on AForeignKey {
  String get rawCreateForeign =>
      'FOREIGN KEY $parent on ${name ?? nameDefault} ${onUpdate.str} ${onDelete.str}';
  static List<AForeignKey> fields(List<FieldElement> fields) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map((e) => AForeignKey.fromElement(e))
        .toList();
  }

  static String? _name(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }

  static String? _parent(FieldElement field) {
    return _checker
        .firstAnnotationOfExact(field)!
        .getField('parent')!
        .toTypeValue()!
        .toString();
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
