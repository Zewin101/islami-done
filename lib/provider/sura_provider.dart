import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraProvider extends ChangeNotifier {
  List<String> ayat = [];

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> line = content.split('\n');
    ayat = line;
    notifyListeners();
  }
}
