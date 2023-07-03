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
          color: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Consumer<OrdersViewModel>(
          builder: (context, orderViewModel, child) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 10.0, // Spacing between grid items vertically
                crossAxisSpacing: 10.0, // Spacing between grid items horizontally
                childAspectRatio: 1.0, // Aspect ratio of each grid item
              ),
              scrollDirection: Axis.vertical,
              itemCount: orderViewModel.userOrders.length,
              itemBuilder: (BuildContext context, int index) {
                var data = orderViewModel.userOrders[index];
                return OrderItemsScreen(data: data);
              },
            );
          },
        ),
      ),
    );
  }
}
