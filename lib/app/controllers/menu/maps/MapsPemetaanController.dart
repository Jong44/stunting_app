import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stunting_app/app/services/PemetaanService.dart';

class MapsPemetaanController extends GetxController {
  var isLoading = false.obs;

  late GoogleMapController mapController;
  // dinammis initialPosition
  var initialPosition = LatLng(-6.1753924, 106.8271528).obs;

  // Set untuk menyimpan marker
  final markers = <Marker>{}.obs;

  // API Key dari .env
  final String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  var klinikPuskesmas = [].obs;
  var activeMarker = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLatLongUser();
  }

  @override
  void onClose() {
    mapController.dispose();
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addMarker(LatLng position) {
    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(
          title: 'Marker',
          snippet: 'Lat: ${position.latitude}, Lng: ${position.longitude}',
        ),
      ),
    );
  }

  void getLatLongUser() async {
    isLoading(true);
    final response = await PemetaanService().getLatLongUser();
    if (response['status']) {
      final data = response['data'];
      // convert geo point to lat long
      final latLong = data['location'] as GeoPoint;
      final lat = latLong.latitude;
      final long = latLong.longitude;
      initialPosition.value = LatLng(lat, long);
      getKlinikPuskesmasGooglePlace();
    } else {
      Get.snackbar('Error', response['message']);
    }
    isLoading(false);
  }

  void getKlinikPuskesmasGooglePlace() async {
    isLoading.value = true;
    final initPosStr =
        '${initialPosition.value.latitude}%2C${initialPosition.value.longitude}';
    final response =
        await PemetaanService().getKlinikPuskesmasGooglePlace(initPosStr);
    if (response['status']) {
      // mendecode json
      klinikPuskesmas.clear();
      final data = jsonDecode(response['data']);
      klinikPuskesmas.value = data['results'];
      // https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO_REFERENCE&key=YOUR_API_KEY
      klinikPuskesmas.map((e) {
        if (e['photos'] != null) {
          final photoRef = e['photos'][0]['photo_reference'];
          e['photoUrl'] =
              'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoRef&key=$googleMapsApiKey';
        }
      });
      // mengurutkan dari index terakhir ke index pertama dan seterusnya
      klinikPuskesmas.value = klinikPuskesmas.reversed.toList();
      markers.clear();
      for (var item in klinikPuskesmas) {
        final lat = item['geometry']['location']['lat'];
        final long = item['geometry']['location']['lng'];
        final name = item['name'];
        final address = item['vicinity'];
        final position = LatLng(lat, long);
        markers.add(
          Marker(
            markerId: MarkerId(position.toString()),
            position: position,
            infoWindow: InfoWindow(
              title: name,
              snippet: address,
            ),
            onTap: () {
              final index =
                  klinikPuskesmas.indexWhere((element) => element == item);
              setActiveMarker(index);
            },
          ),
        );
      }
    } else {
      Get.snackbar('Error', response['message']);
    }
    isLoading.value = false;
  }

  void setActiveMarker(int index) {
    activeMarker.value = index;
  }
}
