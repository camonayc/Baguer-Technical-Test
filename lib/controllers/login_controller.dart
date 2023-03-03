import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_baguer/services/api_data_services.dart';
import 'package:technical_test_baguer/models/models.dart' as m;
import 'package:technical_test_baguer/routes/routes.dart';
import 'package:technical_test_baguer/services/auth_firebase.dart';

class LoginController extends GetxController {
  static LoginController initializeController() {
    try {
      LoginController controller = Get.find<LoginController>();
      return controller;
    } catch (e) {
      LoginController controller = Get.put(LoginController());
      return controller;
    }
  }

  RxString labelUser = "Usuario".obs;
  RxString labelPassword = "Contraseña".obs;

  RxBool isLoading = false.obs;

  RxString userName = "".obs;
  RxString passWord = "".obs;

  RxList<m.User> listUsers = <m.User>[].obs;

  Future<void> logIn() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    try {
      UserCredential data =
          await AuthFirebase().signInWithEmail(userName.value, passWord.value);
      if (data.user != null) {
        await getUsers();
        Get.toNamed(AppRoutes.home);
        log("Iniciaste sesion");
      }
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Ups!", middleText: "No se pudo iniciar sesión");
      log("${e.message}");
    }
    isLoading.value = false;
  }

  Future<void> getUsers() async {
    DataService data = DataService();
    listUsers.value = await data.fetchUser();
  }

  Future<void> logOut() async {
    isLoading.value = true;
    userName = "".obs;
    passWord = "".obs;
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.login);
    isLoading.value = false;
  }
}
