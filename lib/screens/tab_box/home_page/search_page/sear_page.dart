import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_image.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

String _inputText = "";

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 221, 133, 2),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: TextField(
                cursorColor: Colors.black,
                onChanged: (text) {
                  setState(
                    () {
                      _inputText = text;
                    },
                  );
                },
                decoration: const InputDecoration(
                  hintText: 'Type something...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            if (_inputText.isEmpty)
              const SizedBox()
            else
              const Text(
                 "<Qidiruv qismi tez kunda ishga tushadi!> ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
