import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ConsultationController.dart';
import 'package:stunting_app/app/utils/formatRupiah.dart';
import 'package:stunting_app/app/utils/formatTanggal.dart';
import 'package:stunting_app/app/controllers/menu/consultation/TransaksiController.dart';
import 'package:stunting_app/app/widgets/LoadingWidget.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class ReviewConsultation extends StatelessWidget {
  const ReviewConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    final ConsultationController controller = Get.find();
    final TransaksiController transaksiController =
        Get.put(TransaksiController());
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Rangkuman Konsultasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 40),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffdddddd)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Konseling dengan Dokter",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                                .dataDokterById["imageUrl"] ??
                                            ''),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.dataDokterById["name"] ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 185,
                                    child: Wrap(
                                      spacing: 7,
                                      runSpacing: 10,
                                      children: List.generate(
                                        controller.dataDokterById["categories"]
                                            .length,
                                        (index) => Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: ColorConfig.primaryColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  width: 0.8,
                                                  color: ColorConfig
                                                      .primaryColor)),
                                          child: Text(
                                            index < 3
                                                ? controller.dataDokterById[
                                                    "categories"][index]
                                                : "+ ${controller.dataDokterById["categories"].length - 3} Lainnya",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 9),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Detail Konseling",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.calendar,
                                color: ColorConfig.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                formatTanggalHari(
                                  DateTime.parse(
                                      "${controller.tahun.value}-${controller.bulan.value}-${controller.tanggal.value}"),
                                ),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.clock,
                                color: ColorConfig.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                controller.waktu[controller.indexWaktu.value],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Pilih Media Konseling",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                          const SizedBox(
                            height: 10,
                          ),
                          if (controller.isOpen.value)
                            Column(
                              children: List.generate(
                                controller.media.length,
                                (index) => InkWell(
                                    onTap: () {
                                      controller.indexMedia.value = index;
                                      controller.isOpen.value = false;
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: index ==
                                                    controller.media.length - 1
                                                ? null
                                                : const Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xffdddddd))),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                controller.media[index]
                                                        ["icon"] ??
                                                    '',
                                                width: 45,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                controller.media[index]
                                                        ["title"] ??
                                                    '',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    color: ColorConfig
                                                        .primaryColor),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () {
                                controller.isOpen.value = true;
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xffdddddd)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          controller.media[controller
                                                  .indexMedia.value]["icon"] ??
                                              '',
                                          width: 45,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.media[controller
                                                  .indexMedia.value]["title"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color:
                                                      ColorConfig.primaryColor),
                                            ),
                                            Text(
                                              "Via ${controller.media[controller.indexMedia.value]["title"]}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      CupertinoIcons.chevron_down,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Iconify(Tabler.shield_check),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                "Akan kami jamin konselingmu aman, nyaman , dan terjaga privasi kamu",
                                style: TextStyle(fontSize: 12),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                  formatRupiah(
                                      controller.dataDokterById["price"] ?? 0),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: PrimaryButton(
                                    text: "Bayar",
                                    onPressed: () async {
                                      final response =
                                          await transaksiController.payNow(
                                              controller.dataUser["email"],
                                              controller.dataUser["name"],
                                              controller.dataDokterById["id"],
                                              controller.dataDokterById["name"],
                                              controller
                                                  .dataDokterById["price"]);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    })),
              ),
            ),
          ),
        ),
        Obx(() {
          if (controller.isLoadingPay.value) {
            return const LoadingWidget();
          } else {
            return const SizedBox();
          }
        })
      ],
    );
  }
}
