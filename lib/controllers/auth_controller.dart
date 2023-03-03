import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:technical_test_baguer/routes/routes.dart';

class AuthController extends GetxController {
  AuthController();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;
}
