import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class HomeEvent extends StatelessWidget {
  const HomeEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Event Menarik",
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
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemExtent: 250,
            itemBuilder: (context, index) {
              return Image.asset(
                "assets/images/event.png",
                fit: BoxFit.cover,
                width: 250,
              );
            },
          ),
        ),
      ],
    );
  }
}
