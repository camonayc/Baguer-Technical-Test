import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_baguer/controllers/login_controller.dart';
import 'package:technical_test_baguer/models/models.dart';
import 'package:technical_test_baguer/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  final LoginController _loginController =
      LoginController.initializeController();

  List<User> users = [];

  HomeScreen({Key? key}) : super(key: key) {
    users = _loginController.listUsers;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.height);
    return Obx(() => _loginController.isLoading.value == true
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.lightGreen,
              centerTitle: true,
              title: const Text(
                "Bienvenido",
                style: TextStyle(fontSize: 30),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      await _loginController.logOut();
                    },
                    icon: const Icon(Icons.logout_outlined))
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.03, bottom: size.height * 0.015),
                    child: Text(
                      "Lista de Usuarios",
                      style: TextStyle(fontSize: size.height * 0.0439),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: size.height * 0.015,
                        top: size.height * 0.015,
                        left: size.height * 0.015,
                        right: size.height * 0.015),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: size.height * 0.015),
                          width: size.height * 0.0439,
                          child: Text(
                            "#",
                            style: TextStyle(fontSize: size.height * 0.0234),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.height * 0.015, right: size.height * 0.0073),
                          width: size.height * 0.0732,
                          child: Text(
                            "Foto",
                            style: TextStyle(fontSize: size.height * 0.0234),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.height * 0.015, right: size.height * 0.0219),
                          width: size.height * 0.102,
                          child: Text(
                            "Nombre",
                            style: TextStyle(fontSize: size.height * 0.0234),
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.only(left: size.height * 0.0219, right: size.height * 0.03),
                          width: size.height * 0.102,
                          child: Text(
                            "Apellido",
                            style: TextStyle(fontSize: size.height * 0.0234),
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.only(
                            left: size.height * 0.0219,
                          ),
                          width: size.height * 0.08784,
                          child: Text(
                            "Detalles",
                            style: TextStyle(fontSize: size.height * 0.0234),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.7,
                    margin: EdgeInsets.only(
                        top: size.height * 0.015,
                        left: size.height * 0.015,
                        right: size.height * 0.015),
                    child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) => Container(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.03),
                              child: Row(
                                children: [
                                  Container(
                                    width: size.height * 0.0585,
                                    padding:  EdgeInsets.only(left: size.height * 0.0219),
                                    margin:  EdgeInsets.only(right: size.height * 0.0073),
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                          fontSize: size.height * 0.0234),
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.0732,
                                    width: size.height * 0.0732,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(users[index]
                                                .picture
                                                .thumbnail))),
                                  ),
                                  Container(
                                      width: size.height * 0.0732 * 2,
                                      margin: EdgeInsets.only(
                                          left: size.height * 0.03),
                                      child: Text(
                                        users[index].name.first,
                                        style: TextStyle(
                                            fontSize: size.height * 0.0234),
                                      )),
                                  SizedBox(
                                      width: size.height * 0.0732 * 2,
                                      child: Text(
                                        users[index].name.last,
                                        style: TextStyle(
                                            fontSize: size.height * 0.0234),
                                      )),
                                  Container(
                                      width: size.height * 0.0732,
                                      margin:  EdgeInsets.only(
                                        left: size.height * 0.015,
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            Get.toNamed(AppRoutes.details,
                                                arguments: users[index]);
                                          },
                                          icon:  Icon(
                                            Icons.arrow_circle_right_outlined,
                                            size: size.height * 0.0468,
                                          ))),
                                ],
                              ),
                            )),
                  ),
                ],
              ),
            )));
  }
}
