import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ArtikelService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var response = {
    'status': false,
    'message': '',
    'data': null,
  };

  Future getAllArtikel() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('artikels').get();
        if (data.docs.isNotEmpty) {
          var listData = data.docs.map((e) {
            return {
              'id': e.id,
              'data': e.data(),
            };
          }).toList();
          return response = {
            'status': true,
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

  Future getArtikelById(String id) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('artikels').doc(id).get();
        if (data.exists) {
          return response = {
            'status': true,
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

  Future getCategoryArtikel() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('categoryArtikel').get();
        if (data.docs.isNotEmpty) {
          var listData = data.docs.map((e) {
            return {
              'id': e.id,
              'data': e.data(),
            };
          }).toList();
          return response = {
            'status': true,
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
}
