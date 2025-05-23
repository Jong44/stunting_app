import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeCardArtikel extends StatelessWidget {
  final String image;
  final String title;
  final String id;
  final VoidCallback updateVoidCallback;
  const HomeCardArtikel(
      {super.key,
      required this.image,
      required this.title,
      required this.id,
      required this.updateVoidCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        updateVoidCallback();
        Get.toNamed('/artikel/${id}');
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          width: 260,
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    color: Colors.grey.shade300),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          )),
    );
  }
}
