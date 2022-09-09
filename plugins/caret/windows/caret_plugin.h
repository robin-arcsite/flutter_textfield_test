#ifndef FLUTTER_PLUGIN_CARET_PLUGIN_H_
#define FLUTTER_PLUGIN_CARET_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace caret {

class CaretPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CaretPlugin();

  virtual ~CaretPlugin();

  // Disallow copy and assign.
  CaretPlugin(const CaretPlugin&) = delete;
  CaretPlugin& operator=(const CaretPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace caret

#endif  // FLUTTER_PLUGIN_CARET_PLUGIN_H_
