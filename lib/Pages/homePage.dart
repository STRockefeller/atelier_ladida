import 'package:atelier_ladida/Data/linkButtons.dart';
import 'package:atelier_ladida/Data/seriesName.dart';
import 'package:atelier_ladida/Pages/mainPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atelier LaDiDa'),
      ),
      body: Container(
          child: Column(
        children: LinkButtons.buildElevatedButtons(context),
      )),
      drawer: Drawer(child:ListView(children: LinkButtons.buildElevatedButtons(context),)),
    );
  }
}
