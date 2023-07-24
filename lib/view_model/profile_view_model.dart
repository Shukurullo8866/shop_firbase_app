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

  _fetchSingleUser(String userId) async {
    userModel = _profileRepository.getSingleUser(userId: userId) as UserModel?;
    print("user user user user user user");
    print(userModel);
  }

  listenUser() {
    _firebaseAuth.authStateChanges().listen((getUser) async {
      if (getUser != null) {
        print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvwwwwwwwww");
        print(getUser);
        user = getUser;
        userModel = await _profileRepository.getSingleUser(
          userId: getUser.uid,
        );
        print(userModel);
      } else {
        user = null;
        userModel = null;
      }
      notifyListeners();
    });
  }

  addUser(UserModel userModel) =>
      _profileRepository.addUser(userModel: userModel);

  setUserName(String userName) async {
    try {
      _firebaseAuth.currentUser!.updateDisplayName(userName);
    } on FirebaseAuthException catch (er) {}
  }

  updatePhoto(String photo) => _firebaseAuth.currentUser!.updatePhotoURL(photo);

  updateFCMToken(String fcmToken, String docId) =>
      _profileRepository.updateUserFCMToken(fcmToken: fcmToken, docId: docId);
}
