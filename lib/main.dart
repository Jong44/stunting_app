import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/InitialController.dart';
import 'package:stunting_app/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final InitialController controller = Get.put(InitialController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: controller.initialRoute.value,
      getPages: AppPages.pages,
      title: 'Stunting App',
      theme: ThemeData(
        primarySwatch: ColorConfig.primaryColor,
        fontFamily: 'PlusJakartaSans',
      ),
    );
  }
}
