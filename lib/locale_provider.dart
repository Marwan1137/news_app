import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en', ''); // Default to English

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (locale != _locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}
