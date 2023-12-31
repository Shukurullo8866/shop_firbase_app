// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:shop_firbase_app/utils/app_image.dart';


class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
         centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14).r,
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
          
        ),
        shadowColor: Colors.white70,
        backgroundColor:  const Color.fromARGB(255, 247, 246, 232),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 221, 133, 2)), onPressed: () { Navigator.pop(context); },)),
      body: FullScreenWidget(
        disposeLevel: DisposeLevel.High,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      )
    );
  }
} 
