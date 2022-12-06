import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/sura_detials/ayaat.dart';
import 'package:islami/my_theme.dart';

class Sura_Details_Screen extends StatefulWidget {
  static const String routeName = 'sura';

  @override
  State<Sura_Details_Screen> createState() => _Sura_Details_ScreenState();
}

class _Sura_Details_ScreenState extends State<Sura_Details_Screen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) loadFile(args.index);
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(args.suraName,
                style: Theme.of(context).textTheme.headline1),
          ),
          body: ayat.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyThemeData.colorGold,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyThemeData.colorGold,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: ayat.length,
                        itemBuilder: (context, index) =>
                            AyaatItem(ayat[index], index),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> line = content.split('\n');
    ayat = line;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
