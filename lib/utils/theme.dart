import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppTheme {
  /// Light mode

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: MyColors.black,
      ),
      backgroundColor: MyColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: MyColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.white,
      elevation: 8,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: MyColors.white,
      elevation: 6,
    ),
    hintColor: MyColors.grey,
    scaffoldBackgroundColor: MyColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: MyColors.white,
    primaryColor: MyColors.white,
    // useMaterial3: true,
    cardColor: MyColors.black,
    shadowColor: MyColors.grey.withOpacity(0.5),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: MyColors.black),
    splashColor: MyColors.white,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      ),
      displayMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700),
      ),
      displaySmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      ),
      headlineMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
      headlineSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),
      ),
      titleLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),
      ),
      labelMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: MyColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
      ),
    ),
  );

  /// Dark mode

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: MyColors.white,
      ),
      backgroundColor: MyColors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: MyColors.black,
    popupMenuTheme: const PopupMenuThemeData(
      color: MyColors.black,
      elevation: 6,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.grey.withOpacity(0.85),
      elevation: 8,
    ),
    //  useMaterial3: true,
    splashColor: MyColors.black,
    hintColor: MyColors.grey,
    cardColor: MyColors.white,
    scaffoldBackgroundColor: MyColors.black,
    primaryColor: MyColors.c_222222,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: MyColors.black,
    shadowColor: MyColors.c_222222,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: MyColors.white),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: MyColors.white, fontSize: 57.sp, fontWeight: FontWeight.w800),
      displayMedium: TextStyle(
          color: MyColors.white, fontSize: 45.sp, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
          color: MyColors.white, fontSize: 36.sp, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          color: MyColors.white, fontSize: 28.sp, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: MyColors.white, fontSize: 24.sp, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: MyColors.white, fontSize: 22.sp, fontWeight: FontWeight.w300),
      labelMedium: TextStyle(
          color: MyColors.white, fontSize: 16.sp, fontWeight: FontWeight.w200),
    ),
  );
}
