import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const.dart';

Widget onBoardingWidget(
  BuildContext context, {
  required String image,
  required String dutyOfDoctor,
  required String desc1,
  required String desc2,
}) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        height: 550.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            filterQuality: FilterQuality.low,
            repeat: ImageRepeat.repeatX,
            image: AssetImage(
              image,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0.1,
        child: Container(
          width: width(context),
          height: height(context) * 0.352,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(40).r,
                topRight: const Radius.circular(40).r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context) * 0.041,
              ),
              Center(
                  child: Text(
                dutyOfDoctor,
                style: TextStyle(
                    color: Color.fromARGB(255, 254, 112, 41),
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp),
              )),
              SizedBox(
                height: height(context) * 0.019,
              ),
              Center(
                  child: Text(
                desc1,
                style:
                    TextStyle(fontSize: 16.sp, color: const Color(0xFF2C3A4B)),
              )),
              SizedBox(height: 2.h),
              Center(
                child: Text(
                  desc2,
                  style: TextStyle(
                      fontSize: 16.sp, color: const Color(0xFF2C3A4B)),
                ),
              ),
              SizedBox(height: height(context) * 0.09),
            ],
          ),
        ),
      ),
    ],
  );
}
