import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/annotation_builder/foreign_key.dart';
import 'package:sqflite_generator/src/annotation_builder/index.dart';
import 'package:sqflite_generator/src/annotation_builder/primary_key.dart';

import 'property.dart';

final _checker = const TypeChecker.fromRuntime(Column);

class AColumn extends AProperty {
  final String? converter;
  const AColumn._({
    required super.args,
    required this.converter,
    super.alters,
    super.name,
    required super.version,
    required super.dartType,
    required super.nameDefault,
    required super.className,
    required super.step,
  });
  factory AColumn.fromElement(
    FieldElement element,
    String className,
    List<String> parentClassName,
    APropertyArgs args,
    int step,
  ) {
    final type = element.type;

    return AColumn._(
      args: args.copyWithByElement(fieldName: element.displayName),
      alters: AColumnX._alters(element),
      converter: AColumnX._type(element),
      step: step,
      name: AColumnX._name(element),
      version: AColumnX._version(element),
      dartType: type,
      nameDefault: element.displayName,
      className: className,
    );
  }
  factory AColumn.fromConsElement(
    ParameterElement element,
    String className,
    List<String> parentClassName,
    APropertyArgs args,
    int step,
  ) {
    final type = element.type;
    return AColumn._(
      args: args.copyWithByElement(fieldName: element.displayName),
      alters: AColumnX._alters(element),
      converter: AColumnX._type(element),
      step: step,
      name: AColumnX._name(element),
      version: AColumnX._version(element),
      dartType: type,
      nameDefault: element.displayName,
      className: className,
    );
  }
}

extension AColumnX on AColumn {
  static List<AColumn> fields(
    int step,
    List<FieldElement> fields,
    String className,
    List<String> parentClassName,
    APropertyArgs args,
    List<ParameterElement> cons,
    List<APrimaryKey> primaries,
    List<AIndex> indies,
    List<AForeignKey> fores,
  ) {
    final aColumns =
        fields.where((e) => _checker.hasAnnotationOfExact(e)).toList();
    final columns = <ParameterElement>[];
    for (final f in cons) {
      if (primaries.any((e) => e.nameDefault == f.displayName)) {
        continue;
      }
      if (indies.any((e) => e.nameDefault == f.displayName)) {
        continue;
      }
      if (fores.any((e) => e.nameDefault == f.displayName)) {
        continue;
      }
      if (!aColumns.any((e) => e.displayName == f.displayName)) {
        columns.add(f);
      }
    }
    return [
      ...columns
          .map(
            (e) => AColumn.fromConsElement(
              e,
              className,
              parentClassName,
              args,
              step + 1,
            ),
          )
          .toList(),
      ...aColumns
          .map(
            (e) => AColumn.fromElement(
              e,
              className,
              parentClassName,
              args,
              step + 1,
            ),
          )
          .toList(),
    ];
  }

  static int _version(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('(super)')
            ?.getField('version')
            ?.toIntValue() ??
        -1;
  }

  static String? _name(Element field) {
    return _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('name')
        ?.toStringValue();
  }

  static String? _type(Element field) {
    final s = _checker
        .firstAnnotationOfExact(field)
        ?.getField('converter')
        ?.type
        .toString();
    if (s == 'Null') return null;
    return s;
  }

  static List<AlterDBGen> _alters(Element field) {
    final lst = _checker
        .firstAnnotationOfExact(field)
        ?.getField('(super)')
        ?.getField('alters')
        ?.toListValue();
    final alters = lst?.map((e) {
          final version = e.getField('version')?.toIntValue() ?? -1;
          final type =
              e.getField('type')?.getField('_name')?.toStringValue() ?? '';
          return AlterDBGen(
            version: version,
            type: partAlterType(type),
          );
        }).toList() ??
        [];
    return alters;
  }
}
