import 'package:atelier_ladida/Pages/SettingPage.dart';
import 'package:atelier_ladida/Pages/homePage.dart';
import 'package:flutter/material.dart';

class AppBarWidget{
  static AppBar buildAppBar(BuildContext context,String pageTitle)=>AppBar(
    title: Text(pageTitle),
    actions: [IconButton(
      onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage())),
      icon: const Icon(Icons.settings)),
      IconButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
       icon: const Icon(Icons.home))]);
}