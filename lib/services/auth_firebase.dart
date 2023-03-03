import 'package:firebase_auth/firebase_auth.dart';
import 'package:technical_test_baguer/domain/repository/auth_repository.dart';

class AuthFirebase implements AuthRepository {
  @override
  Future<UserCredential> signInWithEmail(
      final String userName, final String passWord) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userName, password: passWord);
  }
}
