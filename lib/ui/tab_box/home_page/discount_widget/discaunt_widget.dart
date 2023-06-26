import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';
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
    return Container(
      height: 200,
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
                    "https://celes.club/uploads/posts/2022-08/1661217387_8-celes-club-p-tekstura-plankena-instagram-8.jpg"),
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
                                        fontWeight: FontWeight.w600,color: Colors.white)),
                            TextSpan(
                                text: productName.length > 15 ? "..." : "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,color: Colors.white))
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
                                      fontWeight: FontWeight.w600,color: Colors.white),
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
                          color: Color.fromARGB(255, 250, 245, 237),
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
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: CachedNetworkImage(
                //     imageUrl:
                //         'https://mir-s3-cdn-cf.behance.net/project_modules/fs/3e2c1f41522677.57a9ad1c87e3e.jpg',
                //     width: 80.w,
                //     height: 100.h,
                //     fit: BoxFit.cover,
                //     placeholder: (context, url) {
                //       return Shimmer.fromColors(
                //         period: const Duration(seconds: 2),
                //         baseColor: Colors.grey.shade300,
                //         highlightColor: Colors.grey.shade100,
                //         child: Container(
                //           width: 120,
                //           height: 100,
                //           color: Colors.white,
                //         ),
                //       );
                //     },
                //     errorWidget: (context, url, error) =>
                //         const Icon(Icons.error),
                //   ),
                // ),
                Container(
                  height: 200.h,
                  width: 140.w,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    // border: Border.all(
                    //   color: Colors.black, // Set the border color
                    //   width: 2.0, // Set the border width
                    // ),
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
