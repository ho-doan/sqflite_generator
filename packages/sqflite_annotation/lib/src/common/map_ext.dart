extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
        <K, List<E>>{},
        (Map<K, List<E>> map, E element) =>
            map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
      );
  Map<String, List<E>> groupByDB<K>(List<K> Function(E) keyFunction,
          String Function(List<K> ks) mergeKey) =>
      fold(
        <String, List<E>>{},
        (Map<String, List<E>> map, E element) => map
          ..putIfAbsent(mergeKey(keyFunction(element)), () => <E>[])
              .add(element),
      );
}
