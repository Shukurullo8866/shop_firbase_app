import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_firbase_app/utils/style.dart';

import '../../../data/model/order_model.dart';

// ignore: must_be_immutable
class OrderItemsScreen extends StatelessWidget {
  OrderItemsScreen({super.key, required this.data});
  OrderModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => InfoPage(
        //       getData: data,
        //     ),
        //   ),
        //);
      },
      child: Container(
        height: 150.h,
        width: 100.w,
        margin: EdgeInsets.only(left: 8.r, right: 8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 0.8.w, color: const Color.fromARGB(231, 228, 157, 76)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: '${data.productImages[0]}',
                width: 125.w,
                height: 105.h,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    period: const Duration(seconds: 2),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 120.w,
                      height: 100.h,
                      color: Colors.white,
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(
                    Icons.signal_cellular_connected_no_internet_0_bar_outlined),
              ),
            ),
            SizedBox(
              height: 10.h,
              width: 30.w,
            ),
            Text(data.productName, style: MyTextStyle.sfProMedium),
            Divider(
              height: 8.0.h,
              thickness: 0.8,
              color: Color.fromARGB(231, 228, 157, 76),
              indent: 21.0,
              endIndent: 21.0,
            ),
            SizedBox(height: 2.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Mavjud: ".tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.green,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: "${data.count.toString()} kub",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Price: ".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: '${data.totalPrice} ${data.orderStatus}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.amber,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
