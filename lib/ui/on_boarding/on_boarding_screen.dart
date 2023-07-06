import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/ui/on_boarding/signIn_or_signUp_page.dart';

import '../../utils/const.dart';
import '../auth/login_page.dart';
import '../auth/sign_up_page.dart';
import 'widget/on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _curr = 0;
  bool isSelected = false;
  bool isLogged = true;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      onBoardingWidget(
        context,
        image:
            "https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?w=2000",
        dutyOfDoctor: "Thousands of doctors",
        desc1: "You can easily contact with a thousands of doctors",
        desc2: "contact for your needs.",
      ),
      onBoardingWidget(
        context,
        image:
            "https://media.istockphoto.com/id/138205019/photo/happy-healthcare-practitioner.jpg?s=612x612&w=0&k=20&c=b8kUyVtmZeW8MeLHcDsJfqqF0XiFBjq6tgBQZC7G0f0=",
        dutyOfDoctor: "Chat with doctors",
        desc1: "Book an appointment with doctor. Chat with doctor via",
        desc2: "appointment letter and get consultation.",
      ),
      onBoardingWidget(
        context,
        image:
            "https://www.pixelstalk.net/wp-content/uploads/2016/10/Modern-generation-doctor-girl-wallpaper.jpg",
        dutyOfDoctor: "Live talk with doctor",
        desc1: "Easily connect with doctor, start voice and video call",
        desc2: "better treatment & prescription",
      ),
    ];
    return Scaffold(
      // backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (val) {
            setState(() {
              _curr = val;
              if (val == 2) {
                isSelected = true;
              }
            });
          },
          children: pages,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ).r,
            child: SizedBox(
              height: 4.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _curr == index
                            ? const Color(0xFF2972FE)
                            : const Color(0xFFEBEEF2)),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 8.w);
                },
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.only(left: 40).r,
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => isLogged
                          ? LoginPage(onClickSignUp: switchAuthPages)
                          : SignUpPage(onClickedSignIn: switchAuthPages),
                    ),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: const Color(0xFF2972FE),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp),
                )),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 64, right: 24).r,
            child: InkWell(
              onTap: () {
                if (_curr == 2 && isSelected) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => isLogged
                          ? LoginPage(onClickSignUp: switchAuthPages)
                          : SignUpPage(onClickedSignIn: switchAuthPages),));
                }
                _pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                  width: width(context) * 0.97,
                  height: height(context) * 0.065,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF2972FE),
                        Color(0xFF6499FF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(32).r,
                  ),
                  child: Center(
                      child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ))),
            ),
          ),
          SizedBox(
            height: height(context) * .0353,
          ),
        ],
      ),
    );
  }

  void switchAuthPages() => setState(
        () {
          isLogged = !isLogged;
        },
      );
}
