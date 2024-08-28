import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CardProfile(profile: {
                  "fullname": "John Doe",
                  "email": "johndoe@gmail.com",
                  "photo":
                      "https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png"
                }),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: List.generate(
                      menuProfile.length,
                      (indexMenu) => CardMenu(
                          menuProfile: menuProfile, indexMenu: indexMenu)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
