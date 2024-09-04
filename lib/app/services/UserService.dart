import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future saveDataUserFirestore(String uid, String name, String email,
      String province, String kabupaten, String kecamatan) async {
    try {
      User? user = _auth.currentUser!;
      _firestore.collection('users').doc(user.uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'province': province,
        'kabupaten': kabupaten,
        'kecamatan': kecamatan,
      });
      return response = {
        'status': true,
        'message': 'Data saved',
        'data': user,
      };
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
        return response = {
          'status': true,
          'message': 'User found',
          'data': doc.data() as Map<String, dynamic>,
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
}
