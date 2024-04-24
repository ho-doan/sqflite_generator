import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:sqflite_generator/src/extensions/sql_type.dart';

class AProperty {
  final String? name;
  final String nameDefault;
  final DartType dartType;
  final FieldElement element;
  final bool rawFromJson;

  const AProperty({
    this.name,
    required this.nameDefault,
    required this.dartType,
    required this.element,
    this.rawFromJson = false,
  });
  bool get _isQues => dartType.nullabilitySuffix == NullabilitySuffix.question;
  String get _isNull => _isQues ? '' : 'NOT NULL';
  String get _sqlType => dartType.typeSql?.str ?? 'NONE';

  bool get isEnum => dartType.isEnum;

  String rawCreate({
    bool isId = false,
    bool autoId = false,
    bool isIds = false,
  }) =>
      [
        name ?? nameDefault,
        _sqlType,
        if (isId && !isIds) 'PRIMARY KEY',
        if (autoId && !isIds) 'AUTOINCREMENT',
        _isNull,
      ].where((e) => e.isNotEmpty).join(' ');
}

extension APropertyX on List<AProperty> {
  String get rawCreate {
    if (length < 2) return '';
    final keys = map((e) => e.name ?? e.nameDefault).join(',');
    return 'PRIMARY KEY($keys)';
  }

  List<AProperty> get lst {
    final List<AProperty> l = [];
    for (final item in this) {
      if (l.any((e) => e.nameDefault == item.nameDefault)) {
        continue;
      } else {
        l.add(item);
      }
    }
    return l;
  }
}
