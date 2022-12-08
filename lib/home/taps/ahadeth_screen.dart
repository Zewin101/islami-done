import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/myProvider.dart';
import 'package:provider/provider.dart';
import '../ahadeth_detials/ahadeth_detials_screen.dart';

class AhadethScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    if (provider.ahadeth.isEmpty) provider.loadHadethFile();
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
        provider.ahadeth.isEmpty
            ? CircularProgressIndicator()
            : Expanded(
                child: ListView.separated(
                  itemCount: provider.ahadeth.length,
                  itemBuilder: (context, index) => Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Hadeth_Detials.roueteName,
                          arguments: provider.ahadeth[index],
                        );
                      },
                      child: Text(
                        provider.ahadeth[index].tittle,
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
}

class hadethModel {
  String tittle;
  List<String> hadethContent;

  hadethModel(this.tittle, this.hadethContent);
}
