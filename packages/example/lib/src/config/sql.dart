import 'package:sqflite_query/sqflite_query.dart';

import 'sql.db_config.dart';

@SqlConfig('doggie_database.db')
void configSql() => $configSql(null);
