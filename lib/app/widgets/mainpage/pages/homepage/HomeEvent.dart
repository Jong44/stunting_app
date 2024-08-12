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
            Text(
              "Event Menarik",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
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
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
