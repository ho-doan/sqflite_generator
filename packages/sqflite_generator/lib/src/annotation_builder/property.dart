import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:change_case/change_case.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';
import 'package:sqflite_generator/src/extensions/sql_type.dart';

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
  final List<String> parentClassName;

  const AProperty({
    required this.parentClassName,
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
  String get _sqlType =>
      dartType
          .typeSql(
            step,
            parentClassName,
          )
          ?.str ??
      'NONE';

  bool get isEnum => dartType.isEnum;

  String get nameToDB => (name ?? nameDefault).toSnakeCase();
  String get nameFromDB => '${className.$rm}_$nameToDB'.toSnakeCase();

  @override
  toString() =>
      'nameDefault: $nameDefault, name: $name, nameToDB: $nameToDB, nameFromDB: $nameFromDB, dartType: $dartType, _isQues: $_isQues,'
      ' _sqlType: $_sqlType, _isNull: $_isNull'
      'rawFromDB: $rawFromDB, parentClassName: $parentClassName';

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
  String rawCreate(
    String? name, {
    bool isId = false,
    bool autoId = false,
    bool isIds = false,
  }) {
    return [
      name ?? nameToDB.toSnakeCase(),
      _sqlType,
      if (isId && !isIds) 'PRIMARY KEY',
      if (autoId && !isIds) 'AUTOINCREMENT',
      _isNull,
    ].where((e) => e.isNotEmpty).join(' ');
  }

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
  /// [fieldName] is null for primary key self
  String _fieldNameFull(String? fieldName) {
    if (parentClassName.length > 1) {
      return [
        if (fieldName != null) fieldName,
        ...parentClassName.sublist(0, parentClassName.length - 1),
        className,
        nameDefault
      ].join('_');
    } else if (parentClassName.isNotEmpty) {
      return [
        if (fieldName != null) fieldName,
        className,
        nameDefault,
      ].join('_');
    }
    return nameDefault;
  }

  String fieldNameFull3(String? fieldName) {
    if (parentClassName.length > 1) {
      return [
        if (fieldName != null) fieldName,
        // ...parentClassName,
        parentClassName.last,
        className,
        nameDefault
      ].join('_');
    } else if (parentClassName.isNotEmpty) {
      return [
        if (fieldName != null) fieldName,
        className,
        nameDefault,
      ].join('_');
    }
    return nameDefault;
  }

  List<String> fieldNameFull4(String? fieldName) {
    if (parentClassName.length > 1) {
      return [
        if (fieldName != null) fieldName,
        parentClassName.first,
        ...parentClassName.sublist(2),
        // parentClassName.last,
        className,
        nameDefault
      ].map((e) => e.toCamelCase()).toList();
    } else if (parentClassName.isNotEmpty) {
      return [
        if (fieldName != null) fieldName,
        // ...parentClassName,
        ...parentClassName,
        // className,
        nameDefault,
      ];
    }
    return [nameDefault];
  }

  List<String> fieldNameFull5(String? fieldName) {
    if (parentClassName.length > 1) {
      return [
        if (fieldName != null) fieldName,
        parentClassName.first,
        ...parentClassName.sublist(1),
        // parentClassName.last,
        className,
        nameDefault
      ].map((e) => e.toCamelCase()).toList();
    } else if (parentClassName.isNotEmpty) {
      return [
        if (fieldName != null) fieldName,
        // ...parentClassName,
        ...parentClassName,
        className,
        nameDefault,
      ];
    }
    return [nameDefault];
  }

  String get _fieldNameFullForForeign {
    if (parentClassName.length > 1) {
      return [...parentClassName.sublist(1), className, nameDefault].join('_');
    }
    return nameDefault;
  }

  String get fieldNameFull => _fieldNameFull(null).toSnakeCase();

  String fieldNameFull2(String fieldName) =>
      _fieldNameFull(fieldName).toSnakeCase();

  String get fieldNameFullForForeign => _fieldNameFullForForeign.toSnakeCase();

  String get fieldSuffix => '${name ?? nameDefault}${dartType.fieldSuffix}';
  String get defaultSuffix => '$nameDefault${dartType.fieldSuffix}';

  String selectField([String? child]) =>
      '\'\${childName}${className.$rm.toSnakeCase()}.$nameToDB as \${childName}$nameFromDB\'';
}
