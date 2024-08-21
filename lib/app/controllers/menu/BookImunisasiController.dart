import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookImunisasiController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var tanggalValue = "Tanggal".obs;
  var bulanValue = "Bulan".obs;
  var tahunValue = "Tahun".obs;
  var namaBayi = "".obs;
  var namaIbu = "".obs;
  var indexGender = 0.obs;
  var nomorTelepon = "".obs;

  List gender = ['Laki-laki', 'Perempuan'];

  void setNamaBayi(value) {
    namaBayi.value = value;
  }

  void setNamaIby(value) {
    namaIbu.value = value;
  }

  void setGender(value) {
    indexGender.value = value;
  }

  void setNomorTelepon(value) {
    nomorTelepon.value = value;
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
      tahunValue.value = date[0];
      bulanValue.value = date[1];
      tanggalValue.value = date[2];
    }
  }
}
