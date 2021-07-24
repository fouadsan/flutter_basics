import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.name, required this.nameController})
      : super(key: key);

  final String name;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
                nameController.text.isNotEmpty ? nameController.text : name),
            accountEmail: Text("Example@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1553272725-086100aecf5e?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'Fouad Benayad',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text("Developer"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
