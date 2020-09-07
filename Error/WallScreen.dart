import 'dart:async';
import 'dart:core';
import 'package:cast/cast.dart';

import 'package:FireBase/WallpaperApp/fullScreen_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() {
    return _WallScreenState();
  }
}

class _WallScreenState extends State<WallScreen> {
  Future _data;
  List data;
  
  List<DocumentSnapshot> wallpaperList;

  Future getPosts() async {
    var firestore = Firestore.instance;
    final QuerySnapshot querySnapshot =
        await firestore.collection('wallpapers').getDocuments();
    return querySnapshot.documents;
  }
  

  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Wallify'))),
      body: StreamBuilder(
        stream: Firestore.instance.collection('wallapaers').snapshots(),
        // ignore: always_specify_types
        // ignore: missing_return
        // ignore: always_specify_types 
        
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              // ignore: missing_return
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  title: Text(snapshot.data[i].data['url'].toString()),
                  //  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  //       child: InkWell(
                  //         onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>FullScreenImagePage(imgPath))),
                  //         child: Hero(tag: imgPath,
                  //         child: FadeInImage(image: NetworkImage(imgPath),
                  //         fit: BoxFit.cover,
                  //         placeholder: const AssetImage('assets/neel.png'),
                  //         ),
                  //         ),
                  //  },
                  //         ),
                );
              },
            );
          } else {
            // ignore: missing_required_param
            // StaggeredGridView.countBuilder(
            //   staggeredTileBuilder: (int i) => StaggeredTile.count(2, i.isEven?2:3),
            //    mainAxisSpacing: 8.0,
            //    crossAxisSpacing: 8.0,
            //   padding: const EdgeInsets.all(8.0),
            //   crossAxisCount: 4,
           return const Center(child: CircularProgressIndicator());
            
            // );
          }
        },
      ),
    );
  }
}

