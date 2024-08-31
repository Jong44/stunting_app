import 'dart:async';

import 'package:get/get.dart';
import 'package:stunting_app/app/services/AuthService.dart';

class EmailVerifController extends GetxController {
  // coutndown timer 2 minutes
  var countdown = 120.obs;
  var displayCountdown = '02:00'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkVerification();
    startCountdown();
  }

  void checkVerification() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final response = await AuthService().checkEmailVerified();
      if (response['status']) {
        timer.cancel();
        Get.offNamed('/register-data');
      }
    });
  }

  void startCountdown() {
    countdown.value = 120;
    displayCountdown.value = '02:00';
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        timer.cancel();
      } else {
        countdown.value--;
        displayCountdown.value =
            '${(countdown.value ~/ 60).toString().padLeft(2, '0')}:${(countdown.value % 60).toString().padLeft(2, '0')}';
      }
    });
  }

  void resendEmail() async {
    final response = await AuthService().sendEmailVerification();
    if (response['status']) {
      startCountdown();
    } else {
      Get.snackbar('Error', response['message']);
    }
  }
}
