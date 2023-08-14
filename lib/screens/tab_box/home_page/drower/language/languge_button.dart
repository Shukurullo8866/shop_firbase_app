import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/color.dart';
// ignore: must_be_immutable
class ChooseButton extends StatelessWidget {
  ChooseButton(
      {super.key,
      required this.image,
      required this.onTap,
      required this.selectedLang,
      required this.item,
      required this.language});
  VoidCallback onTap;
  int selectedLang;
  int item;
  String language;
  String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        decoration: BoxDecoration(
            boxShadow: selectedLang == item
                ? []
                : [
                    const BoxShadow(
                        color: Color.fromARGB(255, 127, 77, 3),
                        spreadRadius: 1.5,
                        blurRadius: 4)
                  ],
            borderRadius: BorderRadius.circular(24.r),
            color: selectedLang == item
                ? const Color.fromARGB(255, 201, 151, 76)
                : MyColors.white),
        height: 64.h,
        child: Row(
          children: [
            Container(
              height: 44.h,
              width: 44.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image:  DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            SizedBox(width: 12.w),
            Text(
              language,
              style: TextStyle(
                color: selectedLang == item
                    ? MyColors.white
                    : const Color.fromARGB(255, 221, 133, 2),
              ).copyWith(fontSize: 14.sp),
            ),
            const Spacer(),
            Container(
              width: 10.w,
              height: 10.h,
              padding: const EdgeInsets.all(2).r,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedLang == item ? MyColors.white : MyColors.black,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                width: 7.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
