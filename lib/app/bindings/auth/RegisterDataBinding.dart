import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/auth/RegisterDataController.dart';

class RegisterDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterDataController());
  }
}
