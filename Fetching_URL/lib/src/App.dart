import 'package:GalleryCam/Constants.dart';
import 'package:GalleryCam/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final bgColor = const Color(0xFF34495e);
  final barColor = const Color(0xFF2C3A47);
  final boxColor = const Color(0xFF191919);
  TextEditingController _namecontroller = TextEditingController();
  var myText = "Change Me";
  var url = 'https://jsonplaceholder.typicode.com/photos';
  dynamic data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // ignore: always_declare_return_types
  Future<void> getData() async {
    var response = await http.get(url);
    data = jsonDecode(response.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text("${data[index]['title']}"),
                      subtitle: Text("${data[index]["id"]}"),
                      leading: Image.network("${data[index]['url']}"),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      backgroundColor: bgColor,
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _namecontroller.text;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Instagram',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
        backgroundColor: barColor,
      ),
    );
  }
}
