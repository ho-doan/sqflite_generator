import 'package:change_case/change_case.dart';
import 'package:sqflite/sqflite.dart';

abstract class EEntity {
  const EEntity();
}

class EQuery<T extends EEntity, K> {
  final String name;

  const EQuery(this.name);
}

class DataBaseQuery<T extends EEntity> {
  const DataBaseQuery(
    this.entity, {
    required this.type,
    this.rawSelect,
    this.rawWhere,
    this.values,
  });
  final T entity;
  final Type type;
  final String? rawSelect;
  final String? rawWhere;
  final List<dynamic>? values;

  DataBaseQuery copyWith({
    String? rawSelect,
    String? rawWhere,
    List<dynamic>? values,
  }) =>
      DataBaseQuery(
        entity,
        type: type,
        rawSelect: rawSelect ?? this.rawSelect,
        rawWhere: rawWhere ?? this.rawWhere,
        values: values ?? this.values,
      );
}

extension DataBaseQueryX on DataBaseQuery {
  DataBaseQuery select<T extends EEntity, K>(List<EQuery<T, dynamic>> lst) {
    String sSelect =
        lst.map((e) => '${e.name} as ${e.name.toSnakeCase()}').join(', ');
    if (lst.isEmpty) sSelect = '*';
    return copyWith(
        rawSelect: 'SELECT $sSelect FROM '
            '${entity.runtimeType.toString()} as ${entity.toString().toSnakeCase()}');
  }

  DataBaseQuery where<T extends EEntity, K>(List<Qu> lst) {
    String raw = lst.map((e) => '${e.key.name} = ?').join(' AND ');
    List<dynamic> values = lst.map((e) => e.value).toList();
    if (lst.isEmpty) return this;
    return copyWith(
      rawWhere: 'WHERE $raw',
      values: values,
    );
  }

  String get raw => [rawSelect, rawWhere].join(' ');
  Future<List<Map<String, dynamic>>> executed(Database db) =>
      db.rawQuery(raw, values);
}

typedef Qu<T extends EEntity, K> = MapEntry<EQuery<T, K>, K>;
