import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ()  async {
// if we are unable to launch the phone app, we will throw an error. This is what the below line means. launch is an in-built function provided by url_launcher.
                // ignore: deprecated_member_use
                if (!await launch('sms:+998971233323')) {
                  throw 'Could not launch message app';
                }
              
            },
            child: Container(
              width: 150.h,
              height: 50.w,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 0.8, color: Color.fromARGB(255, 238, 219, 161)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromARGB(231, 228, 157, 76),
              ),
              child: const Center(
                child: Text(
                  "Habar yuborish",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
// if we are unable to launch the phone app, we will throw an error. This is what the below line means. launch is an in-built function provided by url_launcher
                // ignore: deprecated_member_use
                if (!await launch('tel:+998971233323')) {
                  throw 'Could not launch phone app';
                }
              
            },
            child: Container(
              width: 150.h,
              height: 50.w,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 0.8, color: const Color.fromARGB(255, 238, 219, 161)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromARGB(231, 228, 157, 76),
              ),
              child: const Center(
                child: Text(
                  "Biz bilan bog'lanish",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
