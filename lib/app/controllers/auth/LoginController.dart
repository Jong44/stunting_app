import 'package:get/get.dart';
import 'package:stunting_app/app/services/AuthService.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void login() async {
    isLoading.value = true;
    final responseSignIn = await AuthService().signInWithEmailAndPassword(
      email.value,
      password.value,
    );
    if (responseSignIn['status']) {
      Get.offAllNamed('/mainpage');
    } else {
      Get.snackbar('Error', responseSignIn['message']);
    }
    isLoading.value = false;
  }
}
