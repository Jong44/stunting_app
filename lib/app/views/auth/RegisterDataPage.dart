import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/auth/RegisterController.dart';
import 'package:stunting_app/app/controllers/auth/RegisterDataController.dart';
import 'package:stunting_app/app/widgets/DropdownInput.dart';
import 'package:stunting_app/app/widgets/InputText.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class RegisterDataPage extends StatelessWidget {
  const RegisterDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    List gender = ['Laki-laki', 'Perempuan'];
    final RegisterDataController registerController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "Lengkapi Data",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorConfig.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Lengkapi profile momdad agar Anda dapat menjelajahi semua informasi yang ada",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InputText(
                  hintText: "Nama Lengkap",
                  onChange: registerController.setName,
                ),
                const SizedBox(
                  height: 24,
                ),
                InputText(
                  hintText: "Email",
                  onChange: registerController.setEmail,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(gender.length, (index) {
                    return InkWell(onTap: () {
                      registerController.setGender(gender[index]);
                    }, child: Obx(() {
                      return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: registerController.gender.value ==
                                          gender[index]
                                      ? ColorConfig.primaryColor
                                      : Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Iconify(
                                  gender[index] == "Perempuan"
                                      ? La.female
                                      : La.male,
                                  color: registerController.gender.value ==
                                          gender[index]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                gender[index],
                              ),
                            ],
                          ));
                    }));
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                DropdownInput(
                  hintText: "Provinsi",
                  items: [],
                  onChange: () {
                    registerController.setProvince("Provinsi");
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                DropdownInput(
                  hintText: "Kabupaten/Kota",
                  items: [],
                  onChange: () {
                    registerController.setKabupaten("Kabupaten/Kota");
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                DropdownInput(
                  hintText: "Kecamatan",
                  items: [],
                  onChange: () {
                    registerController.setKecamatan("Kecamatan");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: PrimaryButton(
          text: "Lanjutkan",
          onPressed: () {
            registerController.register();
          },
        ),
      ),
    );
  }
}
