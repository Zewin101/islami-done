import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting_App extends StatefulWidget {
  @override
  State<Setting_App> createState() => _Setting_AppState();
}

String dropdownvalue = 'عربي';
List<String> items = [
  'عربي',
  'English',
];

class _Setting_AppState extends State<Setting_App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton(
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          focusColor: Colors.transparent,
          elevation: 0,
          dropdownColor: Colors.transparent,
          value: dropdownvalue,
          icon: Icon(Icons.language),
          items: items.map((items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? value) {
            dropdownvalue = value!;
            setState(() {});
          },
        ),
      ),
    );
  }
}
