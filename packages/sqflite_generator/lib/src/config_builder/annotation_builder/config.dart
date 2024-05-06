import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

final _checker = const TypeChecker.fromRuntime(SqlConfig);

class AConfig {
  const AConfig(
    this.name, {
    this.version = 1,
    this.isForeign = true,
  });
  final String name;
  final int version;
  final bool isForeign;
  factory AConfig.fromElement(Element element) {
    return AConfig(
      AConfigX._name(element),
      version: AConfigX._version(element),
      isForeign: AConfigX._isForeign(element),
    );
  }
}

extension AConfigX on AConfig {
  static AConfig fromElement(Element element) {
    return AConfig.fromElement(element);
  }

  static String _name(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('name')
            ?.toStringValue() ??
        'wtf';
  }

  static int _version(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('version')
            ?.toIntValue() ??
        -1;
  }

  static bool _isForeign(Element field) {
    return _checker
            .firstAnnotationOfExact(field)
            ?.getField('isForeign')
            ?.toBoolValue() ??
        true;
  }
}
