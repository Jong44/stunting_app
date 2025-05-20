import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/BookImunisasiController.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/menu/imunisasi/CardBookingImunisasi.dart';

class BookImunisasiPage extends StatelessWidget {
  const BookImunisasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BookImunisasiController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Imunisasi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CardBookingImunisasi(
                  controller: controller,
                ),
                const SizedBox(height: 50),
                PrimaryButton(onPressed: () {}, text: 'Booking'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
