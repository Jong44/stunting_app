import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class CardJawabanSoal extends StatelessWidget {
  final String image;
  final String textJawaban;
  final String jawaban_benar;
  final bool isChoosen;
  final String pilihan;
  const CardJawabanSoal({
    super.key,
    this.image = "",
    this.textJawaban = "",
    required this.jawaban_benar,
    required this.pilihan,
    this.isChoosen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: isChoosen
            ? pilihan == jawaban_benar
                ? Colors.green
                : Colors.red
            : ColorConfig.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: image != ""
          ? Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          : Text(textJawaban, style: const TextStyle(color: Colors.white)),
    );
  }
}
