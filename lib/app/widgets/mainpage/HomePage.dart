import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:stunting_app/app/controllers/mainpage/MainController.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/HomeController.dart';
import 'package:stunting_app/app/controllers/menu/artikel/ArtikelController.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeArtikel.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeEvent.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeKomunitas.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeMenu.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeProfileAnak.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controllerHome = Get.put(HomeController());
    final ArtikelController controllerArtikel = Get.put(ArtikelController());
    final MainController controller = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Iconify(Ph.map_pin_light),
              const SizedBox(width: 10),
              Obx(
                () => Text(
                  controllerHome.kecamatan.value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Iconify(
              Ph.bell_light,
              size: 28,
            ),
          ),
          const SizedBox(width: 5),
        ],
        leadingWidth: 300,
      ),
      // Ketika Loading menampilkan dialog loading
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                HomeProfileAnak(
                  controller: controllerHome,
                ),
                const SizedBox(height: 25),
                HomeMenu(
                  controllerHome: controller,
                ),
                const SizedBox(height: 15),
                HomeEvent(),
                const SizedBox(height: 15),
                HomeKomunitas(),
                const SizedBox(height: 15),
                Obx(() {
                  return HomeArtikel(
                    controller: controllerArtikel,
                    artikel: controllerHome.dataArtikel.value,
                  );
                }),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
