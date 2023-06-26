// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor:  const Color.fromARGB(255, 247, 246, 232),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 221, 133, 2)), onPressed: () { Navigator.pop(context); },)),
      body: Container(
        height: double.infinity,
        color: Colors.amber,
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2.5,
          imageProvider: NetworkImage(imageUrl,),
          backgroundDecoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 246, 232)
          ),
        ),
      ),
    );
  }
}
