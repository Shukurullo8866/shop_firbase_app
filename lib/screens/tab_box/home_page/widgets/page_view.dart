import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTitleWidget extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  final double screenWidth;
  final String title;
  final Widget page;

  CategoryTitleWidget({
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
    required this.page,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w800, fontSize: 18.sp),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page));
              },
              child: Container(
                width: 60.w,
                height: 25.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Davomi'.tr(),
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 16),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  double get maxExtent => screenHeight * 0.05;

  @override
  double get minExtent => screenHeight * 0.05;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
















// class PageViewWidget extends StatelessWidget {
//   const PageViewWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.2,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(
//               "https://images.immediate.co.uk/production/volatile/sites/3/2022/05/Untitled-design-38-cccd4b7.png"),fit: BoxFit.cover
//         ),
//       ),
//     );
//   }
// }
//  BU COTEGORYLAR ICHIDA ALL PRODUCT F BOR
 // ListTile(
                      //   title: const Text("All"),
                      //   onTap: () {
                      //     Provider.of<ProductViewModel>(
                      //       context,
                      //       listen: false,
                      //     ).listenProducts("");
                      //   },
                      // ),
                      // ...List.generate(
                      //   categories.length,
                      //   (index) => ListTile(

                      //     onTap: () {
                      //       Provider.of<ProductViewModel>(
                      //         context,
                      //         listen: false,
                      //       ).listenProducts(categories[index].category_Id);
                      //     },
                      //   ),
                      // ),