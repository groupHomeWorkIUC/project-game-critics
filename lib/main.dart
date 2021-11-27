import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/bindings/initial_binding.dart';
import 'package:project_game_critics/helpers/themes/dark_theme.dart';
import 'package:project_game_critics/pages/login_page.dart';
import 'package:project_game_critics/route_management.dart';
import 'package:project_game_critics/services/translation_service.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/Splash",
    getPages: RouteManagement.routeList,
    debugShowCheckedModeBanner: false,
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    theme: darkTheme,
  ));
}
