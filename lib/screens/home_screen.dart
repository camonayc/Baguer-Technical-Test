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
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: const Text(
                      "Lista de Usuarios",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 10, top: 10, left: 10, right: 10),
                    child: Row(
                      children: [
                        // Container(
                        //   margin: const EdgeInsets.only(left: 10),
                        //   width: 30,
                        //   child: const Text(
                        //     "#",
                        //     style: TextStyle(fontSize: 16),
                        //   ),
                        // ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 5),
                          width: 50,
                          child: const Text(
                            "Foto",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 15),
                          width: 70,
                          child: const Text(
                            "Nombre",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 20),
                          width: 70,
                          child: const Text(
                            "Apellido",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          width: 60,
                          child: const Text(
                            "Detalles",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height - 200,
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  // Container(
                                  //   width: 40,
                                  //   padding: const EdgeInsets.only(left: 15),
                                  //   margin: const EdgeInsets.only(right: 5),
                                  //   child: Text(
                                  //     "${index + 1}",
                                  //     style: const TextStyle(fontSize: 16),
                                  //   ),
                                  // ),
                                  Container(
                                    height: 50,
                                    width: 50,
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
                                      width: 100,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        users[index].name.first,
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                  SizedBox(
                                      width: 100,
                                      child: Text(
                                        users[index].name.last,
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                  Container(
                                      width: 50,
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            Get.toNamed(AppRoutes.details,
                                                arguments: users[index]);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            size: 32,
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
