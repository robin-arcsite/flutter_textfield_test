import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'caret_platform_interface.dart';

/// An implementation of [CaretPlatform] that uses method channels.
class MethodChannelCaret extends CaretPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('caret');

  @override
  destroyCaret() async {
    await methodChannel.invokeMethod('destroyCaret');
  }
}
