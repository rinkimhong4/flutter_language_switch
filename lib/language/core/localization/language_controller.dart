import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_code/language/core/localization/supported_locales.dart';

class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('en');
  static const String _localeKey = 'selected_language';

  Locale get locale => _locale;

  LanguageController() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey);
    if (savedLocale != null && _isSupportedLocale(savedLocale)) {
      _locale = Locale(savedLocale);
    }
    notifyListeners();
  }

  bool _isSupportedLocale(String languageCode) {
    return supportedLocales.any(
      (locale) => locale.languageCode == languageCode,
    );
  }

  Future<void> changeLanguage(Locale locale) async {
    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}
