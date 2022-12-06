import 'package:flutter/material.dart';
import 'package:islami/home/taps/ahadeth_screen.dart';
import 'package:islami/home/taps/moshaf/moshaf_screen.dart';
import 'package:islami/home/taps/radio_screen.dart';
import 'package:islami/home/taps/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/taps/setting.dart';
import 'package:islami/my_theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String dropdownvalue = 'عربي';
  List<String> items = [
    'عربي',
    'English',
  ];
  Color colorIcon = Colors.black;
  bool language = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            actions: [
              //DropdownButton
              // DropdownButton(//   style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold
              //   ),
              //   focusColor:  Colors.transparent,
              //   elevation: 0,
              //   dropdownColor: Colors.transparent,
              //   value: dropdownvalue,
              //   icon: Icon(Icons.language),
              //   items: items.map(( items) {
              //     return DropdownMenuItem(
              //       value: items,
              //       child: Text(items),
              //     );
              //   }).toList(),
              //   onChanged: (String? value) {
              //     dropdownvalue=value!;
              //     setState(() {
              //     });
              //   },
              //
              // ),
              IconButton(
                onPressed: () {
                  language = !language;
                  setState(() {});
                },
                icon: Icon(
                  Icons.language,
                  color: language
                      ? colorIcon = MyThemeData.colorBlack
                      : colorIcon = MyThemeData.colorGold,
                ),
              ),
            ],
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.appTittle,
                style: Theme.of(context).textTheme.headline1),
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              currentIndex: currentIndex,
              selectedItemColor:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/moshaf.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.moshaf,
                  backgroundColor: MyThemeData.colorGold,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/ahadeth.png',
                    ),
                  ),
                  //
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: MyThemeData.colorGold,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/sebha.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.sabha,
                  backgroundColor: MyThemeData.colorGold,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: MyThemeData.colorGold,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting,
                  backgroundColor: MyThemeData.colorGold,
                ),
              ]),
          body: taps[currentIndex],
        ),
      ],
    );
  }
}

List<Widget> taps = [
  MoshafScreen(),
  AhadethScreen(),
  SabhaScreen(),
  RadioScreen(),
  Setting_App(),
];
