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
    required super.args,
    super.name,
    required super.version,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
    required this.entityParent,
    required super.nameDefault,
    required super.dartType,
    required super.className,
    required super.step,
  });

  factory AForeignKey.fromElement(
    FieldElement element,
    FieldElement? parentElement,
    String className,
    List<String> parentClassName,
    APropertyArgs args,
    int step,
  ) {
    AEntity? aEntity;
    if (element.type.isDartCoreList) {
      final es = [
        ...element.library.children.expand((e) => e.classes()),
        ...element.children.expand((e) => e.children),
      ];
      Element? pElement = es.firstWhereOrNull(
        (e) =>
            e is ClassElement && e.displayName == AForeignKeyX._name(element),
      );
      if (pElement == null && parentElement != null) {
        pElement = parentElement;
      }
      if (pElement != null) {
        aEntity = AEntity.of(
          pElement as ClassElement,
          args.copyWithByElement(fieldName: element.displayName),
          [
            ...parentClassName,
            if (parentClassName.isEmpty) element.displayName else className,
          ],
          step + 1,
        );
      }
    } else {
      aEntity = AEntity.of(
        element.type.element as ClassElement,
        args.copyWithByElement(fieldName: element.displayName),
        [
          ...parentClassName,
          if (parentClassName.isEmpty) element.displayName else className,
        ],
        step + 1,
      );
    }
    return AForeignKey._(
      args: args.copyWithByElement(fieldName: element.displayName),
      step: step,
      nameDefault: element.displayName,
      dartType: element.type,
      entityParent: aEntity,
      name: AForeignKeyX._name(element),
      version: AForeignKeyX._version(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      className: className,
    );
  }
  factory AForeignKey.fromSuperElement(
    SuperFormalParameterElement element,
    String className,
    List<String> parentClassName,
    APropertyArgs args,
    int step,
  ) {
    return AForeignKey._(
      args: args,
      step: step,
      nameDefault: element.displayName,
      dartType: element.type,
      entityParent: AEntity.of(
        element.type.element as ClassElement,
        args,
        parentClassName,
        step + 1,
      ),
      name: AForeignKeyX._name(element),
      version: AForeignKeyX._version(element),
      onDelete: AForeignKeyX._delValue(element),
      onUpdate: AForeignKeyX._updValue(element),
      className: className,
    );
  }
}

extension on Element {
  List<ClassElement> classes([int step = 0]) {
    final es = [
      ...library?.children.expand((e) => e.children) ?? <Element>[],
    ];
    final lst = [
      ...es.whereType<ClassElement>(),
      if (step < 4) ...es.expand((e) => e.classes(step + 1)),
    ];

    return lst;
  }
}

extension AForeignKeyXL on List<AForeignKey> {
  AForeignKey? of(String fieldName) {
    return firstWhereOrNull((e) => e.nameDefault == fieldName);
  }
}

extension AForeignKeyX on AForeignKey {
  String get typeNotSuffix =>
      dartType.toString().replaceFirst('?', '').replaceFirst('\$', '');
  String? rawCreateForeign(String self, String goal) => dartType.isDartCoreList
      ? null
      : 'FOREIGN KEY ($self) REFERENCES $typeNotSuffix '
          '($goal)'
          ' ON UPDATE ${onUpdate.str} ON DELETE ${onDelete.str}';
  static List<AForeignKey> fields(
    int step,
    APropertyArgs args,
    List<FieldElement> fields,
    String className,
    List<String> parentClassName,
    List<SuperFormalParameterElement> cons,
  ) {
    return [
      ...cons
          .where((e) => _checker.hasAnnotationOfExact(e))
          .map((e) => AForeignKey.fromSuperElement(
                e,
                className,
                parentClassName,
                args,
                step + 1,
              ))
          .toList(),
      ...fields
          .where((e) => _checker.hasAnnotationOfExact(e))
          .map((e) => AForeignKey.fromElement(
                e,
                e,
                className,
                parentClassName,
                args,
                step + 1,
              ))
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
