import 'package:flutter/material.dart';
import 'package:islami/home/taps/ahadeth_screen.dart';
import 'package:islami/home/taps/moshaf/moshaf_screen.dart';
import 'package:islami/home/taps/radio_screen.dart';
import 'package:islami/home/taps/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/taps/setting.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/myProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.changeBackGround(),
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
                  provider.language
                      ? provider.changeLanguage('ar')
                      : provider.changeLanguage('an');
                  provider.language = !provider.language;
                },
                icon: Icon(
                  Icons.language,
                  color: provider.language
                      ? provider.colorIcon = MyThemeData.colorDark
                      : provider.colorIcon = MyThemeData.colorGold,
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
                      ? Icons.nightlight_outlined
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
