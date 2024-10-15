import 'package:flutter_test/flutter_test.dart';
import 'package:sql_external_db/sql_external_db.dart';
import 'package:sql_external_db/sql_external_db_platform_interface.dart';
import 'package:sql_external_db/sql_external_db_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSqlExternalDbPlatform
    with MockPlatformInterfaceMixin
    implements SqlExternalDbPlatform {
  @override
  Future<String?> externalPath(String bundleShared) => Future.value('42');
}

void main() {
  final SqlExternalDbPlatform initialPlatform = SqlExternalDbPlatform.instance;

  test('$MethodChannelSqlExternalDb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSqlExternalDb>());
  });

  test('getPlatformVersion', () async {
    SqlExternalDb sqlExternalDbPlugin = const SqlExternalDb();
    MockSqlExternalDbPlatform fakePlatform = MockSqlExternalDbPlatform();
    SqlExternalDbPlatform.instance = fakePlatform;

    expect(await sqlExternalDbPlugin.externalPath(''), '42');
  });
}
