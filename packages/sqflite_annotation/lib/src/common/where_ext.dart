extension StringWhere on String? {
  String get whereStr {
    if (this == null || this!.isEmpty) return '';
    return 'WHERE $this';
  }
}
