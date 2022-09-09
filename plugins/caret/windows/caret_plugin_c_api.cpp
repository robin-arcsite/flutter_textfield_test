#include "include/caret/caret_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "caret_plugin.h"

void CaretPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  caret::CaretPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
