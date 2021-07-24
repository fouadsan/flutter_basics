import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/profile_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name = "Not Assigned";
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: MyProfileCard(name: name, nameController: nameController),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(name: name, nameController: nameController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          name = nameController.text;
          setState(() {});
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
