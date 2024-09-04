import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/artikel/ArtikelController.dart';
import 'package:stunting_app/app/widgets/SearchInput.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardArtikel.dart';
import 'package:stunting_app/app/widgets/menu/artikel/CardBlogLarge.dart';

class ArtikelMainPage extends StatelessWidget {
  const ArtikelMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ArtikelController artikelController = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Artikel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SearchInput(
                    onChanged: (value) {
                      artikelController.setSearch(value);
                    },
                    placeholder: "Cari Artikel",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (artikelController.search.value != "") {
                    if (artikelController.listArtikelBySearch.isNotEmpty) {
                      return Column(
                        children: List.generate(
                          artikelController.listArtikelBySearch.length,
                          (index) => InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                artikelController.idArtikel.value =
                                    artikelController.listArtikelBySearch[index]
                                        ['id'];
                                artikelController.getArtikelById();
                                artikelController.updateJumlahPenonton(
                                    artikelController.listArtikelBySearch[index]
                                        ['id']);
                                Get.toNamed(
                                    '/artikel/${artikelController.listArtikelBySearch[index]['id']}');
                              },
                              child: CardBlogLarge(
                                  title: artikelController
                                          .listArtikelBySearch[index]['data']
                                      ['title'],
                                  image: artikelController
                                          .listArtikelBySearch[index]['data']
                                      ['image'],
                                  isi: artikelController
                                          .listArtikelBySearch[index]['data']
                                      ['content'],
                                  date: Timestamp.fromDate(DateTime.now()))),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                        child: const Center(
                          child: Text("Artikel tidak ditemukan"),
                        ),
                      );
                    }
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: artikelController.listCategory.length,
                          itemBuilder: (context, index) {
                            return Obx(() {
                              return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      artikelController.setIndexCategory(index);
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: artikelController
                                                    .indexCategory.value ==
                                                index
                                            ? ColorConfig.primaryColor
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          artikelController.listCategory[index]
                                              ['data']['category'],
                                          style: TextStyle(
                                            color: artikelController
                                                        .indexCategory.value ==
                                                    index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        if (artikelController
                            .listArtikelByCategory.isNotEmpty) {
                          return Column(
                            children: List.generate(
                              artikelController.listArtikelByCategory.length,
                              (index) => InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    artikelController.idArtikel.value =
                                        artikelController
                                            .listArtikelByCategory[index]['id'];
                                    artikelController.getArtikelById();
                                    artikelController.updateJumlahPenonton(
                                        artikelController
                                                .listArtikelByCategory[index]
                                            ['id']);
                                    Get.toNamed(
                                        '/artikel/${artikelController.listArtikelByCategory[index]['id']}');
                                  },
                                  child: CardBlogLarge(
                                      title: artikelController
                                              .listArtikelByCategory[index]
                                          ['data']['title'],
                                      image: artikelController
                                              .listArtikelByCategory[index]
                                          ['data']['image'],
                                      isi: artikelController
                                              .listArtikelByCategory[index]
                                          ['data']['content'],
                                      date:
                                          Timestamp.fromDate(DateTime.now()))),
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Trending",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return Container(
                                height: 175,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: artikelController
                                        .listArtikelPopuler.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {},
                                            child: HomeCardArtikel(
                                              image: artikelController
                                                      .listArtikelPopuler[index]
                                                  ['data']['image'],
                                              title: artikelController
                                                      .listArtikelPopuler[index]
                                                  ['data']['title'],
                                              id: artikelController
                                                      .listArtikelPopuler[index]
                                                  ['id'],
                                              updateVoidCallback: () {
                                                artikelController.idArtikel
                                                    .value = artikelController
                                                        .listArtikelPopuler[
                                                    index]['id'];
                                                artikelController
                                                    .getArtikelById();
                                                artikelController
                                                    .updateJumlahPenonton(
                                                        artikelController
                                                                .listArtikelPopuler[
                                                            index]['id']);
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      );
                                    }),
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Cocok Untuk Kamu Baca",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: List.generate(
                                artikelController.listArtikel.length,
                                (index) => InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      artikelController.idArtikel.value =
                                          artikelController.listArtikel[index]
                                              ['id'];
                                      artikelController.getArtikelById();
                                      artikelController.updateJumlahPenonton(
                                          artikelController.listArtikel[index]
                                              ['id']);
                                      Get.toNamed(
                                          '/artikel/${artikelController.listArtikel[index]['id']}');
                                    },
                                    child: CardBlogLarge(
                                        title:
                                            artikelController.listArtikel[index]
                                                ['data']['title'],
                                        image:
                                            artikelController.listArtikel[index]
                                                ['data']['image'],
                                        isi:
                                            artikelController.listArtikel[index]
                                                ['data']['content'],
                                        date: Timestamp.fromDate(
                                            DateTime.now()))),
                              ),
                            )
                          ],
                        );
                      })
                    ],
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
