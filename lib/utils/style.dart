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

  // static withImage({
  //   String? image,
  //   double radius = 10,
  //   Color color = AppColors.lightGreen,
  // }) =>
  //     BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(radius.r),
  //       image: image != null
  //           ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))
  //           : const DecorationImage(
  //               fit: BoxFit.cover,
  //               image: AssetImage(AppImages.),
  //             ),
  //     );

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
