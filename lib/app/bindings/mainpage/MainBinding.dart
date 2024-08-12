import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/MainController.dart';

class IndexMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
