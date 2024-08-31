import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/auth/EmailVerifController.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class EmailVerifPage extends StatelessWidget {
  const EmailVerifPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailVerifController controller = Get.put(EmailVerifController());
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
                    "Verifikasi Email",
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
                    "Kami telah mengirimkan email verifikasi ke alamat email Anda. Silahkan cek email Anda dan klik link verifikasi yang kami kirimkan.",
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
                const Center(
                  child: Iconify(
                    La.envelope_open_text,
                    size: 100,
                    color: ColorConfig.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      () => Text(
                        "${controller.displayCountdown.value}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => PrimaryButton(
                    onPressed: controller.countdown.value == 0
                        ? controller.resendEmail
                        : null,
                    text: "Kirim Ulang Email",
                    textColor: controller.countdown.value == 0
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: controller.countdown.value == 0
                        ? ColorConfig.primaryColor
                        : Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Get.offNamed('/login');
                    },
                    child: const Text("Kembali ke halaman login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
