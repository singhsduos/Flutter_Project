import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final bgColor = const Color(0xFF34495e);
  final barColor = const Color(0xFF2C3A47);
   final boxColor = const Color(0xFF191919);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Neelesh Singh Thakur',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              'singhs.duos@gmail.com',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1565464027194-7957a2295fb7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80'),
            ),
            decoration: BoxDecoration(color: barColor),
          ),
          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.edit),
            title: Text('Accounts',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.black,
                )),
            subtitle: Text('Personal',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                  color: Colors.black,
                )),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            trailing: Icon(Icons.send),
            title: Text('E-mail',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.black,
                )),
            subtitle: Text('singhs.duos@gmai.com',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                  color: Colors.black,
                )),
          )
        ],
      ),
    );
  }
}
