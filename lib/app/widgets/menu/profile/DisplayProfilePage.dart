import 'package:flutter/material.dart';

class DisplayProfilePage extends StatelessWidget {
  final String nama;
  final String username;
  final String jenisKelamin;
  final String alamat;
  final String alamatEmail;
  const DisplayProfilePage(
      {super.key,
      required this.nama,
      required this.username,
      required this.jenisKelamin,
      required this.alamat,
      required this.alamatEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Username",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(username, style: const TextStyle(fontSize: 13)),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Nama Lengkap",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(nama, style: const TextStyle(fontSize: 13)),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Jenis Kelamin",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(jenisKelamin, style: const TextStyle(fontSize: 13)),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(alamatEmail, style: const TextStyle(fontSize: 13)),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Alamat",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(alamat, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
