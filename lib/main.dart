import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/dark_theme.dart';
import 'package:project_game_critics/route_management.dart';
import 'package:project_game_critics/services/translation_service.dart';

void main() {
  runApp(GetMaterialApp(
    //This code 
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: child!,
      );
    },
    initialRoute: "/Home",
    getPages: RouteManagement.routeList,
    debugShowCheckedModeBanner: false,
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    theme: darkTheme,
  ));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
