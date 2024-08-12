import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/auth/RegisterController.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
