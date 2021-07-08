import 'package:atelier_ladida/Data/appBarWidget.dart';
import 'package:atelier_ladida/Data/linkButtons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.buildAppBar(context, 'Atelier LaDiDa'),
      body: Container(
          child: Column(
        children: LinkButtons.buildElevatedButtons(context),)),
      drawer: Drawer(child:ListView(children: LinkButtons.buildElevatedButtons(context),)),
    );
  }
}
