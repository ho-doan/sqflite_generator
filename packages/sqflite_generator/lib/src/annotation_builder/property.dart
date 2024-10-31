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

  @override
  toString() =>
      'nameDefault: $nameDefault, name: $name, nameToDB: $nameToDB, nameFromDB: $nameFromDB, dartType: $dartType, _isQues: $_isQues,'
      ' _sqlType: $_sqlType, _isNull: $_isNull'
      'rawFromDB: $rawFromDB';

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
  String get fieldSuffix => '${name ?? nameDefault}${dartType.fieldSuffix}';
  String get defaultSuffix => '$nameDefault${dartType.fieldSuffix}';

  String selectField([String? child]) =>
      '\'\${childName}${className.$rm.toSnakeCase()}.$nameToDB as \${childName}$nameFromDB\'';
}
