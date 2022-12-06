import 'package:flutter/material.dart';

import '../../sura_detials/sura_detials_screen.dart';

class SuraItem extends StatelessWidget {
  int index;
  String name;

  SuraItem(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Sura_Details_Screen.routeName,
            arguments: SuraDetailsArgs(name, index));
      },
      child: Text(
        textAlign: TextAlign.center,
        name,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
