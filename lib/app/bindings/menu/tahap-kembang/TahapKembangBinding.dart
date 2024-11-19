import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/tahap-kembang/TahapKembangController.dart';

class TahapKembangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TahapKembangController>(() => TahapKembangController());
  }
}
