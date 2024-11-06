extension StringWhere on String? {
  String get whereStr {
    if (this == null || this!.isEmpty) return '';
    return 'WHERE $this';
  }
}

enum OrderByType { asc, desc }

extension $OrderByType on OrderByType? {
  OrderBy<T>? of<T extends WhereModel>(T field) => switch (this) {
        OrderByType.asc => OrderBy.asc(field),
        OrderByType.desc => OrderBy.desc(field),
        _ => null,
      };
}

class OrderBy<T extends WhereModel> {
  const OrderBy._(this.field, this.type);
  final T field;
  final String type;
  factory OrderBy.asc(T field) => OrderBy._(field, 'ASC');
  factory OrderBy.desc(T field) => OrderBy._(field, 'DESC');
}

abstract class WhereModel<T, M> {
  final String field;

  final String self;

  final String name;

  final String model;

  final String nameCast;

  const WhereModel({
    required this.field,
    required this.self,
    required this.name,
    required this.model,
    required this.nameCast,
  });
}

abstract class EntityQuery {
  const EntityQuery();
}

extension $EntityQuery<T, M> on EntityQuery {
  /// EXISTS
  WhereResult<String, M> exists(String subQuery) =>
      WhereResult('', 'EXISTS', '($subQuery)');

  /// NOT EXISTS
  WhereResult<String, M> notExists(String subQuery) =>
      WhereResult('', 'NOT EXISTS', '($subQuery)');
}

class WhereResult<T, M> {
  final String key;
  final T value;
  final int? value2;
  final String compare;

  WhereResult(
    this.key,
    this.compare,
    this.value, [
    this.value2,
  ]);
}

extension $WhereResult on Set<WhereResult>? {
  String get whereSql =>
      this
          ?.map((e) => [
                e.key,
                e.compare,
                if (e.value is String &&
                    !['IN', 'NOT IN', 'LIKE', 'EXISTS'].contains(e.compare))
                  "'${e.value}'"
                else if (e.value is bool)
                  e.value ? 1 : 0
                else
                  e.value,
                if (e.value2 != null) 'AND ${e.value2}',
              ].join(' '))
          .join(' AND ')
          .whereStr ??
      '';
}

extension $WhereResultLst on List<Set<WhereResult>>? {
  String get whereSql =>
      this
          ?.map((e) => e.whereSql.replaceFirst('WHERE ', ''))
          .where((e) => e.isNotEmpty)
          .map((e) => '($e)')
          .join(' OR ')
          .whereStr ??
      '';
}

extension $WhereExt<T, M> on WhereModel<T, M> {
  /// v = 0
  WhereResult<T, M> equal(T value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), '=', value);

  /// v IN (1,2,3)
  WhereResult<String, M> in$(List<T> value) => WhereResult(
        field.replaceFirst(RegExp('^_'), ''),
        'IN',
        '(${value.map((e) => e is int ? e : "'$e'").join(',')})',
      );

  /// v NOT IN (1,2,3)
  WhereResult<String, M> notIn(List<T> value) => WhereResult(
        field.replaceFirst(RegExp('^_'), ''),
        'NOT IN',
        '(${value.map((e) => e is int ? e : "'$e'").join(',')})',
      );

  /// v IS NOT NULL
  WhereResult<String, M> notNull() =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'IS NOT', 'NULL');

  /// v IS NULL
  WhereResult<String, M> null$() =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'IS', 'NULL');

  /// v <> 0
  WhereResult<T, M> notEqual(T value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), '<>', value);
}

extension $WhereExtString<M> on WhereModel<String, M> {
  /// v IN (SELECT key from tbl_a)
  WhereResult<String, M> inQuery(String query) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'IN', '($query)');

  /// v NOT IN (SELECT key from tbl_a)
  WhereResult<String, M> notInQuery(String query) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'NOT IN', '($query)');

  /// v LIKE 'value%'
  WhereResult<String, M> likeStart(String value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'LIKE', '\'$value%\'');

  /// v LIKE '%value'
  WhereResult<String, M> likeEnd(String value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'LIKE', '\'%$value\'');

  /// v LIKE '%value%'
  WhereResult<String, M> likeContain(String value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'LIKE', '\'%$value%\'');

  /// v LIKE '%10\\%%' => LIKE 10%
  WhereResult<String, M> likeContainEscape(String value, String escape) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'LIKE',
          '\'%$value%\' ESCAPE \'$escape\'');

  /// * [start] = Br
  /// * [end] = wn
  /// * [character] = _
  /// * [count] = 1, [count] = 2 => [character]  _ => __
  /// * v LIKE '%Br_wn%'
  WhereResult<String, M> likeContainByCharacter(
          String start, String end, String character, int count) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'LIKE',
          '\'%$start${character * count}$end%\'');
}

extension $WhereExtInt<M> on WhereModel<int, M> {
  /// v < 0
  WhereResult<int, M> lessThan(int value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), '<', value);

  /// v > 0
  WhereResult<int, M> greaterThan(int value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), '>', value);

  /// v >= 0
  WhereResult<int, M> greaterThanOrEqual(int value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), '>=', value);

  /// v <= 0
  WhereResult<int, M> lessThanOrEqual(int value) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), '<=', value);

  /// v BETWEEN 0 and 1
  WhereResult<int, M> between(int from, int to) =>
      WhereResult(field.replaceFirst(RegExp('^_'), ''), 'BETWEEN', from, to);

  /// v NOT BETWEEN 0 and 1
  WhereResult<int, M> notBetween(int from, int to) => WhereResult(
      field.replaceFirst(RegExp('^_'), ''), 'NOT BETWEEN', from, to);
}
