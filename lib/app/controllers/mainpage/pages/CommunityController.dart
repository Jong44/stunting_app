import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stunting_app/app/services/CommunityService.dart';

class CommunityController extends GetxController {
  var isLoading = false.obs;

  var listCommunity = [].obs;
  var dataCommunity = {}.obs;

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  var kategoriList = [].obs;
  var selectedKategori = ''.obs;
  var newImage = File("").obs;

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getKategoriCommunity();
    getCommunity();
    clearForm();
  }

  void setSelectedKategori(String value) {
    selectedKategori.value = value;
  }

  void clearForm() {
    titleController.clear();
    contentController.clear();
    selectedKategori.value = '';
    newImage.value = File("");
  }

  void getKategoriCommunity() async {
    isLoading.value = true;
    final response = await CommunityService().getCategoryCommunity();
    if (response['status']) {
      final data = response['data'];
      data.map((e) {
        kategoriList.add(e['data']);
      }).toList();
    }
    isLoading.value = false;
  }

  void createThread() async {
    Get.snackbar(
      'Loading',
      'Tunggu sebentar!',
      showProgressIndicator: true,
    );
    if (titleController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Judul Tidak Boleh Kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (contentController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Konten Tidak Boleh Kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (selectedKategori.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Kategori Tidak Boleh Kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    final title = titleController.text;
    final content = contentController.text;
    final kategori = selectedKategori.value;
    final response = await CommunityService()
        .uploadThread(title, content, kategori, newImage.value);
    if (response['status']) {
      Get.back();
      clearForm();
      Get.snackbar(
        'Success',
        'Postingan Berhasil Dibuat',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar('Error', response['message']);
    }
  }

  void getCommunity() async {
    isLoading.value = true;
    final response = await CommunityService().getThread();
    if (response['status']) {
      final data = response['data'];
      listCommunity.value = data;
    }
    isLoading.value = false;
  }

  void changeDataCommunity(Map data) {
    dataCommunity.value = data;
  }
}
