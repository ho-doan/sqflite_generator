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

abstract class WhereModel<T> {
  final String field;

  const WhereModel({
    required this.field,
  });
}

abstract class EntityQuery {
  const EntityQuery();
}

extension $EntityQuery on EntityQuery {
  /// EXISTS
  WhereResult<String> exists(String subQuery) =>
      WhereResult('', 'EXISTS', '($subQuery)');

  /// NOT EXISTS
  WhereResult<String> notExists(String subQuery) =>
      WhereResult('', 'NOT EXISTS', '($subQuery)');
}

class WhereResult<T> {
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

extension $WhereExt<T> on WhereModel<T> {
  /// v = 0
  WhereResult<T> equal(T value) =>
      WhereResult(field.replaceFirst('^_', ''), '=', value);

  /// v IN (1,2,3)
  WhereResult<String> in$(List<T> value) => WhereResult(
        field.replaceFirst('^_', ''),
        'IN',
        '(${value.map((e) => e is int ? e : "'$e'").join(',')})',
      );

  /// v NOT IN (1,2,3)
  WhereResult<String> notIn(List<T> value) => WhereResult(
      field.replaceFirst('^_', ''), 'NOT IN', '(${value.join(',')})');

  /// v IS NOT NULL
  WhereResult<String> notNull() =>
      WhereResult(field.replaceFirst('^_', ''), 'IS NOT', 'NULL');

  /// v IS NULL
  WhereResult<String> null$() =>
      WhereResult(field.replaceFirst('^_', ''), 'IS', 'NULL');

  /// v <> 0
  WhereResult<T> notEqual(T value) =>
      WhereResult(field.replaceFirst('^_', ''), '<>', value);
}

extension $WhereExtString on WhereModel<String> {
  /// v IN (SELECT key from tbl_a)
  WhereResult<String> inQuery(String query) =>
      WhereResult(field.replaceFirst('^_', ''), 'IN', '($query)');

  /// v NOT IN (SELECT key from tbl_a)
  WhereResult<String> notInQuery(String query) =>
      WhereResult(field.replaceFirst('^_', ''), 'NOT IN', '($query)');

  /// v LIKE 'value%'
  WhereResult<String> likeStart(String value) =>
      WhereResult(field.replaceFirst('^_', ''), 'LIKE', '\'$value%\'');

  /// v LIKE '%value'
  WhereResult<String> likeEnd(String value) =>
      WhereResult(field.replaceFirst('^_', ''), 'LIKE', '\'%$value\'');

  /// v LIKE '%value%'
  WhereResult<String> likeContain(String value) =>
      WhereResult(field.replaceFirst('^_', ''), 'LIKE', '\'%$value%\'');

  /// v LIKE '%10\\%%' => LIKE 10%
  WhereResult<String> likeContainEscape(String value, String escape) =>
      WhereResult(field.replaceFirst('^_', ''), 'LIKE',
          '\'%$value%\' ESCAPE \'$escape\'');

  /// * [start] = Br
  /// * [end] = wn
  /// * [character] = _
  /// * [count] = 1, [count] = 2 => [character]  _ => __
  /// * v LIKE '%Br_wn%'
  WhereResult<String> likeContainByCharacter(
          String start, String end, String character, int count) =>
      WhereResult(field.replaceFirst('^_', ''), 'LIKE',
          '\'%$start${character * count}$end%\'');
}

extension $WhereExtInt on WhereModel<int> {
  /// v < 0
  WhereResult<int> lessThan(int value) =>
      WhereResult(field.replaceFirst('^_', ''), '<', value);

  /// v > 0
  WhereResult<int> greaterThan(int value) =>
      WhereResult(field.replaceFirst('^_', ''), '>', value);

  /// v >= 0
  WhereResult<int> greaterThanOrEqual(int value) =>
      WhereResult(field.replaceFirst('^_', ''), '>=', value);

  /// v <= 0
  WhereResult<int> lessThanOrEqual(int value) =>
      WhereResult(field.replaceFirst('^_', ''), '<=', value);

  /// v BETWEEN 0 and 1
  WhereResult<int> between(int from, int to) =>
      WhereResult(field.replaceFirst('^_', ''), 'BETWEEN', from, to);

  /// v NOT BETWEEN 0 and 1
  WhereResult<int> notBetween(int from, int to) =>
      WhereResult(field.replaceFirst('^_', ''), 'NOT BETWEEN', from, to);
}
