import 'package:sqflite/sqflite.dart';
import 'package:sqflite_query/sqflite_query.dart';

import 'sql.db_config.dart';

@SqlConfig('doggie_database.db')
Future<Database> configSql() => $configSql();

extension DatabaseX on Database {
  Future<void> clearDatabase() => $clearDatabase(this);
}
