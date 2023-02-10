import 'package:flutter/material.dart';
import 'package:zewin2/provider/myProvider.dart';
import 'package:provider/provider.dart';

import '../../../model/Radio_Response.dart';

class RadioControllar extends StatelessWidget {

String tittel;
Function functionPlay;
Function functionNext;
Function functionBack;


RadioControllar(
    {required this.tittel, required this.functionPlay, required this.functionNext, required this.functionBack});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Center(
              child: Text(tittel,
              style: Theme.of(context).textTheme.subtitle1
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // InkWell(
                //   onTap: () {
                //     functionBack();
                //   },
                //   child: Image.asset('assets/images/IconBack.png'),
                // ),
                InkWell(
                  onTap: () {
                  functionPlay();
                  },
                  child: Image.asset('assets/images/Iconplay.png'),
                ),
                // InkWell(
                //   onTap: () {
                //     functionNext();
                //   },
                //   child: Image.asset('assets/images/IconGo.png'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
