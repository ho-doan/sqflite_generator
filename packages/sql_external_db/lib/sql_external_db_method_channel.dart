import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sql_external_db_platform_interface.dart';

/// An implementation of [SqlExternalDbPlatform] that uses method channels.
class MethodChannelSqlExternalDb extends SqlExternalDbPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sql_external_db');

  @override
  Future<String?> externalPath(String bundleShared) async {
    final version =
        await methodChannel.invokeMethod<String>('externalPath', bundleShared);
    return version;
  }
}
