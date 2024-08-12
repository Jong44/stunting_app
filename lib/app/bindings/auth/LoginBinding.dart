import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/auth/LoginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
