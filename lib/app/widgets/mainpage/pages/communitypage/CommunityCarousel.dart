import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CommunityCarousel extends StatelessWidget {
  const CommunityCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/community1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
