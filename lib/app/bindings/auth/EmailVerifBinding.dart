import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/auth/EmailVerifController.dart';

class EmailVerifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerifController>(() => EmailVerifController());
  }
}
