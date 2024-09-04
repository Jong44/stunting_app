import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/artikel/ArtikelController.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardArtikel.dart';

class HomeArtikel extends StatelessWidget {
  final List artikel;
  const HomeArtikel({super.key, required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Artikel Populer",
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
        Container(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artikel.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  HomeCardArtikel(
                    image: artikel[index]['data']['image'],
                    title: artikel[index]['data']['title'],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
