import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import 'package:shop_firbase_app/ui/auth/widgets/repositories/orders_repository.dart';

class OrdersViewModel extends ChangeNotifier {
  final OrdersRepository ordersRepository;

  OrdersViewModel({
    required this.ordersRepository,
  }) {
    listenOrders(FirebaseAuth.instance.currentUser!.uid);
  }

  late StreamSubscription subscription;

  List<OrderModel> userOrders = [];

  listenOrders(String userId) async {
    subscription = ordersRepository.getOrdersByUser(userId: userId).listen(
      (orders) {
        userOrders = orders;
        notifyListeners();
      },
    );
  }

  addOrder(OrderModel orderModel) =>
      ordersRepository.addOrder(orderModel: orderModel);
  updateOrder(OrderModel orderModel) =>
      ordersRepository.updateOrder(orderModel: orderModel);
  deleteOrder(String docId) => ordersRepository.deleteOrdersById(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
