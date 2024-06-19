import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:change_case/change_case.dart';
import 'package:sqflite_generator/src/extensions/sql_type.dart';

import 'foreign_key.dart';

class AProperty {
  final String? name;
  final int version;
  final String nameDefault;
  final DartType dartType;
  final bool rawFromDB;
  final String className;

  const AProperty({
    this.name,
    required this.version,
    required this.nameDefault,
    required this.dartType,
    required this.className,
    this.rawFromDB = false,
  });
  bool get _isQues => dartType.nullabilitySuffix == NullabilitySuffix.question;
  String get _isNull => _isQues ? '' : 'NOT NULL';
  String get _sqlType => dartType.typeSql?.str ?? 'NONE';

  bool get isEnum => dartType.isEnum;

  String get nameToDB => (name ?? nameDefault).toSnakeCase();
  String get nameFromDB => '${className}_$nameToDB'.toSnakeCase();

  /// ```
  /// @primaryKey
  /// @ForeignKey(name: 'productId')
  /// final Product? product;
  /// ```
  /// * [isFore] = true
  /// ```
  /// @primaryKey
  /// @ForeignKey(name: 'productId')
  /// final Product? product;

  /// @primaryKey
  /// @ForeignKey(name: 'clientId')
  /// final Client? client;
  /// ```
  /// * [isIds] = true
  /// ```
  /// @primaryKey
  /// @ForeignKey(name: 'clientId')
  /// ```
  /// * [autoId] = true
  String rawCreate({
    bool isId = false,
    bool autoId = false,
    bool isIds = false,
    bool isFore = false,
  }) =>
      isFore
          ? ''
          : [
              nameToDB,
              _sqlType,
              if (isId && !isIds) 'PRIMARY KEY',
              if (autoId && !isIds) 'AUTOINCREMENT',
              _isNull,
            ].where((e) => e.isNotEmpty).join(' ');
}

extension on DartType {
  String get fieldSuffix =>
      nullabilitySuffix == NullabilitySuffix.question ? '?' : '';
}

extension Aps on AProperty {
  String get fieldSuffix => '${name ?? nameDefault}${dartType.fieldSuffix}';
  String get defaultSuffix => '$nameDefault${dartType.fieldSuffix}';
}

extension APropertyX on List<AProperty> {
  /// ```
  /// @primaryKey
  /// @ForeignKey(name: 'productId')
  /// final Product? product;
  /// ```
  /// * [isFore] = true
  String rawCreate(List<AForeignKey> fores) {
    if (length < 2) return '';
    final keys = [
      for (final item in this)
        if (fores.any((e) => e.nameDefault == item.nameDefault))
          '${item.nameDefault}_id'
        else
          item.name ?? item.nameDefault
    ].join(', ');
    return 'PRIMARY KEY($keys)';
  }
}
