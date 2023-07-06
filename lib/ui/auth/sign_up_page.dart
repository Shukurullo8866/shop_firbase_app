import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/user_model.dart';
import 'package:shop_firbase_app/ui/auth/widgets/my_rich_text.dart';
import 'package:shop_firbase_app/ui/auth/widgets/signIn_button.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';

import '../../utils/app_image.dart';
import '../../utils/color.dart';
import '../../utils/my_utils.dart';
import '../../utils/style.dart';
import '../../view_model/auth_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? "Enter a valid email"
                          : null,
                  style: MyTextStyle.sfProRegular.copyWith(
                    color: MyColors.white,
                    fontSize: 17,
                  ),
                  decoration: getInputDecoration(label: "Email"),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password != null && password.length < 6
                          ? "Enter at least 6 charcter !"
                          : null,
                  style: MyTextStyle.sfProRegular.copyWith(
                    color: MyColors.white,
                    fontSize: 17,
                  ),
                  decoration: getInputDecoration(label: "Password"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password != null && password.length < 6
                          ? "Enter at least 6 charcter !"
                          : null,
                  style: MyTextStyle.sfProRegular.copyWith(
                    color: MyColors.white,
                    fontSize: 17,
                  ),
                  decoration: getInputDecoration(label: "Confirm password"),
                ),
              ),
              const SizedBox(height: 50),
              SingnInButton(onTap: signUp, text: "Sign Up"),
              const SizedBox(height: 20),
              MyRichText(
                onTap: widget.onClickedSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (confirmPassword == password) {
      await Provider.of<AuthViewModel>(context, listen: false).signUp(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      Provider.of<ProfileViewModel>(context, listen: false).addUser(
        UserModel(
          fcmToken: "",
          docId: "",
          age: 0,
          userId: FirebaseAuth.instance.currentUser!.uid,
          fullName: "",
          email: email,
          createdAt: DateTime.now().toString(),
          imageUrl: "",
        ),
      );
    } else {
      MyUtils.getMyToast(message: "Passwords don't match!");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
