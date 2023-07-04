// ignore_for_file: unused_catch_clause
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../data/model/user_model.dart';
import '../data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final ProfileRepository _profileRepository;

  ProfileViewModel(
      {required FirebaseAuth firebaseAuth,
      required ProfileRepository profileRepository})
      : _firebaseAuth = firebaseAuth,
        _profileRepository = profileRepository {
    listenUser();
    fetchUser();
  }

  User? user;
  UserModel? userModel;

  fetchUser() async {
    userModel = await _profileRepository.getSingleUser(
        userId: FirebaseAuth.instance.currentUser!.uid);
  }

  Stream<User?> getCurrentUser() => _firebaseAuth.authStateChanges();

  listenUser() {
    _firebaseAuth.authStateChanges().listen((updatedUser) {
      user = updatedUser;
      notifyListeners();
    });
  }

  addUser(UserModel userModel) =>
      _profileRepository.addUser(userModel: userModel);

  setUserName(String userName) async {
    try {
      _firebaseAuth.currentUser!.updateDisplayName(userName);
    // ignore: empty_catches
    } on FirebaseAuthException catch (er) {}
  }
 
  updatePhoto(String photo) => _firebaseAuth.currentUser!.updatePhotoURL(photo);

  updateFCMToken(String fcmToken, String docId) => 
      _profileRepository.updateUserFCMToken(fcmToken: fcmToken, docId: docId);
}
                                                                                                        