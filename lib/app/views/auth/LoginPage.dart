import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/auth/LoginController.dart';
import 'package:stunting_app/app/widgets/InputText.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = LoginController();
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
                    "Login",
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
                    "Selamat Datang di Aplikasi Stunting",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InputText(
                  hintText: "Email",
                  onChange: loginController.setEmail,
                ),
                const SizedBox(
                  height: 24,
                ),
                InputText(
                  hintText: "Password",
                  isPassword: true,
                  onChange: loginController.setPassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Lupa Password?",
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorConfig.linkColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  onPressed: () {
                    loginController.login();
                  },
                  text: "Login",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun?",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed('/register');
                      },
                      child: const Text(
                        "Daftar",
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
