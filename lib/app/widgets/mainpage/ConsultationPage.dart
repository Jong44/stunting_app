import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ConsultationController.dart';
import 'package:stunting_app/app/widgets/SearchInput.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/ConsulAllConsul.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/ConsulRecomendedConsul.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultationController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SearchInput(
                onChanged: (value) {
                  print(value);
                },
              ),
              const SizedBox(height: 20),
              Obx(() {
                return ConsulRecomendedConsul(
                  controller: controller,
                  data: controller.listDokter.value,
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return ConsulAllConsul(
                  controller: controller,
                  data: controller.listDokter.value,
                );
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
