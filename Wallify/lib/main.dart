import 'dart:core';
import 'package:FireBase/WallpaperApp/wall_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'WallpaperApp/wall_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

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
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallify',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
       navigatorObservers: <NavigatorObserver>[observer],
      // home: new WallScreen(analytics: analytics, observer: observer),
      home: WallScreens(analytics: analytics, observer: observer),
    );
  }
}
