import 'package:flutter/material.dart';
import 'package:zewin2/home/taps/ahadeth_screen.dart';
import 'package:zewin2/home/taps/moshaf/moshaf_screen.dart';
import 'package:zewin2/home/taps/radio/radio_screen.dart';
import 'package:zewin2/home/taps/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zewin2/home/taps/setting.dart';
import 'package:zewin2/my_theme.dart';
import 'package:zewin2/provider/homeScreenProvider.dart';
import 'package:zewin2/provider/myProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.changeBackground(),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  provider.language
                      ? provider.changeLanguage('ar')
                      : provider.changeLanguage('an');
                  provider.language = !provider.language;
                },
                icon: Text(
                  provider.languageLocal == "ar" ? "EN" : 'AR',
                  style: TextStyle(
                    fontSize: 20,
                    color: provider.mode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  provider.modTheme
                      ? provider.changeThemeMode(ThemeMode.light)
                      : provider.changeThemeMode(ThemeMode.dark);
                  provider.modTheme = !provider.modTheme;
                },
                icon: Icon(
                  provider.mode == ThemeMode.dark
                      ? Icons.nightlight_round
                      : Icons.light_mode,
                ),
              ),
            ],
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.appTittle,
                style: Theme.of(context).textTheme.headline1),
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                provider.current_Index(index);
              },
              currentIndex: provider.currentIndex,
              selectedItemColor: provider.mode == ThemeMode.light
                  ? Colors.black
                  : MyThemeData.colorGold,
              unselectedItemColor: provider.mode == ThemeMode.light
                  ? Colors.white
                  : Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/moshaf.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.moshaf,
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.colorDark,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/ahadeth.png',
                    ),
                  ),
                  //
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.colorDark,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/sebha.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.sabha,
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.colorDark,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.colorDark,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting,
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.colorDark,
                ),
              ]),
          body: taps[provider.currentIndex],
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
