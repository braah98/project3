import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'ar';

  String get currentLanguage => _currentLanguage;

  void changeLanguage(String lang) {
    _currentLanguage = lang;
    notifyListeners();
  }
}