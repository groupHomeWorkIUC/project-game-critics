import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_game_critics/helpers/themes/themes.dart';
import 'package:project_game_critics/route_management.dart';
import 'package:project_game_critics/services/translation_service.dart';

void main() async {
  await GetStorage.init('GameCritics');
  runApp(materialApp);
}

GetMaterialApp materialApp = GetMaterialApp(
  builder: (context, child) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: child!,
    );
  },
  initialRoute: RouteManagement.initialRoute,
  getPages: RouteManagement.routeList,
  debugShowCheckedModeBanner: false,
  locale: LocalizationService.locale,
  fallbackLocale: LocalizationService.fallbackLocale,
  translations: LocalizationService(),
  darkTheme: Themes.darkTheme,
  theme: Themes.lightTheme,
  themeMode: ThemeMode.light,
);

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
