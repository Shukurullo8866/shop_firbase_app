import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_firbase_app/utils/app_image.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/const.dart';

class DiscountWidget extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  DiscountWidget({required this.screenHeight});

  List images = [
    AppImage.sliver1,
    AppImage.sliver2,
    AppImage.sliver3,
    AppImage.sliver4,
  ];
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    String productName = "Orzularingizni biz bilan quring! ";
    return SizedBox(
      height: 200.h,
      width: width(context),
      child: CarouselSlider(
        items: List.generate(
          4,
          (index) => Container(
            // padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
            height: screenHeight * 0.18,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.025),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://as2.ftcdn.net/v2/jpg/02/14/73/19/1000_F_214731909_HJjnYXsyW9KkoP9S2E61ZqUSjAoXi8bp.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: productName.substring(
                                  0,
                                  productName.length > 15
                                      ? 15
                                      : productName.length,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                            TextSpan(
                                text: productName.length > 15 ? "..." : "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height(context) * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: productName.substring(15),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.036),
                    ZoomTapAnimation(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                          left: screenHeight * 0.010,
                        ),
                        height: screenHeight * 0.034,
                        width: screenHeight * 0.18,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 245, 237),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Center(
                          child: Text(
                            'Call now'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      const Color.fromARGB(231, 228, 157, 76),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                Container(
                  height: 200.h,
                  width: 140.w,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(screenHeight * 0.026),
                      topRight: Radius.circular(screenHeight * 0.026),
                    ),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          aspectRatio: 2.0,
          initialPage: 0,
        ),
      ),
    );
  }

  @override
  double get maxExtent => screenHeight * 0.18;

  @override
  double get minExtent => screenHeight * 0.18;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
