import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
  appBarTheme: AppBarTheme(
      backgroundColor: DarkThemeColors.backgroundColor,
      titleTextStyle: TextStyle(
        color: DarkThemeColors.whiteTextColor,
        fontSize: 17,
      )),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w300,
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: DarkThemeColors.redColor,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  ),
);
