import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/CommunityController.dart';
import 'package:stunting_app/app/utils/formatTanggal.dart';
import 'package:stunting_app/app/widgets/menu/community/CardCommentCommunity.dart';
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
          child: SingleChildScrollView(child: Obx(() {
            if (controller.dataCommunity.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetailCommunity(
                  photoURL: controller.dataCommunity['user']!['photoURL'],
                  category: controller.dataCommunity['category'],
                  name: controller.dataCommunity['user']!['name'],
                  createdAt: controller.dataCommunity['createdAt'].toDate(),
                  title: controller.dataCommunity['title'],
                  content: controller.dataCommunity['content'],
                  isOpenSelengkapnya: controller.isOpenSelengkapnya.value,
                  onTapSelengkapnya: () {
                    controller.isOpenSelengkapnya.value =
                        !controller.isOpenSelengkapnya.value;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  '${controller.listComment.length} Komentar',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children:
                      List.generate(controller.listComment.length, (index) {
                    return CardCommentCommunity(
                      photoURL: controller.listComment[index]['photoURL'],
                      category: "Kategori",
                      name: controller.listComment[index]['name'],
                      createdAt: DateTime.parse(
                          controller.listComment[index]['createdAt']),
                      title: "Judul",
                      content: controller.listComment[index]['comment'],
                    );
                  }),
                )
              ],
            );
          })),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(child: Obx(() {
              return TextField(
                controller: controller.commentController.value,
                style: const TextStyle(
                  fontSize: 13,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Tulis Komentar',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              );
            })),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                controller.sendComment(
                  controller.commentController.value.text,
                );
              },
              icon: const Iconify(
                Bi.send,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
