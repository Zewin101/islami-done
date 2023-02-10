import 'package:flutter/material.dart';
import 'package:zewin2/my_theme.dart';
import 'package:zewin2/provider/myProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class bottomSheetTheme extends StatelessWidget {
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
                provider.changeThemeMode(ThemeMode.light);
                provider.change();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : Colors.grey,
                ),
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(AppLocalizations.of(context)!.light,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 40, color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                provider.changeThemeMode(ThemeMode.dark);
                provider.change();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: provider.mode == ThemeMode.dark
                      ? MyThemeData.colorGold
                      : Colors.grey,
                ),
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(AppLocalizations.of(context)!.dark,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 40, color: Colors.white)),
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
