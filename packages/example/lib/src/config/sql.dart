import 'package:sqflite_query/sqflite_query.dart';

import 'sql.config.dart';

@SqlConfig('doggie_database.db')
void configSql() => $configSql(null);
