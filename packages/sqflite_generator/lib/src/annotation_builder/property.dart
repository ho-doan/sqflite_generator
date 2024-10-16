import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:change_case/change_case.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/extensions/sql_type.dart';

import 'foreign_key.dart';

enum AlterTypeGen {
  add,
  @Deprecated('not support')
  rename,
  drop,
}

AlterTypeGen partAlterType(String v) => switch (v) {
      'add' => AlterTypeGen.add,
      // ignore: deprecated_member_use_from_same_package
      'rename' => AlterTypeGen.rename,
      'drop' => AlterTypeGen.drop,
      // ignore: deprecated_member_use_from_same_package
      _ => AlterTypeGen.rename,
    };

class AlterDBGen {
  final int version;
  final AlterTypeGen type;

  const AlterDBGen({
    required this.version,
    required this.type,
  });
}

class AProperty {
  final String? name;
  final int version;
  final String nameDefault;
  final DartType dartType;
  final bool rawFromDB;
  final String className;
  final int step;
  final List<AlterDBGen> alters;

  const AProperty({
    this.name,
    this.alters = const [],
    required this.step,
    required this.version,
    required this.nameDefault,
    required this.dartType,
    required this.className,
    this.rawFromDB = false,
  });
  String get typeSelect {
    if (dartType.isDartCoreInt) return 'int';
    if (dartType.isDartCoreBool) return 'bool';
    return 'String';
  }

  bool get _isQues => dartType.nullabilitySuffix == NullabilitySuffix.question;
  String get _isNull => _isQues ? '' : 'NOT NULL';
  String get _sqlType => dartType.typeSql(step)?.str ?? 'NONE';

  bool get isEnum => dartType.isEnum;

  String get nameToDB => (name ?? nameDefault).toSnakeCase();
  String get nameFromDB => '${className.$rm}_$nameToDB'.toSnakeCase();

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

  Map<int, List<String>> rawUpdate() {
    return {
      for (final item in alters.groupBy((e) => e.version).entries)
        item.key: [
          // TODO(hodoan): for rename
          for (final sql in item.value)
            if (sql.type == AlterTypeGen.add)
              '\'ALTER TABLE $className ADD $nameToDB $_sqlType;\''
        ],
    };
  }
}

extension on DartType {
  String get fieldSuffix =>
      nullabilitySuffix == NullabilitySuffix.question ? '?' : '';
}

extension StringXm on String {
  String get $rm => replaceFirst('\$', '');
  String get $rq => replaceFirst('?', '');
}

extension Aps on AProperty {
  String get fieldSuffix => '${name ?? nameDefault}${dartType.fieldSuffix}';
  String get defaultSuffix => '$nameDefault${dartType.fieldSuffix}';

  String selectField([String? child]) =>
      '\'\${childName}${className.$rm.toSnakeCase()}.$nameToDB as \${childName}$nameFromDB\'';
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
          fores.firstWhere((e) => e.nameDefault == item.nameDefault).nameToDB
        // '${fores.firstWhere((e) => e.nameDefault == item.nameDefault).entityParent?.primaryKeys.firstWhere((e) => e.name == item.name).nameToDB}'
        else
          item.name ?? item.nameDefault.toSnakeCase()
    ].join(', ');
    return 'PRIMARY KEY($keys)';
  }
}
