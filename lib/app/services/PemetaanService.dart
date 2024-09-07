import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PemetaanService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getLatLongUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('users').doc(user.uid).get();
        if (data.exists) {
          var dataMap = data.data() as Map<String, dynamic>;
          var dataMapLocation = {
            'id': dataMap['uid'],
            'location': dataMap['location'],
          };
          return {'status': true, 'data': dataMapLocation};
        } else {
          return {'status': false, 'message': 'Data not found'};
        }
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  Future getKlinikPuskesmasGooglePlace(String initialPosition) async {
    try {
      final googleKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
      final url = Uri.parse(
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=puskesmas%rumahsakit%rumahsakitanak&location=$initialPosition&radius=3000&type=health&key=$googleKey');
      final ressPost = await http.get(url);
      if (ressPost.statusCode == 200) {
        return {'status': true, 'data': ressPost.body};
      } else {
        return {'status': false, 'message': 'Failed to get data'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }
}
