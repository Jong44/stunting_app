import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ProfileController.dart';
import 'package:stunting_app/app/widgets/DropdownInput.dart';
import 'package:stunting_app/app/widgets/InputText.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileController controller;
  const EditProfilePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List gender = ["Laki - Laki", "Perempuan"];
    return Container(
        margin: const EdgeInsets.only(bottom: 50),
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
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              InputText(
                hintText: "Username",
                textController: controller.controllerUsername.value,
                onChange: null,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Nama Lengkap",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              InputText(
                hintText: "Nama Lengkap",
                textController: controller.controllerNama.value,
                onChange: null,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Jenis Kelamin",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(gender.length, (index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () {
                        controller.setGender(gender[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.36,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: controller.jenisKelamin.value == gender[index]
                              ? Border.all(color: ColorConfig.primaryColor)
                              : null,
                        ),
                        height: 40,
                        child: Text(gender[index],
                            style: const TextStyle(fontSize: 13)),
                      ),
                    );
                  });
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              InputText(
                hintText: "Email",
                textController: controller.controllerEmail.value,
                onChange: null,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Provinsi",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() {
                return DropdownInput(
                  onChange: (value) {
                    controller.setProvince(value);
                  },
                  items: controller.listProvince,
                  hintText: controller.provinsi.value['name'] ?? "Provinsi",
                );
              }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Kabupaten/Kota",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() {
                return DropdownInput(
                  onChange: (value) {
                    controller.setKabupaten(value);
                  },
                  items: controller.listKabupaten,
                  hintText:
                      controller.kabupaten.value['name'] ?? "Kabupaten/Kota",
                );
              }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Kecamatan",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() {
                return DropdownInput(
                  onChange: (value) {
                    controller.setKecamatan(value);
                  },
                  items: controller.listKecamatan,
                  hintText: controller.kecamatan.value['name'] ?? "Kecamatan",
                );
              }),
              const SizedBox(
                height: 25,
              ),
              PrimaryButton(
                onPressed: () {
                  controller.updateProfile();
                },
                text: "Simpan",
              ),
            ],
          );
        }));
  }
}
