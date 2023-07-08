import 'package:flutter/material.dart';

class LocaleModel {
  final Locale locale;
  final String name;

  LocaleModel(this.locale, this.name);
}

class AppLocale {
  static final List<LocaleModel> localeList = [
    LocaleModel(const Locale('ru', 'RU'), 'Русский'),
    LocaleModel(const Locale('uz', 'UZ'), 'O`zbekcha'),
  ];
}