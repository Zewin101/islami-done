import 'package:flutter/material.dart';

class My_Provider extends ChangeNotifier {
  String languageLocal = 'en';

  void changeLanguage(String languase) {
    languageLocal = languase;
    notifyListeners();
  }
}
