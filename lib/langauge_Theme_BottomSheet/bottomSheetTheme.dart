import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/myProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class bottomSheetTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.light);

              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Lite',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: provider.languageLocal == 'en'
                              ? MyThemeData.colorGold
                              : MyThemeData.colorBlack,
                        )),
                Icon(
                  Icons.aspect_ratio,
                  color: provider.mode == ThemeMode.light
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
              provider.changeThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Dark',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: provider.mode == 'Dark'
                              ? Colors.red
                              : MyThemeData.colorBlack,
                        )),
                Icon(
                  Icons.aspect_ratio,
                  color: provider.mode == ThemeMode.dark
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
