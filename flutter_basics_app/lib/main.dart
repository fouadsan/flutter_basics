import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import './screens/home_screen.dart';
import './screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loggedIn = false;

  Future _checkSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("loggedIn") == true) {
      loggedIn = true;
    }
    print(prefs.getBool("loggedIn"));
    return loggedIn;
  }

  @override
  void initState() {
    super.initState();
    _checkSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              ),
            ),
      ),
      home: loggedIn ? MyHomePage() : LoginScreen(),
      routes: {
        MyHomePage.routeName: (ctx) => MyHomePage(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
    );
  }
}
