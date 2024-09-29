import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/CommunityController.dart';

class CommunityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityController>(() => CommunityController());
  }
}
