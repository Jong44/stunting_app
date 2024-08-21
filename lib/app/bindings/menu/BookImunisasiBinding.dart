import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/BookImunisasiController.dart';

class BookImunisasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookImunisasiController>(() => BookImunisasiController());
  }
}
