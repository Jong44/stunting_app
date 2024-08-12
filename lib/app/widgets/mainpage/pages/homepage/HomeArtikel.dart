import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardArtikel.dart';

class HomeArtikel extends StatelessWidget {
  const HomeArtikel({super.key});

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
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  HomeCardArtikel(
                    image: "",
                    title: "STTWTWT",
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
