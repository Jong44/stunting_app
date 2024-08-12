import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class HomeProfileAnak extends StatelessWidget {
  const HomeProfileAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 195,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/child.png",
          ),
          const SizedBox(height: 10),
          const Text(
            "Saat ini Anda belum memiliki profil anak",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 180,
            height: 46,
            child: PrimaryButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Tambah",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
