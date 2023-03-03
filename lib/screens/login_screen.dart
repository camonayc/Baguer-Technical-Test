import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_baguer/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController controllerUser = TextEditingController();
  final FocusNode _focusNodeUser = FocusNode();

  TextEditingController controllerPassword = TextEditingController();
  final FocusNode _focusNodePassword = FocusNode();

  final FocusNode _focusLoginButton = FocusNode();

  final LoginController _loginController =
      LoginController.initializeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                final FocusScopeNode focus = FocusScope.of(context);
                if (!focus.hasPrimaryFocus && focus.hasFocus) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.lightGreen,
                          Colors.white,
                          Colors.white,
                          Colors.lightGreen
                        ],
                        begin: Alignment.topCenter,
                        stops: [0.45, 0.45, 1, 1])),
                child: Center(
                    child: Obx(
                  () => _loginController.isLoading.value == true
                      ? const CircularProgressIndicator(
                          color: Colors.lightGreen,
                        )
                      : Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: size.height * 0.03,
                                  bottom: size.height * 0.13177,
                                  right: size.height * 0.0366 * 6),
                              height: size.height * 0.0366 * 6,
                              width: size.height * 0.0366 * 6,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.grey),
                                  image: DecorationImage(
                                      image: Image.asset("assets/baguer.png")
                                          .image)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        bottom: size.height * 0.0366,
                                        right: size.height * 0.03 / 2,
                                        top: size.height * 0.03),
                                    child: Icon(Icons.account_circle,
                                        size: size.height * 0.044,
                                        color: Colors.grey)),
                                Container(
                                    height: size.height * 0.0366 * 3,
                                    padding: EdgeInsets.only(
                                        left: size.height * 0.03 / 4,
                                        bottom: size.height * 0.0366,
                                        right: size.height * 0.03 / 2,
                                        top: size.height * 0.03),
                                    width: size.height * 0.33675,
                                    child: TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          focusColor: Colors.grey,
                                          fillColor: Colors.grey,
                                          border: const OutlineInputBorder(),
                                          label: Text(
                                            _loginController.labelUser.value,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          )),
                                      controller: controllerUser,
                                      focusNode: _focusNodeUser,
                                      cursorColor: Colors.grey,
                                      onChanged: (v) {
                                        _loginController.userName.value =
                                            controllerUser.text;
                                      },
                                      onEditingComplete: () {
                                        log(_loginController.userName.value);
                                        FocusScope.of(context)
                                            .requestFocus(_focusNodePassword);
                                      },
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        bottom: size.height * 0.0366,
                                        right: size.height * 0.03 / 2,
                                        top: size.height * 0.03),
                                    child: Icon(Icons.lock,
                                        size: size.height * 0.044,
                                        color: Colors.grey)),
                                Container(
                                    height: size.height * 0.0366 * 3,
                                    padding: EdgeInsets.only(
                                        left: size.height * 0.0366 / 5,
                                        bottom: size.height * 0.0366,
                                        right: size.height * 0.03 / 2,
                                        top: size.height * 0.03),
                                    width: size.height * 0.33675,
                                    child: TextField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          focusColor: Colors.grey,
                                          fillColor: Colors.grey,
                                          border: const OutlineInputBorder(),
                                          label: Text(
                                            _loginController
                                                .labelPassword.value,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          )),
                                      controller: controllerPassword,
                                      focusNode: _focusNodePassword,
                                      cursorColor: Colors.grey,
                                      onChanged: (v) {
                                        _loginController.passWord.value =
                                            controllerPassword.text;
                                      },
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(_focusLoginButton);
                                      },
                                    ))
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: size.height * 0.1756),
                            ),
                            TextButton(
                              focusNode: _focusLoginButton,
                              onFocusChange: (value) async {
                                if (value) {
                                  await _loginController.logIn();
                                }
                              },
                              child: Container(
                                height: size.height * 0.0366 * 2,
                                width: size.height * 0.0366 * 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                child: Center(
                                    child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: size.height * 0.03),
                                )),
                              ),
                              onPressed: () async {
                                await _loginController.logIn();
                              },
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.03)),
                            const Text(
                              "Version 1.0.0",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
