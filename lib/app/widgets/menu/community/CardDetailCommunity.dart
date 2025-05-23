import 'package:flutter/material.dart';
import 'package:stunting_app/app/utils/formatTanggal.dart';

class CardDetailCommunity extends StatelessWidget {
  final String photoURL;
  final String category;
  final String name;
  final DateTime createdAt;
  final String title;
  final String content;
  final bool isOpenSelengkapnya;
  final Function() onTapSelengkapnya;

  const CardDetailCommunity({
    super.key,
    required this.photoURL,
    required this.category,
    required this.name,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.isOpenSelengkapnya,
    required this.onTapSelengkapnya,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      height: null,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(
                  photoURL,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.circle,
                        size: 5,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        formatTanggalHari(DateTime(
                            createdAt.year, createdAt.month, createdAt.day)),
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 5),
          Text(
            content,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            maxLines: isOpenSelengkapnya ? 100 : 3,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              onTapSelengkapnya();
            },
            child: const Text(
              "Selengkapnya",
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}
