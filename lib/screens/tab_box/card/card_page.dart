// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/screens/tab_box/card/card_info.dart';
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
          padding: EdgeInsets.only(top: 14.r),
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0.r),
        child: Consumer<OrdersViewModel>(
          builder: (context, orderViewModel, child) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.92,
              mainAxisSpacing: 8.5,
              crossAxisSpacing: 5,
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
