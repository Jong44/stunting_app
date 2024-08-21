import 'package:flutter/material.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/card/CardAllConsul.dart';

class ConsulAllConsul extends StatelessWidget {
  const ConsulAllConsul({super.key});

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
            5,
            (index) => CardAllConsul(
              name: "Dr. John Doe",
              image:
                  "https://images.unsplash.com/photo-1601933340161-4b3b1f1f3b3b",
              experience: "5 Tahun",
              price: 50000,
              category: ["Kesehatan", "Anak"],
            ),
          ),
        )
      ],
    );
  }
}
