import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/communitypage/card/CardCommunityGrid.dart';

class CommunityGrid extends StatelessWidget {
  const CommunityGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return CardCommunityGrid(
          title: 'Title',
          description: 'Description',
          category: 'Category',
          image: 'https://picsum.photos/200/300',
        );
      },
    );
  }
}
