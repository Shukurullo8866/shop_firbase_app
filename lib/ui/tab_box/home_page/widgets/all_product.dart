import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';

import '../info_page.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.data});
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InfoPage(
              getData: data ,
            ),
          ),
        );
      },
      child: Container(
        height: 150,
        width: 140,
        margin: const EdgeInsets.only(left: 5, right: 5),
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 0.8, color: const Color.fromARGB(255, 232, 220, 185)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: '${data.productImages[0]}',
                width: 120.w,
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
                errorWidget: (context, url, error) => const Icon(
                    Icons.signal_cellular_connected_no_internet_0_bar_outlined),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 30,
            ),
            Text(data.productName),

            SizedBox(height: 5.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Mavjud: ".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.green,fontSize: 14.sp, fontWeight: FontWeight.w600),
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
                    text: '${data.price} ${data.currency}',
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
