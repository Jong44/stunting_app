import 'package:flutter/material.dart';
import 'package:stunting_app/app/widgets/SearchInput.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/CommunityCarousel.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/CommunityCategory.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/CommunityGrid.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              CommunityCategory(),
              const SizedBox(height: 20),
              CommunityGrid(),
            ],
          ),
        ),
      ),
    ));
  }
}
