import 'dart:core';
import 'package:FireBase/WallpaperApp/wall_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'WallpaperApp/wall_screen.dart';
import 'CrudApp/crud_sample.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),

      // home: new WallScreen(analytics: analytics, observer: observer),
      home: WallScreen(),
    );
  }
}

