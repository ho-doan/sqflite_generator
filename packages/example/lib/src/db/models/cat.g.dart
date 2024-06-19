// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// SqfliteModelGenerator
// **************************************************************************

// ignore_for_file: lines_longer_than_80_chars, prefer_relative_imports, directives_ordering, require_trailing_commas

extension CatQuery on Cat {
  static String createTable = '''CREATE TABLE IF NOT EXISTS Cat(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
			birth INTEGER,
			parent_id INTEGER,
			child_id INTEGER,
			FOREIGN KEY (parent_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
			FOREIGN KEY (child_id) REFERENCES Cat (id) ON UPDATE NO ACTION ON DELETE NO ACTION
	)''';

  static final $CatSelectArgs $default = $CatSelectArgs(
      id: true,
      parent: CatQuery.$default,
      child: CatQuery.$default,
      birth: true);

  static String $createSelect(
    $CatSelectArgs? select, [
    String childName = '',
  ]) =>
      select?.$check == true
          ? [
              if (select?.id ?? false)
                '${childName}cat.id as ${childName}cat_id',
              CatQuery.$createSelect(select?.parent, 'parent_'),
              CatQuery.$createSelect(select?.child, 'child_'),
              if (select?.birth ?? false)
                '${childName}cat.birth as ${childName}cat_birth'
            ].join(',')
          : $createSelect($default);
  static Future<List<Cat>> getAll(
    Database database, {
    $CatSelectArgs? select,
  }) async =>
      (await database.rawQuery('''SELECT ${$createSelect($default)} FROM Cat cat
 INNER JOIN Cat parent_cat ON parent_cat.id = cat.parent_id
 INNER JOIN Cat child_cat ON child_cat.id = cat.child_id
''') as List<Map>).map(Cat.fromDB).toList();
  Future<int> insert(Database database) async {
    final $catIdParent = await parent?.insert(database);
    final $catIdChild = await child?.insert(database);
    final $id = await database.rawInsert('''INSERT OR REPLACE INTO Cat (id,
parent_id,
child_id,
birth) 
       VALUES(?, ?, ?, ?)''', [
      id,
      $catIdParent,
      $catIdChild,
      birth,
    ]);
    return $id;
  }

  Future<int> update(Database database) async {
    await parent?.update(database);
    await child?.update(database);
    return await database
        .update('Cat', toDB(), where: "cat.id = ?", whereArgs: [id]);
  }

  static Future<Cat?> getById(
    Database database,
    int? id, {
    $CatSelectArgs? select,
  }) async {
    final res = (await database.rawQuery('''
SELECT 
${$createSelect(select)}
 FROM Cat cat
WHERE cat.id = ?
 INNER JOIN Cat parent_cat ON parent_cat.id = cat.parent_id
 INNER JOIN Cat child_cat ON child_cat.id = cat.child_id
''', [id]) as List<Map>);
    return res.isNotEmpty ? Cat.fromDB(res.first) : null;
  }

  Future<void> delete(Database database) async {
    await database.rawQuery('''DELETE FROM Cat cat WHERE cat.id = ?''', [id]);
  }

  static Future<void> deleteById(
    Database database,
    int? id,
  ) async {
    await database.rawQuery('''DELETE FROM Cat cat WHERE cat.id = ?''', [id]);
  }

  static Future<void> deleteAll(Database database) async {
    await database.rawDelete('''DELETE * FROM Cat''');
  }

  static Cat $fromDB(
    Map json, [
    String childName = '',
  ]) =>
      Cat(
        id: json['${childName}cat_id'] as int?,
        parent: Cat?.fromDB(json, 'parent_'),
        child: Cat?.fromDB(json, 'child_'),
        birth: DateTime.fromMillisecondsSinceEpoch(
          json['${childName}cat_birth'] as int? ?? -1,
        ),
      );
  Map<String, dynamic> $toDB() => {
        'id': id,
        'parent_id': parent?.id,
        'child_id': child?.id,
        'birth': birth?.millisecondsSinceEpoch,
      };
}

class $CatSelectArgs {
  const $CatSelectArgs({
    this.id,
    this.parent,
    this.child,
    this.birth,
  });

  final bool? id;

  final $CatSelectArgs? parent;

  final $CatSelectArgs? child;

  final bool? birth;

  bool get $check =>
      id == true ||
      parent?.$check == true ||
      child?.$check == true ||
      birth == true;
}

class $CatWhereArgs {
  const $CatWhereArgs({
    this.id,
    this.parent,
    this.child,
    this.birth,
  });

  final int? id;

  final $CatWhereArgs? parent;

  final $CatWhereArgs? child;

  final DateTime? birth;
}
