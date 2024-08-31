import 'package:get/get.dart';
import 'package:stunting_app/app/services/UserService.dart';

class InitialController extends GetxController {
  var initialRoute = '/login'.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  void checkAuth() async {
    final responseCheckSignIn = await UserService().getUser();
    if (responseCheckSignIn['status']) {
      final responseCheckUser = await UserService().checkUserFirestore();
      if (responseCheckUser['status']) {
        Get.offNamed('/mainpage');
      } else {
        Get.offNamed('/register-data');
      }
    }
  }
}
