#include "caret_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <winuser.h>

#include <memory>
#include <sstream>

namespace caret {

// static
void CaretPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "caret",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<CaretPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

CaretPlugin::CaretPlugin() {}

CaretPlugin::~CaretPlugin() {}

void CaretPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("destroyCaret") == 0) {
    ::DestroyCaret();
    
    result->Success();
  } else {
    result->NotImplemented();
  }
}

}  // namespace caret
