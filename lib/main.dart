import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: AppPages.pages,
      title: 'Stunting App',
      theme: ThemeData(
        primarySwatch: ColorConfig.primaryColor,
        fontFamily: 'PlusJakartaSans',
      ),
    );
  }
}
