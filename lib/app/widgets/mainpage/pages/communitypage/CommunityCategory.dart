import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommunityCategory extends StatelessWidget {
  const CommunityCategory({super.key});

  @override
  Widget build(BuildContext context) {
    List categories = [
      {
        "name": "Kembang",
        "icon": Icons.child_care,
      },
      {
        "name": "Si Kecil",
        "icon": Icons.child_friendly,
      },
      {
        "name": "Asupan",
        "icon": Icons.fastfood,
      },
      {
        "name": "Protein",
        "icon": Icons.food_bank,
      },
      {
        "name": "Makanan",
        "icon": Icons.food_bank,
      },
    ];
    return Row(
      children: List.generate(categories.length, (index) {
        return Expanded(
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Icon(categories[index]['icon']),
              ),
              const SizedBox(height: 10),
              Text(
                categories[index]['name'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
