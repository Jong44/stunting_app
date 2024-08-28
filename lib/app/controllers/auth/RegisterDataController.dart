import 'package:get/get.dart';

class RegisterDataController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var gender = 'Laki - Laki'.obs;
  var province = ''.obs;
  var kabupaten = ''.obs;
  var kecamatan = ''.obs;

  void setName(String value) {
    name.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void setProvince(String value) {
    province.value = value;
  }

  void setKabupaten(String value) {
    kabupaten.value = value;
  }

  void setKecamatan(String value) {
    kecamatan.value = value;
  }

  void register() {
    print('Name: ${name.value}');
    print('Email: ${email.value}');

    Get.offNamed('/mainpage');
  }
}
