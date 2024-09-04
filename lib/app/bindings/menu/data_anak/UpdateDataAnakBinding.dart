import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/data_anak/UpdateDataAnakController.dart';

class UpdateDataAnakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateDataAnakController>(() => UpdateDataAnakController());
  }
}
