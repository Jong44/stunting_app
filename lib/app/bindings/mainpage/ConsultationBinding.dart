import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ConsultationController.dart';

class ConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationController>(() => ConsultationController());
  }
}
