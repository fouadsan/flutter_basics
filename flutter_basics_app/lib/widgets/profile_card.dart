import 'package:flutter/material.dart';

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({
    Key? key,
    required this.name,
    required this.nameController,
  }) : super(key: key);

  final String name;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/example.jpg',
              ),
              radius: 100,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Name",
                  labelText: "Name",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
