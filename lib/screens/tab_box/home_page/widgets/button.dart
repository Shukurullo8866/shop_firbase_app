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
          SizedBox(
            width: 160.h,
            height: 50.w,
            child: ElevatedButton(
              onPressed: () async {
                // ignore: deprecated_member_use
                if (!await launch('sms:+998971233323')) {
                  throw 'Could not launch message app';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(231, 243, 169, 84), // Button color
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: const Text(
                'Habar yuborish',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 160.h,
            height: 50.w,
            child: ElevatedButton(
              onPressed: () async {
                // ignore: deprecated_member_use
                if (!await launch('tel:+998971233323')) {
                  throw 'Could not launch phone app';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(231, 243, 169, 84), // Button color
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              child: const Text("Biz bilan bog'lanish",
                  style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
