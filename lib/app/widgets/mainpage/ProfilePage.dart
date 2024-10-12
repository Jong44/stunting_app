import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ProfileController.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/profilepage/CardMenu.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/profilepage/CardProfile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List menuProfile = [
      {
        "listMenu": [
          {
            "nama": "Jurnal",
          },
        ],
      },
      {
        "listMenu": [
          {
            "nama": "Pusat Bantuan",
            "path": "pusat-bantuan",
          },
          {
            "nama": "Tentang",
          }
        ]
      },
      {
        "listMenu": [
          {
            "nama": "Notifikasi",
          },
          {
            "nama": "Bahasa",
          },
          {
            "nama": "Keamanan Akun",
          },
          {
            "nama": "Keluar",
            "path": "Keluar",
          }
        ]
      }
    ];
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Obx(() {
          if (profileController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CardProfile(profile: profileController.dataProfile),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: List.generate(
                      menuProfile.length,
                      (indexMenu) => CardMenu(
                          controller: profileController,
                          menuProfile: menuProfile,
                          indexMenu: indexMenu)),
                ),
              ],
            ),
          );
        })),
      ),
    );
  }
}
