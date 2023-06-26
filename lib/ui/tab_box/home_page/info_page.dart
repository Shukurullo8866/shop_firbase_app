import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/all_product.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/button.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/imageView.dart';
import 'package:shop_firbase_app/utils/style.dart';
import 'package:shop_firbase_app/view_model/order_view_model.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_image.dart';
import '../../../view_model/product_view_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.getData});
  final ProductModel getData;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  bool isOn = false;

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
              if (isOn == false) {
                isOn = true;
                OrderModel orderModel = OrderModel(
                    orderId: widget.getData.categoryId,
                    productId: widget.getData.productId,
                    count: 1,
                    totalPrice: widget.getData.price,
                    createdAt: DateTime.now().toString(),
                    userId:
                        context.read<ProfileViewModel>().user!.uid.toString(),
                    orderStatus: widget.getData.price.toString(),
                    productName: widget.getData.productName);

                Provider.of<OrdersViewModel>(context, listen: false)
                    .addOrder(orderModel);
              } else if (isOn == true) {
                isOn == false;
                Provider.of<OrdersViewModel>(context, listen: false)
                    .deleteOrder(widget.getData.categoryId);
                print(widget.getData.categoryId);
              }
            },
            icon: Icon(isOn == false
                ? Icons.heart_broken_outlined
                : Icons.heart_broken_outlined),
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
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => ImageView(
                    imageUrl: widget.getData.productImages[0].toString(),
                  ),
                ),
              ),
              child: Container(
                height: 280,
                color: Colors.amberAccent,
                child: AnimatedSize(
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: Image.network(
                    widget.getData.productImages[0],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            " ${widget.getData.price.toString()} ${widget.getData.currency}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        " Full decription  ${widget.getData.description}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        width: double.infinity,
                        child: Text(
                          " Product caunt: ${widget.getData.count.toString()}",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ButtonWidget(),
                      ),
                      Consumer<ProductViewModel>(
                        builder: (context, productViewModel, child) {
                          if (productViewModel.products.isNotEmpty) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productViewModel.products.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                var product =
                                    productViewModel.products[index];
                                if (product.categoryId ==
                                    widget.getData.categoryId) {
                                  return ProductsScreen(data: product);
                                } else
                                  const SizedBox();
                              },
                            );
                          } else {
                            return const SliverToBoxAdapter(
                              child: Center(
                                child: Text("error"),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
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
          );*/ 