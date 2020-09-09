import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImagePage extends StatelessWidget {
  String imgPath;
  FullScreenImagePage(this.imgPath);

  final LinearGradient backgroundGradient = LinearGradient(
      colors: [Color(0xFFDAE0E2), Color(0xFFEAF0F1)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.covered * 1.5,
          imageProvider: NetworkImage(imgPath),
          backgroundDecoration: BoxDecoration(gradient: backgroundGradient),
        ),
      ),
    );
  }
}
