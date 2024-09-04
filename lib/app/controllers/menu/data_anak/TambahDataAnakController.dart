import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/services/GrafikAnakService.dart';

class TambahDataAnakController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var isLoading = false.obs;
  var isLoadingSave = false.obs;

  var selectedDate = DateTime.now().obs;
  var tanggalLahirValue = "Tanggal".obs;
  var bulanLahirValue = "Bulan".obs;
  var tahunLahirValue = "Tahun".obs;
  var bulanCekValue = "Bulan".obs;
  var tahunCekValue = "Tahun".obs;
  var namaBayi = "".obs;
  var indexGender = 0.obs;
  var tinggiBadan = "".obs;
  var beratBadan = "".obs;
  var lingkarKepala = "".obs;

  List gender = ['Laki-laki', 'Perempuan'];

  void setNamaBayi(value) {
    namaBayi.value = value;
  }

  void setGender(value) {
    indexGender.value = value;
  }

  void setTinggiBadan(value) {
    tinggiBadan.value = value;
  }

  void setBeratBadan(value) {
    beratBadan.value = value;
  }

  void setLingkarKepala(value) {
    lingkarKepala.value = value;
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
      tahunLahirValue.value = date[0];
      bulanLahirValue.value = date[1];
      tanggalLahirValue.value = date[2];
    }
  }

  Future<void> pickBulanCek(BuildContext context) async {
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
      tahunCekValue.value = date[0];
      bulanCekValue.value = date[1];
    }
  }

  void simpanDataAnak() async {
    isLoadingSave.value = true;
    final response = await GrafikAnakService().addDataAnak(
      namaBayi.value,
      indexGender.value,
      tanggalLahirValue.value,
      bulanLahirValue.value,
      tahunLahirValue.value,
      bulanCekValue.value,
      tahunCekValue.value,
      tinggiBadan.value,
      beratBadan.value,
      lingkarKepala.value,
    );
    if (response['status']) {
      Get.snackbar('Berhasil', 'Data anak berhasil disimpan');
      Get.offAllNamed('/mainpage');
    } else {
      Get.snackbar('Gagal', response['message']);
    }
    isLoadingSave.value = false;
  }
}
