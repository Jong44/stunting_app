import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/utils/getStatus.dart';

class CardHistoryTahapKembang extends StatelessWidget {
  final String tinggiBadan;
  final String beratBadan;
  final String tanggalCek;
  final String bulanCek;
  final String tahunCek;
  final int indexGender;
  final bool isActive;
  final int zScore;

  const CardHistoryTahapKembang({
    super.key,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.tanggalCek,
    required this.bulanCek,
    required this.tahunCek,
    required this.indexGender,
    required this.isActive,
    required this.zScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isActive ? ColorConfig.primaryColor : Colors.grey,
          width: isActive ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal : $tanggalCek / $bulanCek / $tahunCek',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Berat : ${beratBadan} Kg',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Tinggi : ${tinggiBadan} cm',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Status : ${GetStatus.getStatus(zScore)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
