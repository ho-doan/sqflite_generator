import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sql_external_db/sql_external_db_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSqlExternalDb platform = MethodChannelSqlExternalDb();
  const MethodChannel channel = MethodChannel('sql_external_db');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.externalPath(''), '42');
  });
}
