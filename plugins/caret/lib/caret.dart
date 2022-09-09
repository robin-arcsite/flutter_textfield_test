import 'caret_platform_interface.dart';

class Caret {
  static Future destroyCaret() {
    return CaretPlatform.instance.destroyCaret();
  }
}
