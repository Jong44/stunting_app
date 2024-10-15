import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GameService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getSoal() async {
    try {
      var data = await _firestore.collection('game').get();
      if (data.docs.isNotEmpty) {
        var listData = data.docs.map((e) {
          return {
            'id': e.id,
            'data': e.data(),
          };
        }).toList();
        return {
          'status': true,
          'message': 'Data found',
          'data': listData,
        };
      } else {
        return {
          'status': false,
          'message': 'Data not found',
          'data': null,
        };
      }
    } catch (e) {
      return {
        'status': false,
        'message': 'Error: ${e.toString()}',
        'data': null,
      };
    }
  }
}
