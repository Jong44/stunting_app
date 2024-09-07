import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/maps/MapsPemetaanController.dart';

class MapsPemetaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsPemetaanController>(() => MapsPemetaanController());
  }
}
