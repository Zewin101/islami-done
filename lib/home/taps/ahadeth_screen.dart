import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../ahadeth_detials/ahadeth_detials_screen.dart';

class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

List<hadethModel> ahadeth = [];

class _AhadethScreenState extends State<AhadethScreen> {
  List<hadethModel> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) loadHadethFile();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/ahadeth_image.png',
        ),
        Divider(
          thickness: 3,
          color: MyThemeData.colorGold,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        Divider(
          thickness: 3,
          color: MyThemeData.colorGold,
        ),
        ahadeth.isEmpty
            ? CircularProgressIndicator()
            : Expanded(
                child: ListView.separated(
                  itemCount: ahadeth.length,
                  itemBuilder: (context, index) => Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Hadeth_Detials.roueteName,
                          arguments: ahadeth[index],
                        );
                      },
                      child: Text(
                        ahadeth[index].tittle,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: MyThemeData.colorGold,
                  ),
                ),
              ),
      ],
    );
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> AllHadeth = content.trim().split('#\r\n');
    for (int i = 0; i < AllHadeth.length; i++) {
      String hadeth = AllHadeth[i];
      List<String> hadethLines = hadeth.split('\n');
      String tittle = hadethLines[0];
      hadethLines.removeAt(0);
      hadethModel HadethModel = hadethModel(tittle, hadethLines);
      ahadeth.add(HadethModel);
      setState(() {});
    }
  }
}

class hadethModel {
  String tittle;
  List<String> hadethContent;

  hadethModel(this.tittle, this.hadethContent);
}
