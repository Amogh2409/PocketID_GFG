import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = "light";

  ThemeMode get themeMode {
    if (currentTheme == "light") {
      return ThemeMode.light;
    } else if (currentTheme == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  Brightness get themeBrightness {
    if (currentTheme == "light") {
      return Brightness.light;
    } else if (currentTheme == "dark") {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }

  changeTheme(String theme) {
    currentTheme = theme; // Change the theme
    notifyListeners(); // Notify all the listeners
  }
}
