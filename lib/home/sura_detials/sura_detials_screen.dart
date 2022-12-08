import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/sura_detials/ayaat.dart';
import 'package:islami/my_theme.dart';
import 'package:provider/provider.dart';

import '../../provider/sura_provider.dart';

class Sura_Details_Screen extends StatelessWidget {
  static const String routeName = 'sura';

  @override
  Widget build(BuildContext context) {
    var providersoura = Provider.of<SuraProvider>(context);
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (providersoura.ayat.isEmpty) providersoura.loadFile(args.index);
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
            title: Text(args.suraName,
                style: Theme.of(context).textTheme.headline1),
          ),
          body: providersoura.ayat.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyThemeData.colorGold,
                  ),
                )
              : Padding(
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
                  itemCount: providersoura.ayat.length,
                        itemBuilder: (context, index) =>
                            AyaatItem(providersoura.ayat[index], index),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;
  SuraDetailsArgs(this.suraName, this.index);
}
