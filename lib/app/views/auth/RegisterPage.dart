import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/auth/RegisterController.dart';
import 'package:stunting_app/app/widgets/InputText.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = RegisterController();
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
                    "Buat Akun",
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
                    "Buatlah akun agar Anda dapat menjelajahi semua informasi yang ada",
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
                InputText(
                  hintText: "Password",
                  isPassword: true,
                  onChange: registerController.setPassword,
                ),
                const SizedBox(
                  height: 24,
                ),
                InputText(
                  hintText: "Konfirmasi Password",
                  isPassword: true,
                  onChange: registerController.setConfirmPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  onPressed: () {
                    registerController.register();
                  },
                  text: "Buat Akun",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun?",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed('/login');
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorConfig.linkColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
