import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zewin2/provider/myProvider.dart';
import 'package:provider/provider.dart';

import '../../langauge_Theme_BottomSheet/bottomSheetLangauge.dart';
import '../../langauge_Theme_BottomSheet/bottomSheetTheme.dart';
import '../../my_theme.dart';

class Setting_App extends StatelessWidget {
  // String dropdownvalue = 'عربي';
  // List<String> items = [
  //   'عربي',
  //   'English',
  // ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowLangaugeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsetsDirectional.all(12),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                provider.languageLocal == "ar"
                    ? AppLocalizations.of(context)!.arabic
                    : AppLocalizations.of(context)!.english,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsetsDirectional.all(12),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                provider.mode == ThemeMode.dark
                    ? AppLocalizations.of(context)!.dark
                    : AppLocalizations.of(context)!.light,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
          ),
        ],
        //DropdownButton
        // child: DropdownButton(
        //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //   focusColor: Colors.transparent,
        //   elevation: 0,
        //   dropdownColor: Colors.transparent,
        //   value: dropdownvalue,
        //   icon: Icon(Icons.language),
        //   items: items.map((items) {
        //     return DropdownMenuItem(
        //       value: items,
        //       child: Text(items),
        //     );
        //   }).toList(),
        //   onChanged: (String? value) {
        //     dropdownvalue = value!;
        //     setState(() {});
        //   },
        // ),
      ),
    );
  }

  void ShowLangaugeBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheetLangauge(),
    );
  }

  void ShowThemeBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheetTheme(),
    );
  }
}
