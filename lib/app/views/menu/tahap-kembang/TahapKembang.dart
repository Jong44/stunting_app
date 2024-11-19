import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/tahap-kembang/TahapKembangController.dart';
import 'package:stunting_app/app/utils/getStatus.dart';
import 'package:stunting_app/app/utils/getUmur.dart';

class TahapKembang extends StatelessWidget {
  const TahapKembang({super.key});

  @override
  Widget build(BuildContext context) {
    final TahapKembangController controllerTahapKembang =
        Get.put(TahapKembangController());

    return Obx(() {
      if (controllerTahapKembang.isLoading.value) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (controllerTahapKembang.listHistoryTahapKembang.isEmpty) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Data Kosong',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tahap Kembang',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => controllerTahapKembang.listHistoryTahapKembang.isEmpty
                        ? const CircularProgressIndicator()
                        : DropdownButton(
                            value: controllerTahapKembang.indexAnak.value,
                            items: List.generate(
                              controllerTahapKembang
                                  .listHistoryTahapKembang.length,
                              (index) {
                                final data = controllerTahapKembang
                                    .listHistoryTahapKembang[index]['data'];
                                return DropdownMenuItem(
                                  value: index,
                                  child: Text(
                                    data['nama_bayi'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                            onChanged: (value) {
                              controllerTahapKembang.indexAnak.value = value!;
                              controllerTahapKembang.getFilterDataAnak();
                            },
                          ),
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () => Text(
                      'Umur : ${getUmur(
                        controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['tanggal_lahir'],
                        controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['bulan_lahir'],
                        controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['tahun_lahir'],
                      )}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/stunting.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Histori Tahap Kembang',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () {
                  if (controllerTahapKembang.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (controllerTahapKembang
                      .filterListHistoryTahapKembang['data']['data_pertumbuhan']
                      .isEmpty) {
                    return const Center(
                      child: Text('Data Kosong'),
                    );
                  }
                  return Column(
                    children: List.generate(
                      controllerTahapKembang
                          .filterListHistoryTahapKembang['data']
                              ['data_pertumbuhan']
                          .length,
                      (index) {
                        final data = controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['data_pertumbuhan'][index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tanggal : ${data['bulan_cek']} / ${data['tahun_cek']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Status : ${controllerTahapKembang.filterListHistoryTahapKembang['indexGender'] == 0 ? GetStatus.getStatusLaki(double.parse(data['tinggi_badan']), double.parse(data['berat_badan'])) : GetStatus.getStatusPerempuan(double.parse(data['tinggi_badan']), double.parse(data['berat_badan']))}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Berat : ${data['berat_badan']} Kg',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Tinggi : ${data['tinggi_badan']} cm',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Keterangan :',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
