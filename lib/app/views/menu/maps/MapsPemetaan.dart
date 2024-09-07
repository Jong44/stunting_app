import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stunting_app/app/controllers/menu/maps/MapsPemetaanController.dart';
import 'package:stunting_app/app/widgets/menu/maps/CardPlaceMaps.dart';

class MapsPemetaan extends StatelessWidget {
  const MapsPemetaan({super.key});

  @override
  Widget build(BuildContext context) {
    final MapsPemetaanController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rumah Sakit & Puskesmas Terdekat',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: controller.initialPosition.value, zoom: 15),
              onMapCreated: controller.onMapCreated,
              markers: controller.markers.toSet(),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 280,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (controller.klinikPuskesmas.isEmpty) {
                    return const Center(
                      child: Text('Data tidak ditemukan'),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.klinikPuskesmas.length,
                      itemBuilder: (context, index) {
                        final data = controller.klinikPuskesmas[index];
                        return CardPlaceMaps(
                          name: data['name'],
                          vicinity: data['vicinity'],
                          rating: data['rating'].toDouble(),
                          openNow: data['opening_hours'] != null
                              ? data['opening_hours']['open_now']
                                  ? 'Buka'
                                  : 'Tutup'
                              : 'Informasi tidak ada',
                          photoUrl: data['photoUrl'] ?? '',
                        );
                      },
                    );
                  }
                }
              }),
            )
          ],
        );
      }),
    );
  }
}
