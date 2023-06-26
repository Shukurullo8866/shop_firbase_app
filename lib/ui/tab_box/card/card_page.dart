// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/ui/tab_box/card/card_info.dart';
import 'package:shop_firbase_app/view_model/order_view_model.dart';

import '../../../utils/app_image.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
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
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.orange,
        ),
      ),
      body: Consumer<OrdersViewModel>(
        builder: (context, orderViewModel, child) {
          return ListView(
            children: List.generate(
              orderViewModel.userOrders.length,
              (index) {
                var order = orderViewModel.userOrders[index];
                return ListTile(
                  title: Text(order.productName),
                  onTap: () {
                    orderViewModel.getSingleProduct(order.productId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => CardInfo(
                          orderModel: order,
                        ),
                      ),
                    );
                  },
                  trailing: Text("Kub:${order.count}"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
