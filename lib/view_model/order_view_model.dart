import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';


import 'package:flutter/material.dart';

import '../data/model/product_model.dart';
import '../data/repositories/orders_repository.dart';
class OrdersViewModel extends ChangeNotifier {
  final OrdersRepository ordersRepository;

  OrdersViewModel({required this.ordersRepository}) {
    listenOrders(FirebaseAuth.instance.currentUser!.uid);
  }

  late StreamSubscription subscription;

  ProductModel? productModel;

  List<OrderModel> userOrders = [];

  listenOrders(String userId) async {
    subscription =
        ordersRepository.getOrdersByUserId(userId: userId).listen((List<OrderModel> orders) {
      userOrders = orders;
      notifyListeners();
    });
  }

  addOrder(OrderModel orderModel, ) =>
      ordersRepository.addOrder( orderModel: orderModel, orderId: orderModel.orderId,);

  updateOrderIfExists({
    required String productId,
    required int count,
  }) {
    OrderModel orderModel =
        userOrders.firstWhere((element) => element.productId == productId);

    int currentCount = orderModel.count;

    int price = orderModel.totalPrice ~/ orderModel.count;

    ordersRepository.updateOrder(
      orderModel: orderModel.copWith(
        count: currentCount + count,
        totalPrice: price * (currentCount + count),
      ),
    );
  }

  updateOrder(OrderModel orderModel) =>
      ordersRepository.updateOrder(orderModel: orderModel);

  getSingleProduct(String docId) async {
    productModel = await ordersRepository.getSingleProductById(docId: docId);
    notifyListeners();
  }

  deleteOrder({required String docId}) {
    print("DELETET O'RDER DOC ID  ${docId}");
     ordersRepository.deleteOrderById(docId: docId);
     print("DELETET O'RDER CHECK");
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  }