import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme.dart';

import '../home/taps/ahadeth_screen.dart';

class MyProvider extends ChangeNotifier {
  String languageLocal = 'en';

  List<hadethModel> ahadeth = [];
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
  bool cha = true;
  void change() {
    cha = !cha;
    notifyListeners();
  }

  String changeBackground() {
    return mode == ThemeMode.light
        ? 'assets/images/background.png'
        : 'assets/images/backgroundDark.png';
  }

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

  void sebhaNum() {
    counter++;
    if (counter == 34) {
      counter = 0;
      tsabeh.length - 1 == tsabehItem ? tsabehItem = 0 : tsabehItem++;
      counterColors == tsabeh.length - 1 ? counterColors = 0 : counterColors++;
    }
    notifyListeners();
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> AllHadeth = content.trim().split('#\r\n');
    for (int i = 0; i < AllHadeth.length; i++) {
      String hadeth = AllHadeth[i];
      List<String> hadethLines = hadeth.split('\n');
      String tittle = hadethLines[0];
      hadethLines.removeAt(0);
      hadethModel HadethModel = hadethModel(tittle, hadethLines);
      ahadeth.add(HadethModel);
      notifyListeners();
    }
  }


  bool playOrPause=true;
  void playPause(){
    playOrPause=!playOrPause;

    notifyListeners();
  }

}
