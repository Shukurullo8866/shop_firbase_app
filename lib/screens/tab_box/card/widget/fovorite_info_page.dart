// ignore_for_file: unused_local_variable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/widgets/all_product.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/widgets/button.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';
import 'package:shop_firbase_app/view_model/order_view_model.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';

import '../../../../utils/app_formatter.dart';
import '../../../../utils/app_image.dart';
import '../../../../view_model/product_view_model.dart';

class FavoriteInfoPage extends StatefulWidget {
  const FavoriteInfoPage({super.key, required this.getData});
  final OrderModel getData;
  @override
  State<FavoriteInfoPage> createState() => _FavoriteInfoPageState();
}

int isOn = 0;

class _FavoriteInfoPageState extends State<FavoriteInfoPage> {
  @override
  Widget build(BuildContext context) {
    context.read<OrdersViewModel>().userOrders.map(
        (e) => e.productId == widget.getData.productId ? isOn = 1 : isOn = 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14).r,
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(
                () {
                  context.read<OrdersViewModel>().userOrders.map((e) =>
                      e.productId == widget.getData.productId
                          ? isOn = 1
                          : isOn = 0);
                  if (isOn == 0) {
                    isOn = 1;
                    setState(() {});
                    OrderModel orderModel = OrderModel(
                      orderId: widget.getData.productId,
                      productId: widget.getData.productId,
                      count: 1,
                      totalPrice: widget.getData.totalPrice,
                      createdAt: DateTime.now().toString(),
                      userId: context.read<ProfileViewModel>().user!.uid,
                      orderStatus: widget.getData.totalPrice.toString(),
                      productName: widget.getData.productName,
                      productImages: widget.getData.productImages,
                    );
                    ProductModel productModel = ProductModel(
                      count: widget.getData.count,
                      price: widget.getData.totalPrice,
                      productImages: widget.getData.productImages,
                      categoryId: widget.getData.orderId,
                      productId: widget.getData.productId,
                      productName: widget.getData.productName,
                      description: widget.getData.orderStatus,
                      createdAt: widget.getData.createdAt,
                      currency: widget.getData.productName,
                      light: true,
                    );
                    Provider.of<OrdersViewModel>(context, listen: false)
                        .addOrder(orderModel);
                  } else if (isOn != 0) {
                    isOn = 0;
                    setState(() {});
                    Provider.of<OrdersViewModel>(context, listen: false)
                        .deleteOrder(docId: widget.getData.productId);
                  }
                },
              );
            },
            icon: Icon(
              isOn == 0 ? Icons.favorite_border : Icons.favorite,
              color: Colors.orange,
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color.fromARGB(255, 221, 133, 2),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              children: [
                Container(
                    height: 300,
                    child: widget.getData.productImages.isEmpty
                        ? SizedBox(height: 280.h)
                        : FullScreenWidget(
                            disposeLevel: DisposeLevel.Medium,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.getData.productImages[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                Divider(
                    height: 3.0.h,
                    thickness: 0.5,
                    color: const Color.fromARGB(231, 228, 157, 76),
                    indent: 0.1,
                    endIndent: 0.1),
                SizedBox(height: 15.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "  ${widget.getData.productName}:",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                          " ${widget.getData.orderStatus.toString()} ${widget.getData.orderStatus} ",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))
                    ]),
                SizedBox(height: 14.h),
                const Divider(
                    height: 8.0,
                    thickness: 0.8,
                    color: Color.fromARGB(231, 228, 157, 76),
                    indent: 1.0,
                    endIndent: 1.0),
                MyUtils.MyTextRow("Omborda mavjud:".tr(),
                    "${widget.getData.count} - kub".tr()),
                MyUtils.MyTextRow(
                    "Kelgan sanasi:".tr(),
                    AppFormatter.orderTime(
                        DateTime.parse(widget.getData.createdAt.toString()))),
                const SizedBox(height: 8),
                MyUtils.MyTextColumn(
                    "Mahsulot haqida:".tr(), widget.getData.orderStatus),
                const Divider(
                    height: 1.0,
                    thickness: 0.8,
                    color: Color.fromARGB(231, 228, 157, 76),
                    indent: 1.0,
                    endIndent: 1.0),
                SizedBox(height: 41.h),
                Container(
                  color: Colors.white,
                  height: 250.h,
                  child: Consumer<ProductViewModel>(
                    builder: (context, productViewModel, child) {
                      if (productViewModel.products.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: productViewModel.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            var product = productViewModel.products[index];
                            if (product.categoryId == widget.getData.orderId &&
                                widget.getData.productId != product.productId) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) =>
                                  //       //  FavoriteInfoPage(getData: product),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height: 120.h,
                                  width: 180.w,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20, right: 6, left: 6),
                                  child: ProductsScreen(data: product),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("error"),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 75.h),
              ],
            ),
            Positioned(
              bottom: 0.1.r,
              left: 0.1.r,
              right: 0.1.r,
              child: Container(
                padding: const EdgeInsets.only(right: 5, left: 5).r,
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.transparent,
                child: const ButtonWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
