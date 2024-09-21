import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/services/ConsultationService.dart';
import 'package:stunting_app/app/services/TransaksiService.dart';
import 'package:stunting_app/app/services/UserService.dart';

class ConsultationController extends GetxController {
  List waktu = [
    "08:00 AM - 09:00 AM",
    "09:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "01:00 PM - 02:00 PM",
    "02:00 PM - 03:00 PM",
    "03:00 PM - 04:00 PM",
    "04:00 PM - 05:00 PM",
  ];

  List media = [
    {
      'icon': 'assets/images/google-meet.png',
      'title': 'Google Meet',
      'isReady': true,
    },
    {
      'icon': 'assets/images/video-call.jpg',
      'title': 'Telepon',
      'isReady': false,
    },
    {
      'icon': 'assets/images/tatap-muka.jpg',
      'title': 'Tatap Muka',
      'isReady': false,
    },
  ];

  var isLoading = false.obs;
  var isLoadingDetail = false.obs;
  var isLoadingPay = false.obs;

  var listDokter = [].obs;
  var dataDokterById = {}.obs;
  var isOpen = false.obs;
  var indexMedia = 0.obs;

  var dataUser = {}.obs;

  var selectedDate = DateTime.now().obs;
  var tanggal = 'Tanggal'.obs;
  var bulan = 'Bulan'.obs;
  var tahun = 'Tahun'.obs;
  var indexWaktu = 0.obs;

  @override
  void onInit() {
    getDokterAll();
    getUserData();
    super.onInit();
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    var date = [];
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate.toLocal();
      date = pickedDate.toLocal().toString().split(' ')[0].split("-");
      tahun.value = date[0];
      bulan.value = date[1];
      tanggal.value = date[2];
    }
    // jika memilih tanggal sebelum hari ini maka akan muncul alert
    if (pickedDate != null && pickedDate.isBefore(DateTime.now())) {
      Get.snackbar(
        'Peringatan',
        'Tanggal yang dipilih tidak valid',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      tanggal.value = 'Tanggal';
      bulan.value = 'Bulan';
      tahun.value = 'Tahun';
    }

    // jika memilih tanggal setelah 3 hari dari hari ini maka akan muncul alert
    if (pickedDate != null &&
        pickedDate.isAfter(DateTime.now().add(const Duration(days: 3)))) {
      Get.snackbar(
        'Peringatan',
        'Hanya bisa membuat janji konsultasi maksimal 3 hari dari hari ini',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      tanggal.value = 'Tanggal';
      bulan.value = 'Bulan';
      tahun.value = 'Tahun';
    }
  }

  void setIndexWaktu(int index) {
    indexWaktu.value = index;
  }

  void getDokterAll() async {
    isLoading.value = true;
    final response = await ConsultationService().getDokters();
    if (response['status']) {
      listDokter.value = response['data'];
    } else {
      Get.snackbar(
        'Error',
        response['message'],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }

  void getDokterById(String id) async {
    isLoadingDetail.value = true;
    final response = await ConsultationService().getDokterById(id);
    if (response['status']) {
      var data = response['data'];
      data['id'] = id;
      dataDokterById.value = data;
    } else {
      Get.snackbar(
        'Error',
        response['message'],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoadingDetail.value = false;
  }

  void getUserData() async {
    final response = await UserService().getUserData();
    if (response['status']) {
      dataUser.value = response['data'];
    } else {
      Get.snackbar(
        'Error',
        response['message'],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
