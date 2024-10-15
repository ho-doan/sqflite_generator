import 'sql_external_db_platform_interface.dart';

class SqlExternalDb {
  const SqlExternalDb();

  static const instance = SqlExternalDb();

  Future<String?> externalPath(String bundleShared) {
    return SqlExternalDbPlatform.instance.externalPath(bundleShared);
  }
}
