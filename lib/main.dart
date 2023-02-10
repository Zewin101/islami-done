import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:zewin2/home/home_screen.dart';
import 'package:zewin2/home/sura_detials/sura_detials_screen.dart';
import 'package:zewin2/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zewin2/provider/homeScreenProvider.dart';
import 'package:zewin2/provider/myProvider.dart';
import 'package:zewin2/provider/sura_provider.dart';
import 'package:provider/provider.dart';
import 'home/ahadeth_detials/ahadeth_detials_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (BuildContext context) => MyProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => SuraProvider()),
    ], child: MyApplication()),
  );
}

class MyApplication extends StatelessWidget {
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale(provider.languageLocal),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Sura_Details_Screen.routeName: (_) => Sura_Details_Screen(),
        Hadeth_Detials.roueteName: (context) => Hadeth_Detials(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DartTheme,
      themeMode: provider.mode,
    );
  }
}
