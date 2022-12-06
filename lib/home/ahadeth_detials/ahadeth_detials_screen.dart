import 'package:flutter/material.dart';

import '../../my_theme.dart';
import '../taps/ahadeth_screen.dart';

class Hadeth_Detials extends StatelessWidget {
  static const String roueteName = 'hadeth';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as hadethModel;
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              args.tittle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyThemeData.colorGold,
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: args.hadethContent.length,
                  itemBuilder: (context, index) => Text(
                    args.hadethContent[index],
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
