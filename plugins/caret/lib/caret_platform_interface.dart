import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'caret_method_channel.dart';

abstract class CaretPlatform extends PlatformInterface {
  /// Constructs a CaretPlatform.
  CaretPlatform() : super(token: _token);

  static final Object _token = Object();

  static CaretPlatform _instance = MethodChannelCaret();

  /// The default instance of [CaretPlatform] to use.
  ///
  /// Defaults to [MethodChannelCaret].
  static CaretPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CaretPlatform] when
  /// they register themselves.
  static set instance(CaretPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future destroyCaret() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
