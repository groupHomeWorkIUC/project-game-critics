import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/languages/english.dart';
import 'package:project_game_critics/helpers/languages/turkish.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');
  static const turkish = Locale('tr', 'TR');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['English', 'Turkish'];

  // Supported locales
  // Needs to be same order with langs
  static const locales = [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr': trTR,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
