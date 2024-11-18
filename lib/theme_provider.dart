import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  int _currentThemeIndex = 0;
  int _currentFontIndex = 0;

  ThemeData _themeData = themes[0];
  String _fontFamily = fonts[0];

  ThemeData get themeData => _themeData.copyWith(
        textTheme: GoogleFonts.getTextTheme(_fontFamily),
      );

  String get fontFamily => _fontFamily;
  int get currentThemeIndex => _currentThemeIndex;
  int get currentFontIndex => _currentFontIndex;

  void setTheme(int index) {
    _currentThemeIndex = index;
    _themeData = themes[index];
    notifyListeners();
  }

  void setFont(int index) {
    _currentFontIndex = index;
    _fontFamily = fonts[index];
    notifyListeners();
  }
}

final List<ThemeData> themes = [
  ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
  ),
  ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.orangeAccent,
  ),
  ThemeData(
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.teal.shade100,
  ),
];

final List<String> fonts = [
  'Roboto',
  'Lobster',
  'Montserrat',
];
