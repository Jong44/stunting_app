import 'package:get/get.dart';
import 'package:stunting_app/app/bindings/auth/LoginBinding.dart';
import 'package:stunting_app/app/bindings/auth/RegisterBinding.dart';
import 'package:stunting_app/app/bindings/mainpage/MainBinding.dart';
import 'package:stunting_app/app/views/auth/LoginPage.dart';
import 'package:stunting_app/app/views/auth/RegisterPage.dart';
import 'package:stunting_app/app/views/mainpage/MainPage.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/mainpage',
      page: () => const MainPage(),
      binding: IndexMainBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
