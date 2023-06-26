import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/order_model.dart';
import '../../../view_model/order_view_model.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key, required this.orderModel}) : super(key: key);
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card info"),
      ),
      body: Consumer<OrdersViewModel>(
        builder: (context, orderViewModel, child) {
          if (orderViewModel.productModel != null) {
            var product = orderViewModel.productModel!;
            return Column(
              children: [
                Text(orderModel.orderStatus),
                Text(orderModel.createdAt),
                Text(orderModel.count.toString()),
                Text(orderModel.totalPrice.toString()),
                Text(product.price.toString()),
                Image.network(product.productImages[0]),
                Text(product.description),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
