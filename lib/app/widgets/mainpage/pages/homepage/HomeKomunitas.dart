import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/HomeController.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/card/CardCommunityGrid.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardKomunitas.dart';

class HomeKomunitas extends StatelessWidget {
  final HomeController controller;
  const HomeKomunitas({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Komunitas Populer",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Lihat Semua",
                style: TextStyle(
                  fontSize: 12,
                  color: ColorConfig.primaryColor,
                ),
              ),
            ),
          ],
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.dataCommunity.isEmpty) {
            return const Center(
              child: Text("Data Kosong"),
            );
          }
          return SizedBox(
            height: 250,
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemCount: controller.dataCommunity.length,
              itemExtent: 200,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 190,
                      child: CardCommunityGrid(
                        title: controller.dataCommunity[index]['data']
                                ['title'] ??
                            "",
                        description: controller.dataCommunity[index]['data']
                                ['content'] ??
                            "",
                        category: controller.dataCommunity[index]['data']
                                ['category'] ??
                            "",
                        image: controller.dataCommunity[index]['data']
                                ['image'] ??
                            "",
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                );
              },
            ),
          );
        })
      ],
    );
  }
}
