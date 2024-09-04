import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/services/GrafikAnakService.dart';
import 'package:stunting_app/app/services/UserService.dart';

class HomeController extends GetxController {
  var dataBeratBadanPerBulan = [].obs;
  var dataTinggiBadanPerBulan = [].obs;
  var dataLingkarKepalaPerBulan = [].obs;
  var dataDisplay = [].obs;

  var isLoading = true.obs;
  var dataAnak = [].obs;

  var kabupaten = "".obs;
  var kecamatan = "".obs;
  var indexAnak = 0.obs;
  var indexGrafik = 0.obs;

  List jeniiGrafik = [
    'Grafik Berat Badan',
    'Grafik Tinggi Badan',
    'Grafik Lingkar Kepala',
  ];

  @override
  void onInit() {
    super.onInit();
    getLokasi();
    getDataAnak();
  }

  void getLokasi() async {
    isLoading.value = true;
    final response = await UserService().getUserData();
    if (response['status']) {
      kabupaten.value = response['data']['kabupaten'];
      kecamatan.value = response['data']['kecamatan'];
    }
    isLoading.value = false;
  }

  void getDataAnak() async {
    isLoading.value = true;
    final response = await GrafikAnakService().getAnakList();
    if (response['status']) {
      dataAnak.value = response['data'];
      getDataPertumbuhanAnak();
    }
    isLoading.value = false;
  }

  void getDataPertumbuhanAnak() {
    isLoading.value = true;
    dataBeratBadanPerBulan.clear();
    dataTinggiBadanPerBulan.clear();
    dataLingkarKepalaPerBulan.clear();
    dataAnak[indexAnak.value]['data']['data_pertumbuhan'].forEach((element) {
      dataBeratBadanPerBulan.add({
        'bulan': int.parse(element['bulan_cek']),
        'value': double.parse(element['berat_badan']),
      });
      dataTinggiBadanPerBulan.add({
        'bulan': int.parse(element['bulan_cek']),
        'value': double.parse(element['tinggi_badan']),
      });
      dataLingkarKepalaPerBulan.add({
        'bulan': int.parse(element['bulan_cek']),
        'value': double.parse(element['lingkar_kepala']),
      });
    });
    getDataDisplay();
    isLoading.value = false;
  }

  void getDataDisplay() {
    dataDisplay.clear();
    if (indexGrafik.value == 0) {
      dataDisplay.addAll(dataBeratBadanPerBulan);
    } else if (indexGrafik.value == 1) {
      dataDisplay.addAll(dataTinggiBadanPerBulan);
    } else if (indexGrafik.value == 2) {
      dataDisplay.addAll(dataLingkarKepalaPerBulan);
    }
  }

  void showDialogMenu() {
    Get.defaultDialog(
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      title: 'Menu Grafik',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Anak :"),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    child: DropdownButton(
                      value: indexAnak.value,
                      items: List.generate(dataAnak.length, (index) {
                        return DropdownMenuItem(
                          child: Text(dataAnak[index]['data']['nama_bayi']),
                          value: index,
                        );
                      }),
                      onChanged: (value) {
                        indexAnak.value = value!;
                        getDataPertumbuhanAnak();
                      },
                    ),
                  );
                })
              ],
            ),
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Grafik :"),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    child: DropdownButton(
                      value: indexGrafik.value,
                      items: List.generate(jeniiGrafik.length, (index) {
                        return DropdownMenuItem(
                          child: Text(jeniiGrafik[index]),
                          value: index,
                        );
                      }),
                      onChanged: (value) {
                        indexGrafik.value = value!;
                        getDataDisplay();
                      },
                    ),
                  );
                })
              ],
            ),
          ),
          ListTile(
            title: Text("Tambah Anak"),
            onTap: () {
              Get.back();
              Get.toNamed('/tambah-anak');
            },
          ),
          ListTile(
            title: Text("Update Data Anak"),
            onTap: () {
              Get.back();
              Get.toNamed('/update-anak/${dataAnak[indexAnak.value]['id']}');
            },
          ),
        ],
      ),
    );
  }
}
