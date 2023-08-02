import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_firbase_app/utils/style.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUtils {
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }
  static PriseTextAtHome( context,Color myColor1,String data , String text,Color myColor2){
    return   RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: text.tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: myColor1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: "${data.toString()} ",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: myColor2,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
  }
  static AppDvider (){
    return Divider(
              height: 9.0.h,
              thickness: 0.9,
              color: const Color.fromARGB(231, 228, 157, 76),
              indent: 21.0,
              endIndent: 21.0,
            );
  }

  static MyTextRow(String key, String value) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(key,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Text(value,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(231, 252, 159, 51)))
        ]));
  }
  static MyTextSort(int size, String productName,int viewSize){
    return  Container(
                height: 30,
                width: 140,
                color: Colors.transparent,
                child: Center(
                    child: productName.length < size
                        ? Text(productName,
                            style: MyTextStyle.sfProBold,
                            textAlign: TextAlign.center)
                        : Text("${productName.substring(0, viewSize)}...",
                            style: MyTextStyle.sfProBold,
                            textAlign: TextAlign.center)));
  }

  // ignore: non_constant_identifier_names
  static MyTextColumn(String key, String value) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(key,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text(value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ],
        ));
  }

  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static Future<bool> onUrlOpen(LinkableElement link) async =>
      await launchUrl(Uri.parse(link.url));

  static Future<bool?> getUrlOpenFailToast() {
    return Fluttertoast.showToast(
      msg: "Can't open Url",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    disabledBorder: InputBorder.none,
    labelText: label,
    labelStyle: MyTextStyle.sfProRegular.copyWith(
      color: Colors.black,
      fontSize: 14,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 25,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.9,
        color: Colors.black,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 0.9, color: Colors.black),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 0.9, color: Colors.red),
    ),
  );
}
