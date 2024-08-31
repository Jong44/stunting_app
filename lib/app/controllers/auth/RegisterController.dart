import 'package:get/get.dart';
import 'package:stunting_app/app/services/AuthService.dart';

class RegisterController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

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

  void register() async {
    if (name.value.isEmpty) {
      Get.snackbar('Error', 'Nama tidak boleh kosong');
      return;
    }
    if (email.value.isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong');
      return;
    }
    if (password.value.isEmpty) {
      Get.snackbar('Error', 'Password tidak boleh kosong');
      return;
    }
    if (confirmPassword.value.isEmpty) {
      Get.snackbar('Error', 'Konfirmasi Password tidak boleh kosong');
      return;
    }
    if (password.value != confirmPassword.value) {
      Get.snackbar('Error', 'Password dan Konfirmasi Password tidak sama');
      return;
    }
    isLoading.value = true;
    final AuthService authService = AuthService();
    final responseSignUp = await authService.signUpWithEmailAndPassword(
      name.value,
      email.value,
      password.value,
    );
    if (responseSignUp['status']) {
      final responseEmailVerification =
          await authService.sendEmailVerification();
      if (responseEmailVerification['status']) {
        Get.offNamed('/email-verification');
        Get.snackbar('Success', responseSignUp['message']);
      } else {
        Get.snackbar('Error', responseEmailVerification['message']);
      }
    } else {
      Get.snackbar('Error', responseSignUp['message']);
    }
    isLoading.value = false;
  }
}
