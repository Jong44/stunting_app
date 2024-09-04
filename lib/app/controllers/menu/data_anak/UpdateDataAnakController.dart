import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/services/GrafikAnakService.dart';

class UpdateDataAnakController extends GetxController {
  late final String idAnak;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    idAnak = Get.parameters['id']!;
    getDataAnak();
  }

  var isLoading = false.obs;
  var isLoadingSave = false.obs;
  var isLoadingCek = false.obs;

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

  // Text Controllers
  var namaController = TextEditingController().obs;
  var tinggiBadanController = TextEditingController().obs;
  var beratBadanController = TextEditingController().obs;
  var lingkarKepalaController = TextEditingController().obs;

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
    getDataPertumbuhanByBulan();
  }

  void getDataAnak() async {
    isLoading.value = true;
    final response = await GrafikAnakService().getAnakById(idAnak);
    if (response['status']) {
      namaBayi.value = response['data']['nama_bayi'];
      namaController.value.text = response['data']['nama_bayi'];
      indexGender.value = response['data']['indexGender'];
      tanggalLahirValue.value = response['data']['tanggal_lahir'];
      bulanLahirValue.value = response['data']['bulan_lahir'];
      tahunLahirValue.value = response['data']['tahun_lahir'];
    }
    isLoading.value = false;
  }

  void getDataPertumbuhanByBulan() async {
    isLoadingCek.value = true;
    final response = await GrafikAnakService().getDataPertumbuhanByBulan(
      idAnak,
      bulanCekValue.value,
      tahunCekValue.value,
    );
    if (response['status']) {
      tinggiBadan.value = response['data']['tinggi_badan'];
      beratBadan.value = response['data']['berat_badan'];
      lingkarKepala.value = response['data']['lingkar_kepala'];

      tinggiBadanController.value.text = response['data']['tinggi_badan'];
      beratBadanController.value.text = response['data']['berat_badan'];
      lingkarKepalaController.value.text = response['data']['lingkar_kepala'];
    } else {
      tinggiBadan.value = "";
      beratBadan.value = "";
      lingkarKepala.value = "";

      tinggiBadanController.value.text = "";
      beratBadanController.value.text = "";
      lingkarKepalaController.value.text = "";
    }
    isLoadingCek.value = false;
  }

  void simpanDataAnak() async {
    isLoadingSave.value = true;
    final responseDataAnak = await GrafikAnakService().updateDataAnak(
      idAnak,
      namaBayi.value,
      indexGender.value,
      tanggalLahirValue.value,
      bulanLahirValue.value,
      tahunLahirValue.value,
    );
    final responseDataPertumbuhan =
        await GrafikAnakService().updateDataPertumbuhanByBulan(
      idAnak,
      bulanCekValue.value,
      tahunCekValue.value,
      tinggiBadan.value,
      beratBadan.value,
      lingkarKepala.value,
    );
    if (responseDataAnak['status'] && responseDataPertumbuhan['status']) {
      Get.snackbar(
        'Berhasil',
        'Data anak berhasil diupdate',
      );
      Get.offAllNamed('/mainpage');
    } else {
      Get.snackbar(
        'Gagal',
        'Data anak gagal diupdate',
      );
    }
    isLoadingSave.value = false;
  }
}
