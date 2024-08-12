import 'package:get/get.dart';

class RegisterController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void setName(String value) {
    name.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void register() {
    print('Name: ${name.value}');
    print('Email: ${email.value}');
    print('Password: ${password.value}');
    print('Confirm Password: ${confirmPassword.value}');
  }
}
