import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_firbase_app/data/model/user_model.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';


class UsersRepository {
  final FirebaseFirestore _firestore;

  UsersRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;


  Future<void> deleteUser({required String docId}) async {
    try {
      await _firestore.collection("users").doc(docId).delete();
      MyUtils.getMyToast(message: "User muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<UserModel>> getUsers() =>
      _firestore.collection("users").snapshots().map(
            (event1) => event1.docs
                .map((doc) => UserModel.fromJson(doc.data()))
                .toList(),
          );
}