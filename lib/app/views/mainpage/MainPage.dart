import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/MainController.dart';
import 'package:stunting_app/app/widgets/mainpage/CommunityPage.dart';
import 'package:stunting_app/app/widgets/mainpage/ConsultationPage.dart';
import 'package:stunting_app/app/widgets/mainpage/HomePage.dart';
import 'package:stunting_app/app/widgets/mainpage/ProfilePage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = MainController();
    List pages = [
      HomePage(),
      ConsultationPage(),
      CommunityPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: Obx(() => pages[mainController.tabIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: mainController.tabIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              mainController.changeTabIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Consultation',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )),
    );
  }
}
