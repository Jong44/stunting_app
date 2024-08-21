import 'package:get/get.dart';

class MainController extends GetxController {
  var tabIndex = 2.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
