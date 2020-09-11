import 'dart:core';
import 'package:FireBase/WallpaperApp/wall_screen.dart';
import 'package:FireBase/mlkit/ml_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'WallpaperApp/wall_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'CrudApp/crud_sample.dart';
// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallify',
      theme: ThemeData(
        primarySwatch: Colors.lime, // theme for ML-Kit
     // primarySwatch: Colors.orange, // theme for CrudApp
     // primarySwatch: Colors.grey, // theme for Wallify   
      ),
       navigatorObservers: <NavigatorObserver>[observer],
      // home: WallScreen(analytics: analytics, observer: observer), // path for Wallify
      //home: CrudSample(), // path for CrudApp
      home: MLHome(), // path for MLHome
    );
  }
}
