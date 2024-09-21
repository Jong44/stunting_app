import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ConsultationController.dart';
import 'package:stunting_app/app/utils/formatRupiah.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/card/CardAllConsul.dart';

class ConsulAllConsul extends StatelessWidget {
  final List data;
  final ConsultationController controller;
  const ConsulAllConsul(
      {super.key, required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Para Ahli Dengan Jadwal Tercepat",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(
            data.length,
            (index) => InkWell(
              onTap: () {
                controller.getDokterById(data[index]['id']);
                Get.toNamed('/consultation');
              },
              child: CardAllConsul(
                name: data[index]['data']['name'],
                image: data[index]['data']['imageUrl'],
                experience: data[index]['data']['experience'].toString(),
                price: data[index]['data']['price'],
                category: data[index]['data']['categories'],
              ),
            ),
          ),
        )
      ],
    );
  }
}
