import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes extends ChangeNotifier {
  MaterialColor colorPalette;
  ThemeData customTheme;
  bool isDark; //determines if dark mode is enabled or not

  Themes(this.colorPalette)
      : isDark = false,
       customTheme = ThemeData.light().copyWith(
            textTheme: const TextTheme().copyWith(bodyMedium: const TextStyle(color: Colors.black)),
            primaryColor: colorPalette[600],
            buttonColor: colorPalette[150],
            primaryColorLight: colorPalette[300],
            backgroundColor: Colors.white) {
    _loadPrefs();
  }

  void switchDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }

  void setTheme(MaterialColor color) async {
    colorPalette = color;
    customTheme = customTheme.copyWith(
        primaryColor: colorPalette[600],
        primaryColorLight: colorPalette[300],
        buttonColor: colorPalette[150]);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('preferedColor', color.value);

 
  }

  void setDarkMode() async {
    //sets dark or light mode based on bool and saves preference locally
    customTheme = isDark
        ? ThemeData.dark().copyWith(
            primaryColor: colorPalette[600],
            backgroundColor: Colors.grey[850],
            primaryColorLight: colorPalette[300],
            buttonColor: colorPalette[150])
        : ThemeData.light().copyWith(
            textTheme: const TextTheme().copyWith(bodyMedium: const TextStyle(color: Colors.black)),
            primaryColor: colorPalette[500],
            buttonColor: colorPalette[150],
            primaryColorLight: colorPalette[300],
            backgroundColor: Colors.white);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkmode', isDark);
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('darkmode') ?? false;
    MaterialColor materialColor = createMaterialColor(Color(prefs.getInt('preferedColor') ?? 0xFF42A5F5));
    setTheme(materialColor);
    setDarkMode();
    notifyListeners();
  }

  static MaterialColor createMaterialColor(Color color) { // recreates MaterialColor after reading preferred Color from sharedpreferences
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
