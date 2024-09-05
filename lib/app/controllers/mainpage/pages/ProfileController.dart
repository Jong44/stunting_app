import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/services/AuthService.dart';
import 'package:stunting_app/app/services/UserService.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var isEdit = false.obs;

  var dataProfile = {}.obs;
  var listProvinceAll = [].obs;
  var listKabupatenAll = [].obs;
  var listKecamatanAll = [].obs;
  var listProvince = [].obs;
  var listKabupaten = [].obs;
  var listKecamatan = [].obs;

  var controllerUsername = TextEditingController().obs;
  var controllerNama = TextEditingController().obs;
  var jenisKelamin = "".obs;
  var controllerEmail = TextEditingController().obs;
  var provinsi = {}.obs;
  var kabupaten = {}.obs;
  var kecamatan = {}.obs;
  var newImage = File("").obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      newImage.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      newImage.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  void showBottomSheetImagePicker() {
    Get.bottomSheet(
      Container(
        height: 120,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                getImageFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                getImageFromGallery();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  void getProfile() async {
    isLoading(true);
    final response = await UserService().getUserData();
    if (response['status']) {
      dataProfile(response['data']);
    }
    initController();
    isLoading(false);
  }

  void setEdit() {
    isEdit.value = !isEdit.value;
  }

  void initController() {
    controllerUsername.value.text = dataProfile['username'];
    controllerNama.value.text = dataProfile['name'];
    jenisKelamin.value = dataProfile['gender'];
    controllerEmail.value.text = dataProfile['email'];
    provinsi.value['name'] = dataProfile['province'];
    kabupaten.value['name'] = dataProfile['kabupaten'];
    kecamatan.value['name'] = dataProfile['kecamatan'];
    newImage.value = File("");
    init();
  }

  void init() async {
    isLoading.value = true;
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

    listProvince.forEach((element) {
      if (element['name'] == provinsi.value['name']) {
        provinsi.value = element;
        listKabupaten.value = listKabupatenAll.where((element) {
          return element['idProvince'] == provinsi.value['id'];
        }).toList();
      }
    });

    listKabupaten.forEach((element) {
      if (element['name'] == kabupaten.value['name']) {
        kabupaten.value = element;
        listKecamatan.value = listKecamatanAll.where((element) {
          return element['idKabupaten'] == kabupaten.value['id'];
        }).toList();
      }
    });

    listKecamatan.forEach((element) {
      if (element['name'] == kecamatan.value['name']) {
        kecamatan.value = element;
      }
    });

    isLoading.value = false;
  }

  void setProvince(Map value) {
    provinsi.value = value;
    listKabupaten.value = listKabupatenAll.where((element) {
      return element['idProvince'] == value['id'];
    }).toList();
    if (!listKabupaten.contains(kabupaten.value)) {
      kabupaten.value = {};
      kecamatan.value = {};
    }
  }

  void setKabupaten(Map value) {
    kabupaten.value = value;
    listKecamatan.value = listKecamatanAll.where((element) {
      return element['idKabupaten'] == value['id'];
    }).toList();
    if (!listKecamatan.contains(kecamatan.value)) {
      kecamatan.value = {};
    }
  }

  void setKecamatan(Map value) {
    kecamatan.value = value;
  }

  void setGender(String value) {
    jenisKelamin.value = value;
  }

  void updateProfile() async {
    isLoading(true);
    if (newImage.value.path != "") {
      print('upload image');
      final response = await UserService()
          .uploadProfilePicture(newImage.value, dataProfile['image'] ?? "");
      if (response['status']) {
        final responseUpdate = await UserService().updateDataUserFirestore(
          controllerUsername.value.text,
          controllerNama.value.text,
          controllerEmail.value.text,
          jenisKelamin.value,
          provinsi.value['name'],
          kabupaten.value['name'],
          kecamatan.value['name'],
        );
        if (responseUpdate['status']) {
          Get.snackbar('Success', 'Profile updated');
          getProfile();
        } else {
          Get.snackbar('Error', responseUpdate['message']);
        }
      } else {
        Get.snackbar('Error', response['message']);
      }
    } else {
      final responseUpdate = await UserService().updateDataUserFirestore(
        controllerUsername.value.text,
        controllerNama.value.text,
        controllerEmail.value.text,
        jenisKelamin.value,
        provinsi.value['name'],
        kabupaten.value['name'],
        kecamatan.value['name'],
      );
      if (responseUpdate['status']) {
        Get.snackbar('Success', 'Profile updated');
        getProfile();
      } else {
        Get.snackbar('Error', responseUpdate['message']);
      }
    }
    isLoading(false);
  }

  void logout() async {
    isLoading(true);
    final response = await AuthService().signOut();
    if (response['status']) {
      Get.offAllNamed('/login');
    } else {
      Get.snackbar('Error', response['message']);
    }
    isLoading(false);
  }
}
