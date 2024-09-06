import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/resep/ResepController.dart';

class ResepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResepController>(() => ResepController());
  }
}
