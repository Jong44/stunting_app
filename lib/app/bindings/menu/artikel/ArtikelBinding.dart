import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/artikel/ArtikelController.dart';

class ArtikelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtikelController());
  }
}
