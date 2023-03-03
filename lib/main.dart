import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_baguer/controllers/auth_controller.dart';
import 'package:technical_test_baguer/firebase_options.dart';
import 'package:technical_test_baguer/routes/routes.dart';
import 'package:technical_test_baguer/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Technical test baguer',
        onGenerateRoute: AppRouting.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen());
  }
}
