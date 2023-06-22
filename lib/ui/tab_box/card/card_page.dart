// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          // actions: const [
          //   Icon(
          //     Icons.search_rounded,
          //     color: Colors.orange,
          //   ),
          // ],
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        body: Consumer<OrdersViewModel>(
          builder: (context, orderViewModel, child) {
            if (orderViewModel.userOrders != null) {
              
              return ListView.builder(
                
                itemCount: orderViewModel.userOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = orderViewModel.userOrders[index];
                  return ListTile(
                    title: Text(product.productName),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
