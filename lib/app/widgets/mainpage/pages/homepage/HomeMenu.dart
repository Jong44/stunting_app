import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List menu = [
      {
        "icon": GameIcons.love_injection,
        "title": "Booking Vaksin",
        "route": "/booking-vaksin",
      },
      {
        "icon": Ph.chart_line,
        "title": "Grafik Tumbuh",
        "route": "/grafik-tumbuh",
      },
      {
        "icon": Mdi.food_outline,
        "title": "Makanan Sehat",
        "route": "/makanan-sehat",
      },
      {
        "icon": Carbon.development,
        "title": "Tahap Kembang",
        "route": "/tahap-kembang",
      },
      {
        "icon": Carbon.game_console,
        "title": "Game Anak",
        "route": "/game-anak",
      },
      {
        "icon": Healthicons.doctor_male_outline,
        "title": "Tanya Dokter",
        "route": "/tanya-dokter",
      },
      {
        "icon": Healthicons.hospital_outline,
        "title": "Klinik Terdekat",
        "route": "/klinik-terdekat",
      },
      {
        "icon": MaterialSymbols.article_outline,
        "title": "Artikel & Tips",
        "route": "/artikel",
      },
    ];
    return Container(
        height: 220,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 100,
          ),
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, menu[index]["route"]);
              },
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Iconify(
                        menu[index]["icon"],
                        size: 30,
                        color: ColorConfig.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu[index]["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}