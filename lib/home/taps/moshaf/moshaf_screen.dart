import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/taps/moshaf/sura_item.dart';
import 'package:islami/home/taps/moshaf/sura_name.dart';
import 'package:islami/my_theme.dart';

class MoshafScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            'assets/images/quran_image.png',
          ),
          Divider(
            thickness: 3,
            color: MyThemeData.colorGold,
          ),
          Text(
            AppLocalizations.of(context)!.suraName,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 3,
            color: MyThemeData.colorGold,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => SuraItem(suraName[index], index),
              itemCount: suraName.length,
              separatorBuilder: (context, index) => Divider(
                color: MyThemeData.colorGold,
                indent: 10,
                endIndent: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
