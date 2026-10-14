import 'package:evently/core/prefsmanager/prefesmanager.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = PrefsManager.getSavedTheme() ?? ThemeMode.light;
  String languageCode = PrefsManager.getSavedLang() ?? 'en';

  bool get isDark => themeMode == ThemeMode.dark;
  bool get isArabic => languageCode == 'ar';
  Locale get locale => Locale(languageCode);

  void changeTheme(ThemeMode mode) {
    if (themeMode == mode) return;
    themeMode = mode;
    PrefsManager.saveCurrentTheme(mode);
    notifyListeners();
  }

  void changeLanguage(String code) {
    if (languageCode == code) return;
    languageCode = code;
    PrefsManager.saveCurrentLang(code);
    notifyListeners();
  }
}