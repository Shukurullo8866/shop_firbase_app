import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/screens/auth/login_page.dart';
import 'package:shop_firbase_app/utils/app_image.dart';
import '../../utils/color.dart';
import '../../utils/const.dart';
import '../auth/widgets/signIn_button.dart';

class SignInOrSignUpScreen extends StatefulWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignInOrSignUpScreen> createState() => _SignInOrSignUpScreenState();
}

class _SignInOrSignUpScreenState extends State<SignInOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.059,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 40, right: 40).r,
              child: SizedBox(
                height: height(context) * 0.4,
                width: width(context) * 0.852,
                child: Image.asset(AppImage.d_r),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 24, right: 24).r,
              child: Text(
                "Welcome to DoctorQ!",
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 15, right: 15).r,
              child: InkWell(
                onTap: () {},
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
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15).r,
              child: SingnInButton(
                text: 'Sign In',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginPage(onClickSignUp: () {})));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
