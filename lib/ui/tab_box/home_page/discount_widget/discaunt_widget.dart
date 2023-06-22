import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/const.dart';

class DiscountWidget extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  DiscountWidget({required this.screenHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    String productName = "Buyerda sizni reklamangiz bo'lishi mumkun edi";
    return Container(
      height: 200,
      width: width(context),
      child: CarouselSlider(
        items: List.generate(
          3,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
            height: screenHeight * 0.18,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.025),
              image: const DecorationImage(
                  image: NetworkImage(
                    "https://legnomarket.ru/upload/resize_cache/iblock/c5d/1200_1200_1649c0523bd23f2a24c1f158db6fa34bc/Korza-orekh-3D.3.0.13.1-_1_.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${"Hello Tashkent"}% ",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(fontSize: 25.sp),
                          ),
                          TextSpan(
                            text: 'Off'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(fontSize: 25.sp),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: productName.substring(
                                0,
                                productName.length > 18
                                    ? 18
                                    : productName.length,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: productName.length > 18 ? "..." : "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Price: ".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '${"Pull"}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.016),
                    ZoomTapAnimation(
                      onTap: () {},
                      child: Container(
                        height: screenHeight * 0.034,
                        width: screenHeight * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'get_now'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://mir-s3-cdn-cf.behance.net/project_modules/fs/3e2c1f41522677.57a9ad1c87e3e.jpg',
                    width: 80.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        period: const Duration(seconds: 2),
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 120,
                          height: 100,
                          color: Colors.white,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
          viewportFraction: 0.9,
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
