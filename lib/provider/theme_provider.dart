

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;

  void switchTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}