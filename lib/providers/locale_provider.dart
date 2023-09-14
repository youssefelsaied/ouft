import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/l10n.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  static String defaultLocale = Platform.localeName.substring(0, 2);
  Locale _locale = Locale(defaultLocale);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    setSavedLanguage(locale.languageCode.toString());
    notifyListeners();
  }

  Future<void> setSavedLanguage(languageCode) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
      "userLanguage",
      languageCode,
    );
  }

  Future<void> getSavedLanguage() async {
    final SharedPreferences prefs = await _prefs;
    print("getSavedLanguage");

    if (!prefs.containsKey('userLanguage')) {
      print("NOSavedLanguage");
      return;
    }
    final savedLocale = prefs.getString("userLanguage");

    if (savedLocale!.isNotEmpty) {
      _locale = Locale(savedLocale);
      notifyListeners();
    }
  }

  void clearLocale() {
    _locale = Locale('en');
    notifyListeners();
  }
}
