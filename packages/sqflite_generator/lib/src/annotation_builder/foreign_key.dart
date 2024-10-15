import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:change_case/change_case.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/entity.dart';

import 'package:collection/collection.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(ForeignKey);

class AForeignKey extends AProperty {
  final ForeignAction onUpdate;
  final ForeignAction onDelete;

  final AEntity? entityParent;

  const AForeignKey._({
    super.name,
    required super.version,
    super.rawFromDB,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
    required this.entityParent,
    required super.nameDefault,
    required super.dartType,
    required super.className,
    required super.step,
  });
  factory AForeignKey.fromElement(
      FieldElement element, String className, int step) {
    AEntity? aEntity;
    if (element.type.isDartCoreList) {
      final pElement = element.library.children
          .whereType<CompilationUnitElement>()
          .expand((e) => e.children)
          .firstWhereOrNull(
            (e) =>
                e is ClassElement &&
                e.displayName == AForeignKeyX._name(element),
          );
      if (pElement != null) {
        aEntity = AEntity.of(pElement as ClassElement, step + 1);
      }
    } else {
      aEntity = AEntity.of(element.type.element as ClassElement, step + 1);
    }
    return AForeignKey._(
      step: step,
      nameDefault: element.displayName,
      dartType: element.type,
      entityParent: aEntity,
      name: AForeignKeyX._name(element),
      version: AForeignKeyX._version(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      rawFromDB: element.type.element is ClassElement &&
          AEntity.of(element.type.element as ClassElement, step + 1)
                  ?.primaryKeys
                  .isNotEmpty ==
              true,
      className: className,
    );
  }
  factory AForeignKey.fromSuperElement(
      SuperFormalParameterElement element, String className, int step) {
    return AForeignKey._(
      step: step,
      nameDefault: element.displayName,
      dartType: element.type,
      entityParent: AEntity.of(element.type.element as ClassElement, step + 1),
      name: AForeignKeyX._name(element),
      version: AForeignKeyX._version(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      rawFromDB: element.type.element is ClassElement &&
          AEntity.of(element.type.element as ClassElement, step + 1)
                  ?.primaryKeys
                  .isNotEmpty ==
              true,
      className: className,
    );
  }
}

extension AForeignKeyX on AForeignKey {
  String get typeNotSuffix =>
      dartType.toString().replaceFirst('?', '').replaceFirst('\$', '');
  String? get rawCreateForeign => dartType.isDartCoreList
      ? null
      : 'FOREIGN KEY ($nameToDB) REFERENCES $typeNotSuffix '
          '(${entityParent?.primaryKeys.first.name ?? entityParent?.primaryKeys.first.nameDefault})'
          ' ON UPDATE ${onUpdate.str} ON DELETE ${onDelete.str}';
  static List<AForeignKey> fields(
    int step,
    List<FieldElement> fields,
    String className,
    List<SuperFormalParameterElement> cons,
  ) {
    return [
      ...cons
          .where((e) => _checker.hasAnnotationOfExact(e))
          .map((e) => AForeignKey.fromSuperElement(e, className, step + 1))
          .toList(),
      ...fields
          .where((e) => _checker.hasAnnotationOfExact(e))
          .map((e) => AForeignKey.fromElement(e, className, step + 1))
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

  String joinAsStr(bool duplicate) => entityParent != null &&
          (dartType.toString().contains(className) || duplicate)
      ? '${nameDefault}_${entityParent!.className}'.toSnakeCase()
      : entityParent?.className.toSnakeCase() ?? nameDefault;
  String subSelect(bool duplicate) => entityParent != null &&
          (dartType.toString().contains(className) || duplicate)
      ? '\'${nameDefault.toSnakeCase()}_\''
      : '\'\'';
}
