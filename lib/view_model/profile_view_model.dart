// ignore_for_file: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/user_model.dart';
import 'package:shop_firbase_app/data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final ProfileRepository _profileRepository;

  ProfileViewModel(
      {required FirebaseAuth firebaseAuth,
      required ProfileRepository profileRepository})
      : _firebaseAuth = firebaseAuth,
        _profileRepository = profileRepository {
    listenUser();
  }

  User? user;

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
    } on FirebaseAuthException {}
  }

  updatePhoto(String photo) => _firebaseAuth.currentUser!.updatePhotoURL(photo);
}