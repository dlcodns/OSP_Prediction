import 'package:flutter/material.dart';
import 'package:flutter_tryon/config/app_router.dart';
import 'package:flutter_tryon/src/binding/initial_binding.dart';
import 'package:flutter_tryon/src/pages/login/loginpage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter-tryon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBinding(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: LoginPage(),
    );
  }
}
