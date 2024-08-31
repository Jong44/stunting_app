import 'package:get/get.dart';
import 'package:stunting_app/app/bindings/auth/EmailVerifBinding.dart';
import 'package:stunting_app/app/bindings/auth/LoginBinding.dart';
import 'package:stunting_app/app/bindings/auth/RegisterBinding.dart';
import 'package:stunting_app/app/bindings/auth/RegisterDataBinding.dart';
import 'package:stunting_app/app/bindings/mainpage/MainBinding.dart';
import 'package:stunting_app/app/bindings/menu/BookImunisasiBinding.dart';
import 'package:stunting_app/app/controllers/menu/BookImunisasiController.dart';
import 'package:stunting_app/app/views/auth/EmailVerifPage.dart';
import 'package:stunting_app/app/views/auth/LoginPage.dart';
import 'package:stunting_app/app/views/auth/RegisterDataPage.dart';
import 'package:stunting_app/app/views/auth/RegisterPage.dart';
import 'package:stunting_app/app/views/mainpage/MainPage.dart';
import 'package:stunting_app/app/views/menu/BookImunisasiPage.dart';

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
      name: '/email-verification',
      page: () => const EmailVerifPage(),
      binding: EmailVerifBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: "/register-data",
        page: () => const RegisterDataPage(),
        binding: RegisterDataBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: '/mainpage',
      page: () => const MainPage(),
      binding: IndexMainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/booking-vaksin',
      page: () => const BookImunisasiPage(),
      transition: Transition.fadeIn,
      binding: BookImunisasiBinding(),
    ),
  ];
}
