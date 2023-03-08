import 'package:flutter/material.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

enum LanguageSetting {
  indonesia,
  inggris
}

class SettingController with ChangeNotifier {

  SettingController() {
    loadSetting();
  }

  Future<void> saveAllSetting() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", themeMode.name);
    await prefs.setString("language", language.name);
  }

  Future<void> loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString("theme");
    String? language = prefs.getString("language");
    
    if(theme != null) {
      switch (theme) {
        case "light":
          themeMode = ThemeMode.light;
          break;
        case "dark":
        default:
          themeMode = ThemeMode.dark;
      }
    }else{
      await prefs.setString("theme", themeMode.name);
    }

    if(language != null) {
      switch (language) {
        case "indonesia":
          this.language = LanguageSetting.indonesia;
          break;
        case "inggris":
        default:
          this.language = LanguageSetting.inggris;
      }
    }else{
      await prefs.setString("language", this.language.name);
    }

  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
    saveAllSetting();
  }
  
  LanguageSetting _language = LanguageSetting.inggris;

  LanguageSetting get language => _language;

  set language(LanguageSetting theme) {
    _language = theme;
    switch (theme) {
      case LanguageSetting.indonesia:
        locale = const Locale("id");
        break;
      case LanguageSetting.inggris:
      default:
        locale = const Locale("en");
    }
    notifyListeners();
    saveAllSetting();
  }

  Locale _locale = Locale(Platform.localeName);

  // ignore: unnecessary_getters_setters
  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
  }
  
}