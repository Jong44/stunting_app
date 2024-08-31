import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/services/UserService.dart';

class RegisterDataController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  var isLoading = false.obs;

  var name = ''.obs;
  var email = ''.obs;
  var gender = 'Laki - Laki'.obs;
  var province = {}.obs;
  var kabupaten = {}.obs;
  var kecamatan = {}.obs;

  var listProvince = [].obs;
  var listKabupaten = [].obs;
  var listKecamatan = [].obs;

  var listProvinceAll = [].obs;
  var listKabupatenAll = [].obs;
  var listKecamatanAll = [].obs;

  void setName(String value) {
    name.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void setProvince(Map value) {
    province.value = value;
    listKabupaten.value = listKabupatenAll.where((element) {
      return element['idProvince'] == value['id'];
    }).toList();
  }

  void setKabupaten(Map value) {
    kabupaten.value = value;
    listKecamatan.value = listKecamatanAll.where((element) {
      return element['idKabupaten'] == value['id'];
    }).toList();
  }

  void setKecamatan(Map value) {
    kecamatan.value = value;
  }

  void init() async {
    isLoading.value = true;
    final response = await UserService().getEmail();
    if (response['status']) {
      email.value = response['data'];
    }
    String jsonProvinceString =
        await rootBundle.loadString('assets/data/provinsi.json');
    String jsonKabupatenString =
        await rootBundle.loadString('assets/data/kabupaten.json');
    String jsonKecamatanString =
        await rootBundle.loadString('assets/data/kecamatan.json');

    List<dynamic> jsonProvince = jsonDecode(jsonProvinceString);
    List<dynamic> jsonKabupaten = jsonDecode(jsonKabupatenString);
    List<dynamic> jsonKecamatan = jsonDecode(jsonKecamatanString);

    listProvinceAll.value = jsonProvince;
    listKabupatenAll.value = jsonKabupaten;
    listKecamatanAll.value = jsonKecamatan;

    listProvince.value = jsonProvince;
    listKabupaten.value = jsonKabupaten;
    listKecamatan.value = jsonKecamatan;
    isLoading.value = false;
  }

  void register() async {
    if (name.value.isEmpty) {
      Get.snackbar('Error', 'Nama tidak boleh kosong');
      return;
    }
    if (email.value.isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong');
      return;
    }
    if (province.value['name'].isEmpty) {
      Get.snackbar('Error', 'Provinsi tidak boleh kosong');
      return;
    }
    if (kabupaten.value['name'].isEmpty) {
      Get.snackbar('Error', 'Kabupaten tidak boleh kosong');
      return;
    }
    if (kecamatan.value['name'].isEmpty) {
      Get.snackbar('Error', 'Kecamatan tidak boleh kosong');
      return;
    }

    isLoading.value = true;

    final responseUser = await UserService().getUser();
    if (responseUser['status']) {
      final responseSaveData = await UserService().saveDataUserFirestore(
        responseUser['data'].uid,
        name.value,
        email.value,
        province.value['name'],
        kabupaten.value['name'],
        kecamatan.value['name'],
      );
      if (responseSaveData['status']) {
        Get.offAllNamed('/mainpage');
      } else {
        Get.snackbar('Error', responseSaveData['message']);
      }
    } else {
      Get.snackbar('Error', responseUser['message']);
    }
    isLoading.value = false;
  }
}
