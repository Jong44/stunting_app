import 'package:get/get.dart';

class GameController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}
