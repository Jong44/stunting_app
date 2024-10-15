import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:stunting_app/app/controllers/menu/game/GameController.dart';
import 'package:stunting_app/app/widgets/menu/game/CardJawabanSoal.dart';

class GamePlayPage extends StatelessWidget {
  const GamePlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find();
    String checkIsImage(String data) {
      if (data.contains('http://') || data.contains('https://')) {
        return data;
      }
      return '';
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            "Pertanyan ${controller.currentIndex.value + 1}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      checkIsImage(controller.currentSoal['data']['soal']
                                      [controller.currentIndex.value]
                                  ['pertanyaan']) !=
                              ''
                          ? Image.network(
                              controller.currentSoal['data']['soal']
                                  [controller.currentIndex.value]['pertanyaan'],
                              height: 200,
                            )
                          : Text(
                              controller.currentSoal['data']['soal']
                                  [controller.currentIndex.value]['pertanyaan'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 5),
                      const Text("Silahkan pilih jawaban yang benar"),
                      const SizedBox(height: 20),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            if (controller.currentSoal['data']['soal']
                                        [controller.currentIndex.value]
                                    ['jawaban_benar'] ==
                                "a") {
                              controller.jumlahBenar.value++;
                            }
                            controller.nextSoal();
                          },
                          child: CardJawabanSoal(
                            isChoosen: controller.isChoosen.value,
                            pilihan: "a",
                            jawaban_benar: controller.currentSoal['data']
                                    ['soal'][controller.currentIndex.value]
                                ['jawaban_benar'],
                            image: checkIsImage(
                              controller.currentSoal['data']['soal']
                                  [controller.currentIndex.value]['a'],
                            ),
                            textJawaban: controller.currentSoal['data']['soal']
                                [controller.currentIndex.value]['a'],
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            if (controller.currentSoal['data']['soal']
                                        [controller.currentIndex.value]
                                    ['jawaban_benar'] ==
                                "b") {
                              controller.jumlahBenar.value++;
                            }
                            controller.nextSoal();
                          },
                          child: CardJawabanSoal(
                            isChoosen: controller.isChoosen.value,
                            pilihan: "b",
                            jawaban_benar: controller.currentSoal['data']
                                    ['soal'][controller.currentIndex.value]
                                ['jawaban_benar'],
                            image: checkIsImage(
                              controller.currentSoal['data']['soal']
                                  [controller.currentIndex.value]['b'],
                            ),
                            textJawaban: controller.currentSoal['data']['soal']
                                [controller.currentIndex.value]['b'],
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            if (controller.currentSoal['data']['soal']
                                        [controller.currentIndex.value]
                                    ['jawaban_benar'] ==
                                "c") {
                              controller.jumlahBenar.value++;
                            }
                            controller.nextSoal();
                          },
                          child: CardJawabanSoal(
                            isChoosen: controller.isChoosen.value,
                            pilihan: "c",
                            jawaban_benar: controller.currentSoal['data']
                                    ['soal'][controller.currentIndex.value]
                                ['jawaban_benar'],
                            image: checkIsImage(
                              controller.currentSoal['data']['soal']
                                  [controller.currentIndex.value]['c'],
                            ),
                            textJawaban: controller.currentSoal['data']['soal']
                                [controller.currentIndex.value]['c'],
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            if (controller.currentSoal['data']['soal']
                                        [controller.currentIndex.value]
                                    ['jawaban_benar'] ==
                                "d") {
                              controller.jumlahBenar.value++;
                            }
                            controller.nextSoal();
                          },
                          child: CardJawabanSoal(
                            isChoosen: controller.isChoosen.value,
                            pilihan: "d",
                            jawaban_benar: controller.currentSoal['data']
                                    ['soal'][controller.currentIndex.value]
                                ['jawaban_benar'],
                            image: checkIsImage(
                              controller.currentSoal['data']['soal']
                                  [controller.currentIndex.value]['d'],
                            ),
                            textJawaban: controller.currentSoal['data']['soal']
                                [controller.currentIndex.value]['d'],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
