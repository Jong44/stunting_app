import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProfile extends StatelessWidget {
  final profile;
  const CardProfile({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Get.toNamed('/profile');
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Obx(() {
            return Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 30,
                  backgroundImage: NetworkImage(profile['photoURL'] ?? ''),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    profile['username'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    profile['email'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ])
              ],
            );
          })),
    );
  }
}
