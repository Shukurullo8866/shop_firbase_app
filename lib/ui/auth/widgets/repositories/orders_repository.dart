import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_firbase_app/data/model/order_model.dart';
import '../../../../utils/my_utils.dart';

class OrdersRepository {
  final FirebaseFirestore _firestore;

  OrdersRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addOrder({required OrderModel orderModel}) async {
    try {
      var newOrder =
          await _firestore.collection("orders").add(orderModel.toJson());
      _firestore.collection("orders").doc(newOrder.id).update({
        "orderId": newOrder.id,
      });
      MyUtils.getMyToast(message: "Buyurtma  Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteOrdersById({required String docId}) async {
    try {
      await _firestore.collection("orders").doc(docId).delete();

      MyUtils.getMyToast(message: "O'rder O'chirish  Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateOrder({required OrderModel orderModel}) async {
    try {
      await _firestore
          .collection("orders")
          .doc(orderModel.orderId)
          .update(orderModel.toJson());

      MyUtils.getMyToast(message: "O'chirish Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<OrderModel>> getOrders({required String userId}) => _firestore
      .collection("orders")
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList());

           Stream<List<OrderModel>> getOrdersByUser({required String userId}) => _firestore
      .collection("orders").where("userId",isEqualTo: userId)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList());
}
