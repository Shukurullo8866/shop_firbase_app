import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';

import '../../../../utils/my_utils.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;


  Future<void> addCategory({required CategoryModel categoryModel}) async {
    try {
      var newCategory =
          await _firestore.collection("categories").add(categoryModel.toJson());
      _firestore.collection("cotegories").doc(newCategory.id).update({
        "category_Id": newCategory.id,
      });
      MyUtils.getMyToast(message: "Category Qoshish Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteCategory({required String docId}) async {
    try {
      await _firestore.collection("cotegories").doc(docId).delete();

      MyUtils.getMyToast(message: "Categories O'chirish  Muvaffaqiyatli Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateCategory({required CategoryModel categoryModel}) async {
    try {
      await _firestore
          .collection("categories")
          .doc(categoryModel.categoryId)
          .update(
            categoryModel.toJson(),
          );

      MyUtils.getMyToast(message: "Yangilanish  Bajarildi");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<CategoryModel>> getCategory() => _firestore
      .collection("categories")
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList());

  
}