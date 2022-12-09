import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/myProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class bottomSheetLangauge extends StatelessWidget {
  @override
  bool swith = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                swith = !swith;
                provider.changeLanguage('en');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: provider.languageLocal == "ar"
                      ? Colors.grey
                      : MyThemeData.colorGold,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.english,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                swith = !swith;
                provider.changeLanguage('ar');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: provider.languageLocal == "ar"
                      ? MyThemeData.colorGold
                      : Colors.grey,
                ),
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 70,
              width: 150,
              child: CloseButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
