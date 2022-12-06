import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SabhaScreen extends StatefulWidget {
  @override
  State<SabhaScreen> createState() => _SabhaScreenState();
}

class _SabhaScreenState extends State<SabhaScreen> {
  List<String> tsabeh = [
    'الله اكبر',
    'الحمد لله',
    'سبحان الله',
    'لا اله إلا الله'
  ];
  int counterColors = 0;
  int counter = 0;
  int tsabehItem = 0;

  List<Color> colortsabeh = [
    Color.fromRGBO(214, 193, 164, 1.0),
    Color.fromRGBO(211, 183, 105, 1.0),
    Color.fromRGBO(218, 168, 28, 1.0),
    Color.fromRGBO(178, 132, 1, 1.0),
  ];

  @override
  Widget build(BuildContext context) {
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
                          counter.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 100,
                          ),
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
            // Text(
            //   'عدد التسبيحات',
            //   style: Theme.of(context).textTheme.headline1,
            // ),
            Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: colortsabeh[counterColors],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  tsabeh[tsabehItem],
                  style: Theme.of(context).textTheme.subtitle1,
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
                  side: BorderSide(color: Colors.amber, width: 1),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  counter++;
                  if (counter == 34) {
                    counter = 0;
                    tsabeh.length - 1 == tsabehItem
                        ? tsabehItem = 0
                        : tsabehItem++;
                    counterColors == tsabeh.length - 1
                        ? counterColors = 0
                        : counterColors++;
                  }
                  setState(() {});
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
