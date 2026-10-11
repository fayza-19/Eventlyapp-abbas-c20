import 'package:flutter/material.dart';

import '../core/prefsmanager/prefesmanager.dart';

class LangProvider extends ChangeNotifier {
  String currentLanguage = PrefsManager.getSavedLang() ?? 'en';
  bool get isEnglish  => currentLanguage == 'en';

  void changeAppLang(String newLang){
    if(currentLanguage == newLang)return;
    currentLanguage = newLang;
    PrefsManager.saveCurrentLang(currentLanguage);
    notifyListeners();
  }
}