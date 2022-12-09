import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/myProvider.dart';
import 'package:provider/provider.dart';

class SabhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset('assets/images/sebhaImge.png'),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          provider.counter.toString(),
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: provider.colortsabeh[provider.counterColors],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  provider.tsabeh[provider.tsabehItem],
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: MyThemeData.colorGold,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: MyThemeData.colorGold,
                  side: BorderSide(color: Colors.amber, width: 1),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  provider.sebhaNum();
                },
                child: Text(
                  AppLocalizations.of(context)!.click,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
