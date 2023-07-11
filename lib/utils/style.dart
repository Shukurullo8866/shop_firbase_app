import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';


class MyTextStyle {
  // ignore: prefer_const_constructors
  static final TextStyle sfProLight = TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'SFUIDisplay',
    fontSize: 14,
    color: MyColors.textColor,
  );

  // ignore: prefer_const_constructors
  static final TextStyle sfProRegular = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'SFUIDisplay',
    fontSize: 14,
    color: MyColors.textColor,
  );

  // ignore: prefer_const_constructors
  static final TextStyle sfProMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'SFUIDisplay',
    fontSize: 14,
    color: MyColors.textColor,
  );

  // ignore: prefer_const_constructors
  static final TextStyle sfProSemibold = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: MyColors.textColor,
  );

  // ignore: prefer_const_constructors
  static final TextStyle sfProBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'SFUIDisplay',
    fontSize: 14,
    color: MyColors.textColor,
  );

  // ignore: prefer_const_constructors
  static final TextStyle sfBold800 = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'SFUIDisplay',
    fontSize: 14,
    color: MyColors.textColor,
  );

  // ignore: prefer_const_constructors
  static final TextStyle sfProBlack = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: 'SFUIDisplay',
    fontSize: 14,
    color: MyColors.textColor,
  );
}
/*

    CREATED BY: BAKHROMJON POLAT
    CREATED AT: Sep 27 2022 11:12

    Github: https://github.com/BahromjonPolat
    Linked In: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: Decoration shapes which used in application

*/



class AppShape {
  static circularBorder({double radius = 8.0}) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      );

  static simple({double radius = 10, Color color = MyColors.C_4C5661}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
      );

 

  static cardDesign({
    double radius = 10,
    Color color = MyColors.C_4C5661,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(blurRadius: 3.r, color: MyColors.grey.withOpacity(.5)),
          // BoxShadow(blurRadius: 5.r, color: AppColors.grey),
        ],
      );
}


class AppTextStyle {
  const AppTextStyle._();
  static const String _INTER = 'Inter';

  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, Color? color) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: _INTER,
      color: color ?? MyColors.black,
      fontWeight: fontWeight,
    );
  }

  // regular style
  static TextStyle regular({double size = 16.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w400, color);
  }



// bold text style
  static TextStyle bold({double size = 22.0, Color? color}) {
    return _getTextStyle(size, FontWeight.bold, color);
  }

// semi bold text style
  static TextStyle semiBold({double size = 14.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w600, color);
  }

// medium text style

  static TextStyle medium({double size = 16.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w500, color);
  }

  static TextStyle getButtonStyle({double size = 14.0}) => TextStyle(
        letterSpacing: 0.8,
        color: MyColors.white,
        fontWeight: FontWeight.w600,
        fontSize: size.sp,
      );
}
