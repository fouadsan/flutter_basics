import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/home';
  Future _fetchData() async {
    List data = [];
    final url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    Client client = http.Client();
    try {
      var response = await client.get(url);
      data = json.decode(response.body);
    } catch (error) {
      print(error);
    }

    return data;
  }

  Stream<List<String>> _getStream() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "object $index")]);
    return data;
  }

  const MyHomePage({Key? key}) : super(key: key);
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
      body: StreamBuilder(
        stream: _getStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('Fetch something'),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('OOops! somthing went wrong'));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]),
                  );
                },
                itemCount: snapshot.data.length,
              );
          }
        },
      ),
    );
  }
}
