import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  var response = {
    'status': false,
    'message': '',
    'data': null,
  };

  Future getEmail() async {
    try {
      User? user = _auth.currentUser;
      return response = {
        'status': true,
        'message': 'User found',
        'data': user!.email,
      };
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future saveDataUserFirestore(
      String uid,
      String name,
      String email,
      String gender,
      String province,
      String kabupaten,
      String kecamatan) async {
    try {
      final responseGeopoint =
          await getGeopoint(province, kabupaten, kecamatan);
      if (responseGeopoint['status']) {
        var data = responseGeopoint['data'];
        var results = jsonDecode(data)['results'] as List;
        var geometry = results[0]['geometry'];
        var location = geometry['location'];
        var lat = location['lat'];
        var lng = location['lng'];
        var geopoint = GeoPoint(lat, lng);
        User? user = _auth.currentUser!;
        _firestore.collection('users').doc(user.uid).set({
          'uid': uid,
          'name': name,
          'email': email,
          'province': province,
          'kabupaten': kabupaten,
          'kecamatan': kecamatan,
          'location': geopoint,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return response = {
          'status': true,
          'message': 'Data saved',
          'data': user,
        };
      } else {
        return response = {
          'status': false,
          'message': 'Error: ${responseGeopoint['message']}',
          'data': null,
        };
      }
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future getUser() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        return response = {
          'status': true,
          'message': 'User found',
          'data': user,
        };
      } else {
        return response = {
          'status': false,
          'message': 'User not found',
          'data': null,
        };
      }
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future checkUserFirestore() async {
    try {
      User? user = _auth.currentUser;
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(user!.uid).get();
      if (doc.exists) {
        return response = {
          'status': true,
          'message': 'User found',
          'data': doc.data(),
        };
      } else {
        return response = {
          'status': false,
          'message': 'User not found',
          'data': null,
        };
      }
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future getUserData() async {
    try {
      User? user = _auth.currentUser;
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(user!.uid).get();
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        data['username'] = user.displayName;
        return response = {
          'status': true,
          'message': 'User found',
          'data': data,
        };
      } else {
        return response = {
          'status': false,
          'message': 'User not found',
          'data': null,
        };
      }
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future updateDataUserFirestore(
      String username,
      String name,
      String email,
      String gender,
      String province,
      String kabupaten,
      String kecamatan) async {
    try {
      final responseGeopoint =
          await getGeopoint(province, kabupaten, kecamatan);
      if (responseGeopoint['status']) {
        User? user = _auth.currentUser;
        user!.updateDisplayName(username);
        var data = responseGeopoint['data'];
        var results = jsonDecode(data)['results'];
        var geometry = results[0]['geometry'];
        var location = geometry['location'];
        var lat = location['lat'];
        var lng = location['lng'];
        var geopoint = GeoPoint(lat, lng);
        await _firestore.collection('users').doc(user.uid).update({
          'name': name,
          'email': email,
          'gender': gender,
          'province': province,
          'kabupaten': kabupaten,
          'kecamatan': kecamatan,
          'location': geopoint,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return response = {
          'status': true,
          'message': 'Data updated',
          'data': user,
        };
      } else {
        return response = {
          'status': false,
          'message': 'Error: ${responseGeopoint['message']}',
          'data': null,
        };
      }
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future uploadProfilePicture(File newImage, String oldUrl) async {
    try {
      User? user = _auth.currentUser;
      if (oldUrl != '') {
        await _storage.refFromURL(oldUrl).delete();
      }
      var ref = _storage.ref().child('profile/${user!.uid}');
      await ref.putFile(newImage);
      var url = await ref.getDownloadURL();
      _firestore.collection('users').doc(user.uid).update({
        'photoURL': url,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      user.updatePhotoURL(url);
      return response = {
        'status': true,
        'message': 'Image uploaded',
      };
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future getGeopoint(
      String province, String kabupaten, String kecamatan) async {
    try {
      // https://maps.googleapis.com/maps/api/geocode/json?address=JAWA%20TENGAH,SEMARANG%20TENGAH,KOTA%20SEMARANG&key=YOUR_API_KEY
      final address = '$province,$kabupaten,$kecamatan';
      final addressStr = address.replaceAll(' ', '%20');
      final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
      var url = Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?address=$addressStr&key=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = res.body;
        if (jsonDecode(data)['status'] == 'OK') {
          return response = {
            'status': true,
            'message': 'Data found',
            'data': data,
          };
        } else {
          return response = {
            'status': false,
            'message': addressStr + ' not found',
            'data': null,
          };
        }
      } else {
        return response = {
          'status': false,
          'message': 'Error: ${res.statusCode}',
          'data': null,
        };
      }
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }
}
