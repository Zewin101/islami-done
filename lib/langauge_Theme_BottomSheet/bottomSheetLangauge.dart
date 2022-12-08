import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/myProvider.dart';
import 'package:provider/provider.dart';


class bottomSheetLangauge extends StatelessWidget {
  @override
  bool swith = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              swith = !swith;
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('English',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: provider.languageLocal == 'en'
                              ? MyThemeData.colorGold
                              : MyThemeData.colorBlack,
                        )),
                Icon(
                  Icons.aspect_ratio,
                  color: provider.languageLocal == 'en'
                      ? MyThemeData.colorGold
                      : MyThemeData.colorBlack,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              swith = !swith;
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Arabic',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: provider.languageLocal == 'ar'
                              ? MyThemeData.colorGold
                              : MyThemeData.colorBlack,
                        )),
                Icon(
                  Icons.aspect_ratio,
                  color: provider.languageLocal == 'ar'
                      ? MyThemeData.colorGold
                      : MyThemeData.colorBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
