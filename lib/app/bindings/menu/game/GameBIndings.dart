import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/game/GameController.dart';

class GameBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
  }
}
