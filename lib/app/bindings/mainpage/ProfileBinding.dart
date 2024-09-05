import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ProfileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
