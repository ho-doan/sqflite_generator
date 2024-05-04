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
    required super.version,
    super.rawFromDB,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
    required this.entityParent,
    required super.nameDefault,
    required super.dartType,
    required super.className,
  });
  factory AForeignKey.fromElement(FieldElement element, String className) {
    return AForeignKey(
      nameDefault: element.displayName,
      dartType: element.type,
      entityParent: AEntity.fromElement(element.type.element as ClassElement),
      name: AForeignKeyX._name(element),
      version: AForeignKeyX._version(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      rawFromDB: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
      className: className,
    );
  }
  factory AForeignKey.fromSuperElement(
    SuperFormalParameterElement element,
    String className,
  ) {
    return AForeignKey(
      nameDefault: element.displayName,
      dartType: element.type,
      entityParent: AEntity.fromElement(element.type.element as ClassElement),
      name: AForeignKeyX._name(element),
      version: AForeignKeyX._version(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      rawFromDB: element.type.element is ClassElement &&
          AEntity.fromElement(element.type.element as ClassElement)
              .primaryKeys
              .isNotEmpty,
      className: className,
    );
  }
}

extension AForeignKeyX on AForeignKey {
  String get rawCreateForeign =>
      'FOREIGN KEY ($nameToDB) REFERENCES ${dartType.toString()} '
      '(${entityParent.primaryKeys.first.name ?? entityParent.primaryKeys.first.nameDefault})'
      ' ON UPDATE ${onUpdate.str} ON DELETE ${onDelete.str}';
  static List<AForeignKey> fields(
    List<FieldElement> fields,
    String className,
    List<SuperFormalParameterElement> cons,
  ) {
    return [
      ...cons
          .where((e) => _checker.hasAnnotationOfExact(e))
          .map((e) => AForeignKey.fromSuperElement(e, className))
          .toList(),
      ...fields
          .where((e) => _checker.hasAnnotationOfExact(e))
          .map((e) => AForeignKey.fromElement(e, className))
          .toList()
    ];
  }

  static String? _name(Element field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }

  static int _version(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('(super)')
            ?.getField('version')
            ?.toIntValue() ??
        -1;
  }

  static ForeignAction _updValue(Element element) {
    DartObject? dartObject;
    dartObject = _checker.firstAnnotationOfExact(element);

    final v =
        dartObject!.getField('onUpdate')!.getField('_name')!.toStringValue()!;

    return ForeignAction.values.byName(v);
  }

  static ForeignAction _delValue(Element element) {
    DartObject? dartObject;
    dartObject = _checker.firstAnnotationOfExact(element);

    final v =
        dartObject!.getField('onDelete')!.getField('_name')!.toStringValue()!;

    return ForeignAction.values.byName(v);
  }

  static bool isElement(Element f) => _checker.hasAnnotationOfExact(f);
}
