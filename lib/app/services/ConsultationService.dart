import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConsultationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var response = {
    'status': false,
    'message': '',
    'data': null,
  };

  Future getDokters() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('dokters').get();
        if (data.docs.isNotEmpty) {
          var listData = data.docs.map((e) {
            return {
              'id': e.id,
              'data': e.data(),
            };
          }).toList();
          return response = {
            'status': true,
            'message': 'Data found',
            'data': listData,
          };
        } else {
          return response = {
            'status': false,
            'message': 'Data not found',
            'data': null,
          };
        }
      } else {
        return response = {
          'status': false,
          'message': 'User not found',
          'data': null,
        };
      }
    } catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.toString()}',
        'data': null,
      };
    }
  }

  Future getDokterById(String id) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('dokters').doc(id).get();
        if (data.exists) {
          return response = {
            'status': true,
            'message': 'Data found',
            'data': data.data(),
          };
        } else {
          return response = {
            'status': false,
            'message': 'Data not found',
            'data': null,
          };
        }
      } else {
        return response = {
          'status': false,
          'message': 'User not found',
          'data': null,
        };
      }
    } catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.toString()}',
        'data': null,
      };
    }
  }
}
