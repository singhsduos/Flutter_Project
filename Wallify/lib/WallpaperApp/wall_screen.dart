import 'dart:async';
import 'dart:core';

import 'package:FireBase/WallpaperApp/fullScreen_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = '';

class WallScreens extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  WallScreens({this.analytics, this.observer});
  @override
  _WallScreensState createState() => new _WallScreensState();
}

class _WallScreensState extends State<WallScreens> {
  // static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   testDevices: <String>[],
  //   keywords: <String>['wallpapers', 'walls', 'amoled'],
  //   birthday: DateTime.now(),
  //   childDirected: true,
  // );

  // BannerAd _bannerAd;
  // InterstitialAd _interstitialAd;

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference =
      Firestore.instance.collection('wallpapers');

  // BannerAd createBannerAd() {
  //   return BannerAd(
  //       adUnitId: BannerAd.testAdUnitId,
  //       size: AdSize.banner,
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print('Banner event: $event');
  //       });
  // }

  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       adUnitId: InterstitialAd.testAdUnitId,
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print('InterstitialAd event: $event');
  //       });
  // }

  Future<Null> _currentScreen() async {
    await widget.analytics.setCurrentScreen(
        screenName: 'Wall Screens', screenClassOverride: 'WallScreens');
  }

  Future<Null> _sendAnalytics() async {
    await widget.analytics
        .logEvent(name: 'tap to full screen', parameters: <String, dynamic>{});
  }

  @override
  void initState() {
    super.initState();
    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    // _bannerAd = createBannerAd()
    //   ..load()
    //   ..show();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.documents;
      });
    });

    _currentScreen();
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    // _interstitialAd?.dispose();
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Wallify',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'EmilysCandy',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          )),
        ),
        body: wallpapersList != null
            ? new StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: wallpapersList.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: Material(
                      elevation: 8.0,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(8.0)),
                      child: InkWell(
                        onTap: () {
                          _sendAnalytics();
                          // createInterstitialAd()
                          //   ..load()
                          //   ..show();
                          Navigator.push<MaterialPageRoute>(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FullScreenImagePage(
                                        ('${wallpapersList[i].data()['url']}')),
                              ));
                        },
                        child: new Hero(
                          tag: ('${wallpapersList[i].data()['url']}'),
                          child: FadeInImage(
                            image: NetworkImage(
                                '${wallpapersList[i].data()['url']}'),
                            fit: BoxFit.cover,
                            placeholder: const AssetImage('assets/neel.png'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) =>
                    new StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
              )
            : new Center(
                child: new CircularProgressIndicator(),
              ));
  }
}
