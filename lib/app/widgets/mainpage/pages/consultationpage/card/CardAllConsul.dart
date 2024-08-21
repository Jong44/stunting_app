import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/utils/formatRupiah.dart';
import 'package:stunting_app/app/widgets/OnlineStatus.dart';

class CardAllConsul extends StatelessWidget {
  final String name;
  final String image;
  final String experience;
  final int price;
  final List<String> category;
  const CardAllConsul({
    super.key,
    required this.name,
    required this.image,
    required this.experience,
    required this.price,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    String kategori(List<String> kategori) {
      String fullKategori = '';
      for (var i = 0; i < kategori.length; i++) {
        fullKategori += kategori[i];
        if (i != kategori.length - 1) {
          fullKategori += ', ';
        }
      }
      return fullKategori;
    }

    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: 120,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 3,
              ),
              OnlineStatus(),
              SizedBox(
                height: 3,
              ),
              Text(
                kategori(category),
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 103,
                height: 23,
                decoration: BoxDecoration(
                    color: Color(0xffC4C4C4),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Iconify(
                      MaterialSymbols.work_history,
                      size: 13,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${experience} Tahun",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatRupiah(price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: ColorConfig.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Profile",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              )
            ],
          ))
        ]),
      ),
    );
  }
}
