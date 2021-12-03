import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    appBarTheme: AppBarTheme(
        backgroundColor: DarkThemeColors.backgroundColor,
        titleTextStyle: TextStyle(
          color: DarkThemeColors.whiteTextColor,
          fontSize: 17,
        )),
    textTheme: TextTheme(
      bodyText1: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      headline4: TextStyle(
        color: DarkThemeColors.redColor,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        color: DarkThemeColors.whiteTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      subtitle2: TextStyle(
        color: DarkThemeColors.whiteTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
      caption: TextStyle(
        color: DarkThemeColors.whiteTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: DarkThemeColors.greyTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      overline: TextStyle(
        color: DarkThemeColors.whiteTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        color: DarkThemeColors.whiteTextColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: DarkThemeColors.redColor,
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: DarkThemeColors.greyTextColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ));
