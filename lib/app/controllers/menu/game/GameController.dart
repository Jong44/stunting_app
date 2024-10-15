import 'dart:async';

import 'package:get/get.dart';
import 'package:stunting_app/app/services/GameService.dart';

class GameController extends GetxController {
  var isLoading = false.obs;
  var soal = [].obs;
  var currentSoal = {}.obs;
  var currentIndex = 0.obs;
  var isChoosen = false.obs;
  var jumlahBenar = 0.obs;
  var jumlahPts = 0.obs;

  @override
  void onInit() {
    getSoal();
    super.onInit();
  }

  void getSoal() async {
    isLoading.value = true;
    final ress = await GameService().getSoal();
    if (ress['status']) {
      soal.value = ress['data'];
    }
    isLoading.value = false;
  }

  void setCurrentSoal(int index) {
    currentIndex.value = 0;
    jumlahBenar.value = 0;
    jumlahPts.value = 0;
    currentSoal.value = soal[index];
  }

  void nextSoal() {
    isChoosen.value = true;
    Timer(const Duration(seconds: 2), () {
      isChoosen.value = false;
      if (currentIndex.value < currentSoal['data']['soal'].length - 1) {
        currentIndex.value++;
      } else {
        Get.offNamed('/game-result');
        hitungPts();
      }
    });
  }

  void hitungPts() {
    // mendapatkan jumlah pts dari jumlah soal dengan jawaban benar
    jumlahPts.value =
        jumlahBenar.value * (100 / currentSoal['data']['soal'].length).toInt();
  }
}
