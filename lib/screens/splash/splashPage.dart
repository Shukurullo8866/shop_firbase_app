// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shop_firbase_app/screens/tab_box/tab_box.dart';
import 'package:shop_firbase_app/utils/app_image.dart';

import '../../utils/const.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage() {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TabBox()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height(context) * 0.139,
          ),
          Center(
            child: SizedBox(
              height: height(context) * 0.4,
              width: width(context) * 0.8,
              child: Image.asset(
                AppImage.d_r,
              ),
            ),
          ),
          SizedBox(
            height: width(context) * 0.139,
          ),
          const CircularProgressIndicator(
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
