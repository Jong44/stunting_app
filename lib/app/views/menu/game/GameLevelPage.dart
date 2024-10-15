import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/game/GameController.dart';
import 'package:stunting_app/app/widgets/menu/game/CardLevelGame.dart';

class GameLevelPage extends StatelessWidget {
  const GameLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Game',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "SELECT PAKET",
                    style: TextStyle(
                      color: ColorConfig.primaryColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30,
                    runSpacing: 30,
                    children: List.generate(
                      controller.soal.length,
                      (index) => InkWell(
                        onTap: () {
                          controller.setCurrentSoal(index);
                          Get.toNamed('/game-play');
                        },
                        child: CardLEvelGame(
                          level: (index + 1).toString(),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
