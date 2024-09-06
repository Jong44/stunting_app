import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/resep/ResepController.dart';
import 'package:stunting_app/app/widgets/SearchInput.dart';
import 'package:stunting_app/app/widgets/menu/resep/CardPopulerResep.dart';
import 'package:stunting_app/app/widgets/menu/resep/CardRekomendasiResep.dart';

class ResepAllPage extends StatelessWidget {
  const ResepAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ResepController resepController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resep Makanan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(child: Obx(() {
            if (resepController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SearchInput(onChanged: (value) {
                  resepController.setSearch(value);
                }),
                const SizedBox(height: 20),
                Obx(() {
                  if (resepController.search.value != "") {
                    if (resepController.resepBySearch.isEmpty) {
                      return const Center(
                        child: Text('Data tidak ditemukan'),
                      );
                    }
                    return Column(
                      children: List.generate(
                          resepController.resepBySearch.length, (index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            resepController.getResepById(
                                resepController.resepBySearch[index]['id']);
                            Get.toNamed(
                                '/resep/${resepController.resepBySearch[index]['id']}');
                            resepController.updateIndexTab(0);
                            resepController.updateJumlahPengunjung(
                                resepController.resepBySearch[index]['id']);
                          },
                          child: CardRekomendasiResep(
                            name: resepController.resepBySearch[index]['data']
                                ['title'],
                            imageResep: resepController.resepBySearch[index]
                                ['data']['image'],
                            author: resepController.resepBySearch[index]['data']
                                ['creator'],
                          ),
                        );
                      }),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                              itemCount: resepController.kategoriList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      resepController
                                          .updateIndexCategory(index);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: resepController
                                                    .indexCategory.value ==
                                                index
                                            ? ColorConfig.primaryColor
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        resepController.kategoriList[index]
                                            ['category'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: resepController
                                                      .indexCategory.value ==
                                                  index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          if (resepController.indexCategory.value != 0) {
                            if (resepController.resepByCategory.isEmpty) {
                              return const Center(
                                child: Text('Data tidak ditemukan'),
                              );
                            }
                            return Column(
                              children: List.generate(
                                  resepController.resepByCategory.length,
                                  (index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    resepController.getResepById(resepController
                                        .resepByCategory[index]['id']);
                                    Get.toNamed(
                                        '/resep/${resepController.resepByCategory[index]['id']}');
                                    resepController.updateIndexTab(0);
                                    resepController.updateJumlahPengunjung(
                                        resepController.resepByCategory[index]
                                            ['id']);
                                  },
                                  child: CardRekomendasiResep(
                                    name: resepController.resepByCategory[index]
                                        ['data']['title'],
                                    imageResep:
                                        resepController.resepByCategory[index]
                                            ['data']['image'],
                                    author:
                                        resepController.resepByCategory[index]
                                            ['data']['creator'],
                                  ),
                                );
                              }),
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Populer",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Obx(() {
                                return SizedBox(
                                  height: 130,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(1),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        resepController.resepPopulerList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          resepController.getResepById(
                                              resepController
                                                      .resepPopulerList[index]
                                                  ['id']);
                                          Get.toNamed(
                                              '/resep/${resepController.resepPopulerList[index]['id']}');
                                          resepController.updateIndexTab(0);
                                          resepController
                                              .updateJumlahPengunjung(
                                                  resepController
                                                          .resepPopulerList[
                                                      index]['id']);
                                        },
                                        child: CardPopulerResep(
                                          name: resepController
                                                  .resepPopulerList[index]
                                              ['data']['title'],
                                          image: resepController
                                                  .resepPopulerList[index]
                                              ['data']['image'],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                              const SizedBox(height: 20),
                              const Text(
                                "Rekomendasi Lainnya",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: List.generate(
                                    resepController.resepRekomendasiList.length,
                                    (index) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      resepController.getResepById(
                                          resepController
                                                  .resepRekomendasiList[index]
                                              ['id']);
                                      Get.toNamed(
                                          '/resep/${resepController.resepRekomendasiList[index]['id']}');
                                      resepController.updateIndexTab(0);
                                      resepController.updateJumlahPengunjung(
                                          resepController
                                                  .resepRekomendasiList[index]
                                              ['id']);
                                    },
                                    child: CardRekomendasiResep(
                                      name: resepController
                                              .resepRekomendasiList[index]
                                          ['data']['title'],
                                      imageResep: resepController
                                              .resepRekomendasiList[index]
                                          ['data']['image'],
                                      author: resepController
                                              .resepRekomendasiList[index]
                                          ['data']['creator'],
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        })
                      ],
                    );
                  }
                }),
              ],
            );
          })),
        ),
      ),
    );
  }
}
