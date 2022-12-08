import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';

class MyProvider extends ChangeNotifier {
  String languageLocal = 'en';
  int currentIndex = 0;
  ThemeMode mode = ThemeMode.light;
  bool language = true;
  Color colorIcon = Colors.black;
  bool modTheme = false;
  List<String> tsabeh = [
    'الله اكبر',
    'الحمد لله',
    'سبحان الله',
    'لا اله إلا الله'
  ];
  int counterColors = 0;
  int counter = 0;
  int tsabehItem = 0;

  List<Color> colortsabeh = [
    Color.fromRGBO(214, 193, 164, 1.0),
    Color.fromRGBO(211, 183, 105, 1.0),
    Color.fromRGBO(218, 168, 28, 1.0),
    Color.fromRGBO(178, 132, 1, 1.0),
  ];

  void changeLanguage(String languase) {
    languageLocal = languase;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode m) {
    mode = m;
    notifyListeners();
  }

  void current_Index(int index) {
    currentIndex = index;
    notifyListeners();
  }
  String changeBackGround() {
    if (mode == ThemeMode.dark) {
      return 'assets/images/background.png';
    } else
      return 'assets/images/background.png';
  }

  void sebhaNum() {
    counter++;
    if (counter == 34) {
      counter = 0;
      tsabeh.length - 1 == tsabehItem ? tsabehItem = 0 : tsabehItem++;
      counterColors == tsabeh.length - 1 ? counterColors = 0 : counterColors++;
    }
    notifyListeners();
  }
}
