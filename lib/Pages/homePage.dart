import 'package:atelier_ladida/Data/Deserialize.dart';
import 'package:atelier_ladida/Data/item.dart';
import 'package:atelier_ladida/Data/seriesName.dart';
import 'package:atelier_ladida/Pages/mainPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List<Widget> buildTextButtons(BuildContext context) {
    List<Widget> res = <Widget>[];
    for (var value in EnumSeriesName.values) {
      res.add(buildTextButton(value,context));
    }
    return res;
  }

  Widget buildTextButton(EnumSeriesName series,BuildContext context) => TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainPage(series)));
        },
        child: Text(series.buttonName),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atelier LaDiDa'),
      ),
      body: Container(
          child: Column(
        children: buildTextButtons(context),
      )),
    );
  }
}
