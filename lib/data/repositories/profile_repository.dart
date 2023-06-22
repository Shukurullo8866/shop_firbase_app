import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_firbase_app/data/model/user_model.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore;

  ProfileRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addUser({required UserModel userModel}) async {
    try {
      await _firestore.collection("users").add(userModel.toJson());
      MyUtils.getMyToast(message: "User muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }
}