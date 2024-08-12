import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void login() {
    print('Email: ${email.value}');
    print('Password: ${password.value}');
    Get.offAllNamed('/mainpage');
  }
}
