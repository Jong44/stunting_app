import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/maki.dart';
import 'package:iconify_flutter/icons/pepicons.dart';
import 'package:stunting_app/app/controllers/mainpage/MainController.dart';
import 'package:stunting_app/app/widgets/mainpage/CommunityPage.dart';
import 'package:stunting_app/app/widgets/mainpage/ConsultationPage.dart';
import 'package:stunting_app/app/widgets/mainpage/HomePage.dart';
import 'package:stunting_app/app/widgets/mainpage/ProfilePage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    List pages = [
      const HomePage(),
      const ConsultationPage(),
      const CommunityPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: Obx(() => pages[mainController.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: mainController.tabIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            mainController.changeTabIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Iconify(Maki.doctor),
              label: 'Consultation',
            ),
            BottomNavigationBarItem(
              icon: Iconify(Bi.people),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Iconify(Gg.profile),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
