import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color(0xFF27459F);
  static const Color backgroundColor = Color(0xFFF3F5F9);
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color textColor = Color(0xFF3E434D);
  static const Color C_F2F2F2 = Color(0xFFF2F2F2); 

  static const grey = Colors.grey;
  static const c_1F1914 = Color(0xff1F1914);
  static const c_222222 = Color(0xff222222);
  static const C_4C5661 = Color(0xFF4C5661);


}


class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xffF86142,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFE6F6E1),
      100: Color(0xFFC1E8B5),
      200: Color(0xFF97D984),
      300: Color(0xFF6DC953),
      400: Color(0xFF4EBE2E),
      500: Color(0xFF2FB209),
      600: Color(0xFF2AAB08),
      700: Color(0xFF23A206),
      800: Color(0xFF1D9905),
      900: Color(0xFF128A02),
    },
  );
}