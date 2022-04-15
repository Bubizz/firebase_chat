import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes extends ChangeNotifier {
  MaterialColor colorPalette;
  ThemeData customTheme;
  bool isDark;

  Themes(this.colorPalette)
      : isDark = false,
        customTheme = ThemeData(
          primaryColor: colorPalette[600],
          backgroundColor: Colors.white,
          buttonColor: colorPalette[100],
        ) {
    _loadPrefs();
  }

  void switchDarkMode()
  {
    isDark = !isDark;
  }

  void setTheme(MaterialColor color) {
    colorPalette = color;
    customTheme = customTheme.copyWith(
        primaryColor: colorPalette[500], buttonColor: colorPalette[100]);
    notifyListeners();
  }

  void setDarkMode() async { //sets dark or light mode based on bool and saves preference locally

    customTheme = (isDark
        ? ThemeData.dark().copyWith(
            primaryColor: colorPalette[600], buttonColor: colorPalette[100])
        : ThemeData.light().copyWith(
            primaryColor: colorPalette[600],
            buttonColor: colorPalette[100],
            backgroundColor: Colors.white));
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkmode', isDark);
    print(prefs.getBool('darkmode'));
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('darkmode') ?? false; 
    setDarkMode();
    notifyListeners();
    
   
  }
}
