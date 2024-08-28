import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/HomeController.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardChartAnak.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/card/HomeCardProfileAnak.dart';

class HomeProfileAnak extends StatelessWidget {
  final controller;
  const HomeProfileAnak({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return HomeCardChartAnak();
  }
}
