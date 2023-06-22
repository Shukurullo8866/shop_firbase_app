import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/data/model/user_model.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/button.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/imageView.dart';
import 'package:shop_firbase_app/utils/style.dart';
import 'package:shop_firbase_app/view_model/order_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_image.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.getData});
  final ProductModel getData;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  
  Widget build(BuildContext context) {
  var userId = context.read<UserModel>().userId;
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
                OrderModel orderModel = OrderModel(
                    orderId: widget.getData.categoryId,
                    productId: widget.getData.productId,
                    count: 1,
                    totalPrice: widget.getData.price,
                    createdAt: DateTime.now().toString(),
                    userId: userId,
                    orderStatus: widget.getData.price.toString(),
                    productName: widget.getData.productName);

                Provider.of<OrdersViewModel>(context, listen: false)
                    .addOrder(orderModel);
              },
              icon: Icon(Icons.heart_broken))
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
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 29),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          if (!await launch('sms:+998977588866')) {
                            throw 'Could not launch message app';
                          }
                        },
                        icon: Text(
                          "Product Name: \t ${widget.getData.productName}",
                          style: MyTextStyle.sfProMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Full decription \n \n ${widget.getData.description}",
                      ),
                      const SizedBox(height: 13),
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        width: double.infinity,
                        child: Text(
                          " Product caunt: ${widget.getData.count.toString()}",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 13, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total :",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
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
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ButtonWidget(),
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
