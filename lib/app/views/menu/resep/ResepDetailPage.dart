import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/resep/ResepController.dart';

class ResepDetailPage extends StatelessWidget {
  const ResepDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ResepController controller = Get.find();
    List tabList = ['Bahan - bahan', 'Resep'];
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            controller.resepById['data'] == null
                ? 'Detail Resep'
                : controller.resepById['data']['title'] ?? 'Detail Resep',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          );
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: Obx(
          () {
            if (controller.isLoadingDetail.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.resepById['data'] == null) {
              return const Center(
                child: Text('Data tidak ditemukan'),
              );
            }
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(controller.resepById['data']
                              ['image'] ??
                          'https://via.placeholder.com/150'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.resepById['data']['title'] ?? 'Judul Resep',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.resepById['data']['description'] ??
                            'Deskripsi Resep',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(tabList.length, (index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                controller.updateIndexTab(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: controller.indexTab.value == index
                                          ? ColorConfig.primaryColor
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  tabList[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: controller.indexTab.value == index
                                        ? ColorConfig.primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        if (controller.indexTab.value == 0) {
                          return Column(
                              children: List.generate(
                                  controller.resepById['data']['bahan'].length,
                                  (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    controller.resepById['data']['bahan']
                                        [index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }));
                        } else {
                          return Column(
                              children: List.generate(
                                  controller.resepById['data']['cara_membuat']
                                      .length, (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    controller.resepById['data']['cara_membuat']
                                        [index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }));
                        }
                      })
                    ],
                  ),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
