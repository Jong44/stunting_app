import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/artikel/ArtikelController.dart';
import 'package:stunting_app/app/utils/formatTanggal.dart';
import 'package:stunting_app/app/widgets/DashedDivider.dart';

class ArtikelDetailPage extends StatelessWidget {
  const ArtikelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ArtikelController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Artikel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SafeArea(child: SingleChildScrollView(child: Obx(() {
        if (controller.mapArtikel.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                controller.mapArtikel['data']['title'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            controller.mapArtikel['data']['image']),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                formatTanggal(Timestamp.fromDate(DateTime.parse(
                    controller.mapArtikel['data']['createdAt']))),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                controller.mapArtikel['data']['content'],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DashedDivider(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }))),
    );
  }
}
