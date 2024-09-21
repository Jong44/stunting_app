import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ConsultationController.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/card/CardRecomendedConsul.dart';

class ConsulRecomendedConsul extends StatelessWidget {
  final List data;
  final ConsultationController controller;
  const ConsulRecomendedConsul(
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
        SizedBox(
          height: 265,
          child: ListView.builder(
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.getDokterById(data[index]['id']);
                      Get.toNamed('/consultation');
                    },
                    child: CardRecomendedConsul(
                      name: data[index]['data']['name'],
                      image: data[index]['data']['imageUrl'],
                      experience: "${data[index]['data']['experience']} Tahun",
                      price: data[index]['data']['price'],
                      category: data[index]['data']['categories'],
                      spesialis: data[index]['data']['specialization'],
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
