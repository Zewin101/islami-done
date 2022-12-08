import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_imge.png'),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset('assets/images/IconBack.png'),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset('assets/images/Iconplay.png'),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset('assets/images/IconGo.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
