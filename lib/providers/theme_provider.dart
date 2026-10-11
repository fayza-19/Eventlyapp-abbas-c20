import 'package:flutter/material.dart';

import '../core/prefsmanager/prefesmanager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getSavedTheme() ?? ThemeMode.light;


  bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    PrefsManager.saveCurrentTheme(currentTheme);

    notifyListeners();
  }



}