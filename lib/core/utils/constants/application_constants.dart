import 'package:flutter/material.dart';

class AppConstants {
  static const languagePath = "assets/lang";
  static const trLocale = Locale("tr");
  static const enLocale = Locale("en");

  static const List<Locale> supportedLocales = [
    trLocale,
    enLocale,
  ];
  static const List<String> supportedLanguageList = [
    "Türkçe",
    "English",
  ];
}
