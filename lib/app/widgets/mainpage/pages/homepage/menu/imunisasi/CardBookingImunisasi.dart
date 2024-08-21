import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/menu/BookImunisasiController.dart';
import 'package:stunting_app/app/widgets/InputText.dart';

class CardBookingImunisasi extends StatelessWidget {
  final BookImunisasiController controller;
  const CardBookingImunisasi({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List gender = ['Laki-laki', 'Perempuan'];
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Anak',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            InputText(
              hintText: "Nama",
              onChange: null,
              fontSize: 12.0,
            ),
            const SizedBox(height: 15),
            Text(
              'Nama Ibu',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            InputText(
              hintText: "Nama",
              onChange: null,
              fontSize: 12.0,
            ),
            const SizedBox(height: 15),
            Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.pickDate(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3 - 20,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(
                      () => Text(
                        controller.tanggalValue.value,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.pickDate(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3 - 20,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(
                      () => Text(
                        controller.bulanValue.value,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.pickDate(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3 - 20,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(
                      () => Text(
                        controller.tahunValue.value,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(gender.length, (index) {
                  return InkWell(
                    onTap: () {
                      controller.setGender(index);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.42 - 20,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.indexGender.value == index
                              ? ColorConfig.primaryColor
                              : Colors.grey[200]!,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        gender[index],
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Nomor Telepon',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            InputText(
              hintText: "Nomor Telepon",
              onChange: controller.setNomorTelepon,
              fontSize: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
