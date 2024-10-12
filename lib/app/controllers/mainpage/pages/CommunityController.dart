import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stunting_app/app/services/CommunityService.dart';
import 'package:stunting_app/app/services/UserService.dart';

class CommunityController extends GetxController {
  final _database = FirebaseDatabase.instance.ref();
  var isLoading = false.obs;
  var isOpenSelengkapnya = false.obs;

  var listCommunity = [].obs;
  var dataCommunity = {}.obs;

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  var kategoriList = [].obs;
  var selectedKategori = ''.obs;
  var newImage = File("").obs;

  var commentController = TextEditingController().obs;
  var listComment = [].obs;

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

  void changeDataCommunity(Map data) async {
    dataCommunity.value = data;
    var response = await UserService().getUserData();
    if (response['status']) {
      final data = response['data'];
      dataCommunity['user'] = data;
    }
    getComment();
  }

  void sendComment(String content) async {
    Get.snackbar(
      'Loading',
      'Tunggu sebentar!',
      showProgressIndicator: true,
    );
    if (content.isEmpty) {
      Get.snackbar(
        'Error',
        'Komentar Tidak Boleh Kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    final response = await CommunityService().sendComment(
      dataCommunity['id'],
      content,
    );
    if (response['status']) {
      Get.back();
      Get.snackbar(
        'Success',
        'Komentar Berhasil Dikirim',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar('Error', response['message']);
    }
    commentController.value.clear();
  }

  void getComment() async {
    listComment.clear();
    final dbStream =
        _database.child('commentCommunity').child(dataCommunity['id']).onValue;
    dbStream.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        listComment.value = data.entries.map((e) => e.value).toList();
      }
    });
  }
}
