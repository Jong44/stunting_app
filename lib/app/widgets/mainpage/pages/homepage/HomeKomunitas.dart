import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardKomunitas.dart';

class HomeKomunitas extends StatelessWidget {
  const HomeKomunitas({super.key});

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
        Container(
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Homecardkomunitas();
            },
          ),
        ),
      ],
    );
  }
}
