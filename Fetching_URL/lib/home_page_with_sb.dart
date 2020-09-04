import 'package:GalleryCam/Constants.dart';
import 'package:GalleryCam/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageSB extends StatelessWidget {
  final bgColor = const Color(0xFF34495e);
  final barColor = const Color(0xFF2C3A47);
  final boxColor = const Color(0xFF191919);
  // TextEditingController _namecontroller = TextEditingController();
  // var myText = "Change Me";

  // ignore: always_declare_return_types
  Future<void> getData() async {
    var url = 'https://jsonplaceholder.typicode.com/photos';
    var response = await http.get(url);
    dynamic data = jsonDecode(response.body);
    print(data);
    return data;
  }

  Stream<List<String>> getStreamData() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getStreamData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch Something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some Error Occured"),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text("${snapshot.data[index]}"),
                     ),
                  );
                },
              );
          }
        },
      ),
      backgroundColor: bgColor,
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _namecontroller.text;
          // setState(() {});
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
