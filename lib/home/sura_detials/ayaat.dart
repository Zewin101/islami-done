import 'package:flutter/material.dart';

class AyaatItem extends StatelessWidget {
  String aya;
  int numAya;

  AyaatItem(this.aya, this.numAya);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${aya + '(${numAya.toString()})'}',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
