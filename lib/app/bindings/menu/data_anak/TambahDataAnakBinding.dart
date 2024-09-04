import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/data_anak/TambahDataAnakController.dart';

class TambahDataAnakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahDataAnakController>(() => TambahDataAnakController());
  }
}
