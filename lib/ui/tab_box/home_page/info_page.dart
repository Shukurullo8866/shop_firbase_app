// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/all_product.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/button.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/imageView.dart';
import 'package:shop_firbase_app/view_model/order_view_model.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/app_image.dart';
import '../../../view_model/product_view_model.dart';
import '../tab_box.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.getData});
  final ProductModel getData;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  int isOn = 0;

  @override
  Widget build(BuildContext context) {
    //var userId = context.read<UserModel>().userId;

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
              setState(() {});
              if (isOn == 0 && widget.getData.light == false) {
                setState(() {});
                
                OrderModel orderModel = OrderModel(
                    orderId: widget.getData.price.toString(),
                    productId: widget.getData.productId,
                    count: 1,
                    totalPrice: widget.getData.price,
                    createdAt: DateTime.now().toString(),
                    userId: context.read<ProfileViewModel>().user!.uid,
                    orderStatus: widget.getData.price.toString(),
                    productName: widget.getData.productName,
                    productImages: widget.getData.productImages);

                ProductModel productModel = ProductModel(
                    count: widget.getData.count,
                    price: widget.getData.price,
                    productImages: widget.getData.productImages,
                    categoryId: widget.getData.categoryId,
                    productId: widget.getData.productId,
                    productName: widget.getData.productName,
                    description: widget.getData.description,
                    createdAt: widget.getData.createdAt,
                    currency: widget.getData.currency,
                    light: true);
                context.read<OrdersViewModel>().userOrders.map(
                      (e) => e.productId == widget.getData.productId
                          ? Provider.of<OrdersViewModel>(context, listen: false)
                              .addOrder(orderModel)
                          : const SizedBox(),
                    );
                setState(() {});
                context.read<ProductViewModel>().updateProduct(productModel);
                

              
                setState(() {
                  isOn = 1;
                });
              } else if(isOn <1){
                setState(() {});
                print("deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                print(widget.getData.price.toString());
                Provider.of<OrdersViewModel>(context, listen: true)
                    .deleteOrder(docId: widget.getData.price.toString());
                isOn = 0;
                ProductModel productModel = ProductModel(
                    count: widget.getData.count,
                    price: widget.getData.price,
                    productImages: widget.getData.productImages,
                    categoryId: widget.getData.categoryId,
                    productId: widget.getData.productId,
                    productName: widget.getData.productName,
                    description: widget.getData.description,
                    createdAt: widget.getData.createdAt,
                    currency: widget.getData.currency,
                    light: false);
                context.read<ProductViewModel>().updateProduct(productModel);
                setState(() {});
              }
            },
            icon: Icon(
              widget.getData.light == false
                  ? Icons.favorite_border
                  : Icons.favorite,
              color: Colors.orange,
            ),
          )
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
            ListView(
              children: [
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => ImageView(
                              imageUrl:
                                  widget.getData.productImages[0].toString(),
                            ),
                          ),
                        ),
                    child: widget.getData.productImages.isEmpty
                        ? Container(
                            height: 280,
                            color: Colors.red,
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
                          )),
                const Divider(
                  height: 3.0,
                  thickness: 0.5,
                  color: Color.fromARGB(231, 228, 157, 76),
                  indent: 0.1,
                  endIndent: 0.1,
                ),
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
                      " ${widget.getData.price.toString()} ${widget.getData.currency} ",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                const Divider(
                  height: 8.0,
                  thickness: 0.8,
                  color: Color.fromARGB(231, 228, 157, 76),
                  indent: 1.0,
                  endIndent: 1.0,
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Mahsulot haqida: \n${widget.getData.description}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Ishlab chiqilgan sanasi: \n${widget.getData.createdAt.toString()}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
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
                            if (product.categoryId ==
                                    widget.getData.categoryId &&
                                widget.getData.productId != product.productId) {
                              return ZoomTapAnimation(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          InfoPage(getData: product),
                                    ),
                                  );
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
                    },
                  ),
                ),
                SizedBox(height: 75.h),
              ],
            ),
            Positioned(
              bottom: 0.1,
              left: 0.1,
              right: 0.1,
              child: Container(
                padding: EdgeInsets.only(right: 5, left: 5),
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
/* SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductModel product = productViewModel.products[index];
                return ProductsScreen(data: product);
              },
              childCount: productViewModel.products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
               childAspectRatio: 0.88,
              mainAxisSpacing: 8.5,
              crossAxisSpacing: 5,
            ),

          );
          
           Consumer<ProductViewModel>(
              builder: (context, productViewModel, child) {
                if (productViewModel.products.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: productViewModel.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      var product = productViewModel.products[index];
                      if (product.categoryId == widget.getData.categoryId) {
                        return Container(
                          height: 150,
                          width: 200,
                          child: ProductsScreen(data: product));
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              },
            )
            */ 