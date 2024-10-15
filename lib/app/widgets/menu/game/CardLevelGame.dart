import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class CardLEvelGame extends StatelessWidget {
  final String level;
  const CardLEvelGame({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: ColorConfig.primaryColor.shade200,
          ),
        ),
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: ColorConfig.primaryColor,
          ),
          alignment: Alignment.center,
          child: Text(
            level,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
