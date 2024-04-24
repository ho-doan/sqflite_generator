import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../annotation_builder/entity.dart';

enum TypeSql {
  integer,
  dateTime,
  bool,
  double,
  list,
  map,
  string,
  enumerated,
  uint8List,
}

extension TypeSqlX on TypeSql {
  String get str {
    switch (this) {
      case TypeSql.integer:
      case TypeSql.dateTime:
      case TypeSql.bool:
        return 'INTEGER';
      case TypeSql.double:
        return 'REAL';
      case TypeSql.list:
      case TypeSql.map:
      case TypeSql.string:
      case TypeSql.enumerated:
        return 'TEXT';
      case TypeSql.uint8List:
        return 'BLOB';
    }
  }
}

extension DartTypeX on DartType {
  /// current support
  /// * bool
  /// * double
  /// * int
  /// * list
  /// * map
  /// * string
  /// * enum
  /// * Uint8list
  /// * DateTime
  TypeSql? get typeSql {
    if (isDartCoreBool) return TypeSql.bool;
    if (isDartCoreDouble) return TypeSql.double;
    if (isDartCoreInt) return TypeSql.integer;
    if (isDartCoreList) return TypeSql.list;
    if (isDartCoreMap) return TypeSql.map;
    if (isDartCoreString) return TypeSql.string;
    if (toString().contains('Uint8List')) return TypeSql.uint8List;
    if (toString().contains('DateTime')) return TypeSql.dateTime;
    if (isEnum) {
      return TypeSql.enumerated;
    }
    if (element != null && element is ClassElement) {
      final parent = AEntity.fromElement(element as ClassElement);
      return parent.primaryKeys.first.dartType.typeSql;
    }
    return null;
  }

  bool get isEnum {
    bool check = isDartCoreEnum;
    if (this is InterfaceType) {
      check = (this as InterfaceType).element is EnumElement;
    }
    return check;
  }
}
