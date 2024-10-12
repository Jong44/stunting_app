import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ProfileController.dart';

class CardMenu extends StatelessWidget {
  final List menuProfile;
  final int indexMenu;
  final ProfileController controller;
  const CardMenu({
    super.key,
    required this.menuProfile,
    required this.indexMenu,
    required this.controller,
  });

  void showDialogLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Keluar"),
          content: Text("Apakah anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal",
                  style: TextStyle(color: Colors.black.withOpacity(0.5))),
            ),
            TextButton(
              onPressed: () {
                controller.logout();
              },
              child: const Text("Keluar",
                  style: TextStyle(color: ColorConfig.primaryColor)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          menuProfile[indexMenu]['listMenu'].length,
          (indexSubMenu) => Column(
            children: [
              InkWell(
                onTap: () {
                  if (menuProfile[indexMenu]['listMenu'][indexSubMenu]
                          ['path'] !=
                      null) {
                    if (menuProfile[indexMenu]['listMenu'][indexSubMenu]
                            ['path'] ==
                        "Keluar") {
                      print("Keluar");
                      showDialogLogout(context);
                    } else {
                      Get.toNamed(menuProfile[indexMenu]['listMenu']
                          [indexSubMenu]['path']);
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      menuProfile[indexMenu]['listMenu'][indexSubMenu]['nama'],
                      style: TextStyle(
                          fontSize: 13, height: 2, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    )
                  ],
                ),
              ),
              if (indexSubMenu < menuProfile[indexMenu]['listMenu'].length - 1)
                Divider(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
