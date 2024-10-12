import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/CommunityController.dart';
import 'package:stunting_app/app/utils/formatTanggal.dart';
import 'package:stunting_app/app/widgets/menu/community/CardDetailCommunity.dart';

class DetailThread extends StatelessWidget {
  const DetailThread({super.key});

  @override
  Widget build(BuildContext context) {
    final CommunityController controller = Get.put(CommunityController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Thread',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetailCommunity(
                  photoURL: controller.dataCommunity['user']!['photoURL'],
                  category: controller.dataCommunity['category'],
                  name: controller.dataCommunity['user']!['name'],
                  createdAt: controller.dataCommunity['createdAt'].toDate(),
                  title: controller.dataCommunity['title'],
                  content: controller.dataCommunity['content'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
