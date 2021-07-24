import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var data;
  Client client = http.Client();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    var request = await client.get(url);
    data = json.decode(request.body);
    setState(() {});
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
          'Flutter Basics',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: data != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text("ID: ${data[index]['id']}"),
                  leading: Image.network(data[index]['url']),
                );
              },
              itemCount: data.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
