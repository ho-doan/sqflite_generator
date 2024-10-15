import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sql_external_db_method_channel.dart';

abstract class SqlExternalDbPlatform extends PlatformInterface {
  /// Constructs a SqlExternalDbPlatform.
  SqlExternalDbPlatform() : super(token: _token);

  static final Object _token = Object();

  static SqlExternalDbPlatform _instance = MethodChannelSqlExternalDb();

  /// The default instance of [SqlExternalDbPlatform] to use.
  ///
  /// Defaults to [MethodChannelSqlExternalDb].
  static SqlExternalDbPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SqlExternalDbPlatform] when
  /// they register themselves.
  static set instance(SqlExternalDbPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> externalPath(String bundleShared) {
    throw UnimplementedError('externalPath() has not been implemented.');
  }
}
