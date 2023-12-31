import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/style.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: MyTextStyle.sfProRegular.copyWith(
            color: const Color.fromARGB(255, 240, 147, 33),
            fontSize: 19,
            fontWeight: FontWeight.bold),
        text: "Already have an account? ",
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: "Sign In",
            style: MyTextStyle.sfProBold.copyWith(
              color: const Color.fromARGB(255, 235, 207, 25),
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
