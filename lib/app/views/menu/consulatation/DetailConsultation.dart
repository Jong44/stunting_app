import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ConsultationController.dart';
import 'package:stunting_app/app/utils/formatRupiah.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class DetailConsultation extends StatelessWidget {
  const DetailConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    final ConsultationController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            controller.dataDokterById.value['name'] ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(child: Obx(() {
                if (controller.isLoadingDetail.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 200,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(controller
                                        .dataDokterById.value['imageUrl'] ??
                                    ''),
                                fit: BoxFit.cover),
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                controller.dataDokterById.value['name'] ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.dataDokterById.value['ratings']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${controller.dataDokterById['specialization']} | ${controller.dataDokterById['hospital']}",
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Divider(
                            color: Colors.grey.shade200,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "${controller.dataDokterById['experience'] ?? ''} Tahun",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Pengalaman",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "${controller.dataDokterById['experience']}+",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Konsultasi",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      formatRupiah(
                                          controller.dataDokterById['price'] ??
                                              ''),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Per Konsultasi",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: Colors.grey.shade200,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Pilih Tanggal Konsultasi",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.pickDate(context);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3 -
                                          20,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Obx(
                                    () => Text(
                                      controller.tanggal.value,
                                      style: const TextStyle(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.3 -
                                          20,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Obx(
                                    () => Text(
                                      controller.bulan.value,
                                      style: const TextStyle(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.3 -
                                          20,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Obx(
                                    () => Text(
                                      controller.tahun.value,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Pilih Waktu Konsultasi",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Wrap(
                            spacing: 15,
                            runSpacing: 10,
                            children: List.generate(
                              controller
                                  .dataDokterById['available_times'].length,
                              (index) => Obx(() {
                                return InkWell(
                                  onTap: () {
                                    controller.indexWaktu.value = index;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            controller.indexWaktu.value == index
                                                ? ColorConfig.primaryColor
                                                : Colors.grey.shade200,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      controller
                                              .dataDokterById['available_times']
                                          [index],
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    )
                  ],
                );
              })),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  text: "Konseling Sekarang",
                  onPressed: () {
                    if (controller.tanggal.value == 'Tanggal' ||
                        controller.bulan.value == 'Bulan' ||
                        controller.tahun.value == 'Tahun') {
                      Get.snackbar('Peringatan',
                          'Silahkan pilih tanggal konsultasi terlebih dahulu',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                      return;
                    } else {
                      Get.toNamed('/consultation/review', arguments: {
                        'idDoctor': controller.dataDokterById.value['id'],
                        'idUser': controller.dataUser.value['uid'],
                        'totalPrice': controller.dataDokterById.value['price'],
                      });
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
