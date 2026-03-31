import 'package:flutter/material.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;


  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

}