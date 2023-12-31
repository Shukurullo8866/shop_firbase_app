import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/widgets/all_product.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/widgets/button.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/widgets/imageView.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';
import 'package:shop_firbase_app/view_model/order_view_model.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/app_formatter.dart';
import '../../../../utils/app_image.dart';
import '../../../../view_model/product_view_model.dart';
import '../../tab_box.dart';

class CardInfoPage extends StatefulWidget {
  const CardInfoPage({super.key, required this.getData});
  final OrderModel getData;

  @override
  State<CardInfoPage> createState() => _CardInfoPageState();
}

int isOn = 0;

class _CardInfoPageState extends State<CardInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100, width: 190),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (isOn == 0) {
                    isOn += 1;
                    setState(() {});
                    print("idididididididididididididididid");
                    context
                        .read<OrdersViewModel>()
                        .userOrders
                        .map((e) => print(e..productId.toString()));
                    print("ssssssssssssssssssssssssssssssssssssssssssssS");
                    print(isOn.toString());
                    print(widget.getData.productId.toString());
                    // ignore: unused_local_variable
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
                    // ignore: unused_local_variable
                    ProductModel productModel = ProductModel(
                      count: widget.getData.count,
                      price: widget.getData.totalPrice,
                      productImages: widget.getData.productImages,
                      categoryId: widget.getData.createdAt,
                      productId: widget.getData.productId,
                      productName: widget.getData.productName,
                      description: widget.getData.orderStatus,
                      createdAt: widget.getData.createdAt,
                      currency: widget.getData.orderStatus,
                      light: true,
                    );

                    print(isOn);
                  } else if (isOn != 0) {
                    isOn = 0;
                    setState(() {});
                    print(
                        "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDelet");
                    print(widget.getData.productId.toString());
                    print(isOn.toString());
                    Provider.of<OrdersViewModel>(context, listen: false)
                        .deleteOrder(docId: widget.getData.productId);
                    ProductModel productModel = ProductModel(
                      count: widget.getData.count,
                      price: widget.getData.totalPrice,
                      productImages: widget.getData.productImages,
                      categoryId: widget.getData.orderId,
                      productId: widget.getData.productId,
                      productName: widget.getData.productName,
                      description: widget.getData.orderStatus,
                      createdAt: widget.getData.createdAt,
                      currency: widget.getData.orderStatus,
                      light: false,
                    );
                    context
                        .read<ProductViewModel>()
                        .updateProduct(productModel);
                  }
                });
              },
              icon: const Icon(
                1 < 2 ? Icons.favorite : Icons.favorite_border,
                color: Colors.orange,
              ))
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color.fromARGB(255, 221, 133, 2),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TabBox(),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => ImageView(
                      imageUrl: widget.getData.productImages[0].toString(),
                    ),
                  ),
                ),
                child: widget.getData.productImages.isEmpty
                    ? SizedBox(
                        height: 280.h,
                      )
                    : Container(
                        height: 280,
                        color: Colors.transparent,
                        child: AnimatedSize(
                          curve: Curves.bounceIn,
                          duration: const Duration(seconds: 1),
                          child: Image.network(
                            widget.getData.productImages[0],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
              ),
              const Divider(
                  height: 3.0,
                  thickness: 0.5,
                  color: Color.fromARGB(231, 228, 157, 76),
                  indent: 0.1,
                  endIndent: 0.1),
              const SizedBox(height: 15),
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
                    " ${widget.getData.totalPrice.toString()} ${widget.getData.count} ",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              const Divider(
                  height: 8.0,
                  thickness: 0.8,
                  color: Color.fromARGB(231, 228, 157, 76),
                  indent: 1.0,
                  endIndent: 1.0),
              MyUtils.MyTextRow(
                  "Omborda mavjud:", "${widget.getData.count} - kub"),
              MyUtils.MyTextRow(
                  "Kelgan sanasi:",
                  AppFormatter.orderTime(
                      DateTime.parse(widget.getData.createdAt.toString()))),
              const SizedBox(height: 8),
              MyUtils.MyTextColumn(
                  "Mahsulot haqida:", widget.getData.orderStatus),
              const Divider(
                  height: 1.0,
                  thickness: 0.8,
                  color: Color.fromARGB(231, 228, 157, 76),
                  indent: 1.0,
                  endIndent: 1.0),
              const SizedBox(height: 41),
              SizedBox(
                  height: 220,
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
                            return ZoomTapAnimation(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          CardInfoPage(getData: widget.getData),
                                    ));
                              },
                              child: SizedBox(
                                height: 150,
                                width: 180,
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
                  })),
              SizedBox(height: 75.h),
            ]),
            Positioned(
              bottom: 0.1,
              left: 0.1,
              right: 0.1,
              child: Container(
                padding: const EdgeInsets.only(right: 5, left: 5),
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
