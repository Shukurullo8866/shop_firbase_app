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
import '../../../utils/app_formatter.dart';
import '../../../utils/app_image.dart';
import '../../../view_model/product_view_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.getData});
  final ProductModel getData;
  @override
  State<InfoPage> createState() => _InfoPageState();
}

int isOn = 0;

class _InfoPageState extends State<InfoPage> {
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
                      totalPrice: widget.getData.price,
                      createdAt: DateTime.now().toString(),
                      userId: context.read<ProfileViewModel>().user!.uid,
                      orderStatus: widget.getData.price.toString(),
                      productName: widget.getData.productName,
                      productImages: widget.getData.productImages,
                    );
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
                      light: true,
                    );
                    Provider.of<OrdersViewModel>(context, listen: false)
                        .addOrder(orderModel);
                  } else if (isOn != 0) {
                    isOn = 0;
                    setState(() {});
                    Provider.of<OrdersViewModel>(context, listen: false)
                        .deleteOrder(docId: widget.getData.productId);
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
                      light: false,
                    );
                    context
                        .read<ProductViewModel>()
                        .updateProduct(productModel);
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
                SizedBox(
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
                        ),
                ),
                MyUtils.hameDvider(),
                SizedBox(height: 15.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: MyUtils.TextInfoName(
                            19, widget.getData.productName, 19),
                      ),
                      Text(
                          " ${widget.getData.price.toString()} ${widget.getData.currency} ",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))
                    ]),
                SizedBox(height: 14.h),
                MyUtils.hameDvider(),
                MyUtils.MyTextRow("Omborda mavjud:".tr(),
                    "${widget.getData.count} - kub".tr()),
                MyUtils.MyTextRow(
                    "Kelgan sanasi:".tr(),
                    AppFormatter.orderTime(
                        DateTime.parse(widget.getData.createdAt.toString()))),
                const SizedBox(height: 8),
                MyUtils.MyTextColumn(
                    "Mahsulot haqida:".tr(), widget.getData.description),
                MyUtils.hameDvider(),
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
                            if (product.categoryId ==
                                    widget.getData.categoryId &&
                                widget.getData.productId != product.productId) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          InfoPage(getData: product),
                                    ),
                                  );
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
