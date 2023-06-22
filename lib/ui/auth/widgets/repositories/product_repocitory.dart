// ignore_for_file: unused_import, avoid_web_libraries_in_flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';

import '../../../../utils/my_utils.dart';


class ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addProduct({required ProductModel productModel}) async {
    try {
      var newProduct =
          await _firestore.collection("products").add(productModel.toJson());
      _firestore.collection("products").doc(newProduct.id).update({
        "productId": newProduct.id,
      });
      MyUtils.getMyToast(message: "Qoshish Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteProduct({required String docId}) async {
    try {
      await _firestore.collection("products").doc(docId).delete();

      MyUtils.getMyToast(message: "Mahsulot muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateProduct({required ProductModel productModel}) async {
    try {
      await _firestore
          .collection("products")
          .doc(productModel.productId)
          .update(
            productModel.toJson(),
          );

      MyUtils.getMyToast(message: "O'chirish Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }
 Stream<List<ProductModel>> getProducts({required String category_Id}) async* {
    if (category_Id.isEmpty) {
      yield* _firestore.collection("products").snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => ProductModel.fromJson(doc.data()))
                .toList(),
          );
    } else {
      yield* _firestore
          .collection("products")
          .where("category_Id", isEqualTo: category_Id)
          .snapshots()
          .map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => ProductModel.fromJson(doc.data()))
                .toList(),
          );
    }
  }

}
