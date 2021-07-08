import 'package:atelier_ladida/Data/settings.dart';
import 'package:flutter/material.dart';
import 'Pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key){
    Setting.readSetting();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: GlobalSettings.settings.themeColorSetting.color,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}




