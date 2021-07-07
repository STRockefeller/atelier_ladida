import 'package:flutter/material.dart';
import 'Pages/homePage.dart';
import 'Pages/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}




