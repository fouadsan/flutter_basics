import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.red,
              alignment: Alignment.center,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.yellow,
              alignment: Alignment.center,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
