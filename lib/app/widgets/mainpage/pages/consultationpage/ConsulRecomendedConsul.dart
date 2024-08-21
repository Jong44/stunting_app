import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/card/CardRecomendedConsul.dart';

class ConsulRecomendedConsul extends StatelessWidget {
  const ConsulRecomendedConsul({super.key});

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
        Container(
          height: 265,
          child: ListView.builder(
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CardRecomendedConsul(
                    name: "Dr. John Doe",
                    image:
                        "https://images.unsplash.com/photo-1601933340161-4b3b1f1f3b3b",
                    experience: "5 Tahun",
                    price: 50000,
                    category: ["Kesehatan", "Anak"],
                    spesialis: "Dokter Anak",
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
