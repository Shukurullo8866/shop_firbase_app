import 'package:firebase_auth/firebase_auth.dart';
import '../data/repositories/auth_repository.dart';

class AuthViewModel {
  final AuthRepository _authRepository;

  AuthViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  signIn({
    required String password,
    required String email,
  }) =>
      _authRepository.signIn(password: password, email: email);

  signUp({
    required String password,
    required String email,
  }) =>
      _authRepository.signUp(password: password, email: email);
  Stream<User?> checkAuthState() => _authRepository.authState();
}
