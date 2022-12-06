import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/sura_detials/sura_detials_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home/ahadeth_detials/ahadeth_detials_screen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Sura_Details_Screen.routeName: (_) => Sura_Details_Screen(),
        Hadeth_Detials.roueteName: (context) => Hadeth_Detials(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DartTheme,
      themeMode: ThemeMode.light,
    );
  }
}
