import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/data_anak/TambahDataAnakController.dart';
import 'package:stunting_app/app/widgets/InputText.dart';
import 'package:stunting_app/app/widgets/LoadingWidget.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class FormTambahDataAnak extends StatelessWidget {
  const FormTambahDataAnak({super.key});

  @override
  Widget build(BuildContext context) {
    List gender = ['Laki-laki', 'Perempuan'];
    final TambahDataAnakController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: const Text(
            'Form Data Anak',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Obx(
        () => controller.isLoadingSave.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Obx(() {
                                if (controller.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nama Bayi',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      InputText(
                                        hintText: "Nama Bayi",
                                        onChange: controller.setNamaBayi,
                                        fontSize: 12.0,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'Tanggal Lahir',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.pickDate(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3 -
                                                  20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 25),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .tanggalLahirValue.value,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.pickDate(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3 -
                                                  20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 20),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .bulanLahirValue.value,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.pickDate(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3 -
                                                  20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 20),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .tahunLahirValue.value,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'Jenis Kelamin',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Obx(
                                        () => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(gender.length,
                                              (index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.setGender(index);
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.42 -
                                                    20,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 20),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: controller
                                                                .indexGender
                                                                .value ==
                                                            index
                                                        ? ColorConfig
                                                            .primaryColor
                                                        : Colors.grey[200]!,
                                                  ),
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  gender[index],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              })),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Obx(() {
                                if (controller.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tanggal Cek',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.pickBulanCek(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30 -
                                                  20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 20),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .tanggalCekValue.value,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.pickBulanCek(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30 -
                                                  20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 20),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .bulanCekValue.value,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.pickDate(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30 -
                                                  20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 20),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .tahunCekValue.value,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'Tinggi Badan',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      InputText(
                                        typeInput: TextInputType.number,
                                        hintText: "Tinggi Badan",
                                        onChange: controller.setTinggiBadan,
                                        fontSize: 12.0,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'Berat Badan',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      InputText(
                                        typeInput: TextInputType.number,
                                        hintText: "Berat Badan",
                                        onChange: controller.setBeratBadan,
                                        fontSize: 12.0,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'Lingkar Kepala',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      InputText(
                                        typeInput: TextInputType.number,
                                        hintText: "Lingkar Kepala",
                                        onChange: controller.setLingkarKepala,
                                        fontSize: 12.0,
                                      ),
                                    ],
                                  );
                                }
                              })),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: PrimaryButton(
          onPressed: () {
            controller.simpanDataAnak();
          },
          text: "Simpan",
        ),
      ),
    );
  }
}
