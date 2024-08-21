import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/utils/formatRupiah.dart';
import 'package:stunting_app/app/widgets/OnlineStatus.dart';
import 'package:stunting_app/app/widgets/RatingStar.dart';

class CardRecomendedConsul extends StatelessWidget {
  final String name;
  final String image;
  final String experience;
  final int price;
  final List<String> category;
  final String spesialis;
  const CardRecomendedConsul({
    super.key,
    required this.name,
    required this.image,
    required this.experience,
    required this.price,
    required this.category,
    required this.spesialis,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Card Rekomendasi Dokter');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 180,
        height: 265,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            name,
            maxLines: 1,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                fontSize: 11),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            spesialis,
            style: TextStyle(fontSize: 9),
          ),
          SizedBox(
            height: 3,
          ),
          RatingStar(),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate(
                category.length,
                (index) {
                  final text = category[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 1, color: ColorConfig.primaryColor),
                      color: ColorConfig.primaryColor.withOpacity(0.1),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 55,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: ColorConfig.primaryColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
