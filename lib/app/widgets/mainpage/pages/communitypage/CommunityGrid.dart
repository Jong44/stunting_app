import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/CommunityController.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/card/CardCommunityGrid.dart';

class CommunityGrid extends StatelessWidget {
  final List dataCommunity;
  final CommunityController controller;
  const CommunityGrid({
    super.key,
    required this.dataCommunity,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
      ),
      itemCount: dataCommunity.length,
      itemBuilder: (context, index) {
        final data = dataCommunity[index]['data'];
        return InkWell(
          onTap: () {
            final data = dataCommunity[index]['data'];
            data['id'] = dataCommunity[index]['id'];
            controller.changeDataCommunity(data);
            Get.toNamed('/detail-thread/${dataCommunity[index]['id']}');
          },
          child: CardCommunityGrid(
            title: data['title'],
            description: data['content'],
            category: data['category'],
            image: data['image'],
          ),
        );
      },
    );
  }
}
