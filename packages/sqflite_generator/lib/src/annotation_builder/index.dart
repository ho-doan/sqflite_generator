import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(Index);

class AIndex extends AProperty {
  final bool unique;

  const AIndex._({
    required super.args,
    // TODO(hodoan): unused
    // ignore: unused_element
    this.unique = false,
    super.name,
    required super.version,
    // TODO(hodoan): fix this
    required super.step,
    required super.nameDefault,
    required super.dartType,
    required super.className,
  });
  factory AIndex.fromElement(
    FieldElement element,
    APropertyArgs args,
    String className,
    List<String> parentClassName,
    int step,
  ) {
    return AIndex._(
      args: args.copyWithByElement(
        fieldName: element.displayName,
      ),
      step: step,
      nameDefault: element.displayName,
      dartType: element.type,
      name: AIndexX._name(element),
      version: AIndexX._version(element),
      className: className,
    );
  }
}

extension AIndexX on AIndex {
  static List<AIndex> fields(
    List<FieldElement> fields,
    APropertyArgs args,
    String className,
    List<String> parentClassName,
    int step,
  ) {
    return fields
        .where((e) => _checker.hasAnnotationOfExact(e))
        .map(
          (e) => AIndex.fromElement(
            e,
            args,
            className,
            parentClassName,
            step,
          ),
        )
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
