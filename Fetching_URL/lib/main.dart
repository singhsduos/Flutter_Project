import 'package:GalleryCam/Constants.dart';
import 'package:GalleryCam/home_page_with_fb.dart';
import 'package:GalleryCam/src/App.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram",
      home: Constants.prefs.getBool("loggedIn") == true ? HomePageFB() : LoginPage(),
      routes: {"/login": (context) => LoginPage(), "/home": (context) => App()},
    ),
  );
}
