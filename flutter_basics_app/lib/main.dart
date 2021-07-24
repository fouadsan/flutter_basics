import 'package:flutter/material.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            headline1: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            )),
      ),
      home: MyHomePage(title: 'Flutter Basics'),
    );
  }
}
