
import 'package:atelier_ladida/Data/seriesName.dart';
import 'package:atelier_ladida/Pages/SettingPage.dart';
import 'package:atelier_ladida/Pages/mainPage.dart';
import 'package:flutter/material.dart';

class LinkButtons{
    static List<Widget> buildElevatedButtons(BuildContext context) {
    List<Widget> res = <Widget>[];
    for (var value in EnumSeriesName.values) {
      res.add(buildElevatedButton(value,context));
    }
    return res;
  }

  static Widget buildElevatedButton(EnumSeriesName series,BuildContext context) => ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainPage(series)));
        },
        child: Text(series.buttonName),
      );
}