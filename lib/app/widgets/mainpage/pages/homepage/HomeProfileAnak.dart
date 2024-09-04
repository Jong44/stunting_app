import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/HomeController.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardChartAnak.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardProfileAnak.dart';

class HomeProfileAnak extends StatelessWidget {
  final HomeController controller;
  const HomeProfileAnak({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.dataAnak.isNotEmpty) {
        return HomeCardChartAnak(
          controller: controller,
          dataAnak: controller.dataAnak[controller.indexAnak.value]['data'],
        );
      } else {
        return HomeCardProfileAnak();
      }
    });
  }
}
