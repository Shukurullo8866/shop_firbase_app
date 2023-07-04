import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/utils/app_image.dart';
import '../../utils/color.dart';
import '../../utils/my_utils.dart';
import '../../utils/style.dart';
import '../../view_model/auth_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.onClickSignUp}) : super(key: key);

  final VoidCallback onClickSignUp;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: MyColors.C_4C5661,
        ),
        flexibleSpace: Container(color: MyColors.white),
        elevation: 0, // Pastki soyaning kordikligini 0 ga o'zgartiramiz
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            SizedBox(
                height: 250,
                width: double.infinity,
                child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    child: Image.asset(
                      AppImage.d_r,
                      fit: BoxFit.cover,
                      height: 250,
                    ))),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
          
                style: MyTextStyle.sfProRegular.copyWith(
                  color: MyColors.black,
                  fontSize: 17,
                ),
                decoration: getInputDecoration(label: "Email",),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                style: MyTextStyle.sfProRegular.copyWith(
                  color: MyColors.black,
                  fontSize: 17,
                ),
                decoration: getInputDecoration(label: "Password"),
              ),
            ),
            const SizedBox(height: 100),
            TextButton(onPressed: signIn, child: Text("Sign In")),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: MyTextStyle.sfProRegular
                    .copyWith(color: const Color(0xFFFBDF00), fontSize: 18),
                text: "Don't have an account?  ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickSignUp,
                    text: "Sign Up",
                    style: MyTextStyle.sfProBold.copyWith(
                      color: const Color(0xFFFBDF00),
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //" Hello World  "

  Future<void> signIn() async {
    Provider.of<AuthViewModel>(context, listen: false).signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
