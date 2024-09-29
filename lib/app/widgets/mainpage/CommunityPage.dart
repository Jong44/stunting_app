import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/CommunityController.dart';
import 'package:stunting_app/app/widgets/SearchInput.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/CommunityCarousel.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/CommunityCategory.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/CommunityGrid.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    CommunityController controller = Get.put(CommunityController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchInput(
                  placeholder: "What do you learn today?",
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 20),
                CommunityCarousel(),
                const SizedBox(height: 20),
                const CommunityCategory(),
                const SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CommunityGrid(
                      dataCommunity: controller.listCommunity,
                      controller: controller);
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConfig.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          controller.clearForm();
          Get.toNamed('/create-thread');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
