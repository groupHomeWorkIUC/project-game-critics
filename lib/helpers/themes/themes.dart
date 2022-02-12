import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    backgroundColor: LightThemeColors.backgroundColor,
    cardColor: LightThemeColors.cardColor,
    primaryColor: LightThemeColors.primaryColor,
    scaffoldBackgroundColor: LightThemeColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.backgroundColor,
      titleTextStyle: TextStyle(
        color: LightThemeColors.mainTextColor,
        fontSize: 17,
      ),
      iconTheme: IconThemeData(color: LightThemeColors.mainTextColor),
      actionsIconTheme: IconThemeData(color: LightThemeColors.mainTextColor),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.normal, color: LightThemeColors.mainTextColor), //Details titles
      headline2: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: LightThemeColors.mainTextColor), //List titles
      headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: LightThemeColors.mainTextColor), //Row titles on home page
      bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: LightThemeColors.mainTextColor), //Details content
      bodyText2: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: LightThemeColors.secondaryTextColor), //List content
      headline6: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: LightThemeColors.mainTextColor), //More text
      subtitle1: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: LightThemeColors.secondaryTextColor), //Date text
      subtitle2: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: LightThemeColors.secondaryTextColor), //Input field text
      button: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), //Button text
      overline: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: LightThemeColors.mainTextColor), //Login bottom text
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: LightThemeColors.primaryColor,
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: LightThemeColors.secondaryTextColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    backgroundColor: DarkThemeColors.backgroundColor,
    cardColor: DarkThemeColors.cardColor,
    primaryColor: DarkThemeColors.primaryColor,
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    //iconTheme: ,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkThemeColors.backgroundColor,
      titleTextStyle: TextStyle(
        color: DarkThemeColors.mainTextColor,
        fontSize: 17,
      ),
      iconTheme: IconThemeData(color: DarkThemeColors.mainTextColor),
      actionsIconTheme: IconThemeData(color: DarkThemeColors.mainTextColor),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.normal, color: DarkThemeColors.mainTextColor), //Details titles
      headline2: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: DarkThemeColors.mainTextColor), //List titles
      headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DarkThemeColors.mainTextColor), //Row titles on home page
      bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: DarkThemeColors.mainTextColor), //Details content
      bodyText2: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: DarkThemeColors.secondaryTextColor), //List content
      headline6: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: DarkThemeColors.mainTextColor), //More text
      subtitle1: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: DarkThemeColors.secondaryTextColor), //Date text
      subtitle2: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: DarkThemeColors.secondaryTextColor), //Input field text
      button: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: DarkThemeColors.mainTextColor), //Button text
      overline: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: DarkThemeColors.mainTextColor), //Login bottom text
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: DarkThemeColors.primaryColor,
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: DarkThemeColors.secondaryTextColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
  );
}
