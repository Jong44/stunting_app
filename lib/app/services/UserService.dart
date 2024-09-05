import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      User? user = _auth.currentUser!;
      _firestore.collection('users').doc(user.uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'province': province,
        'kabupaten': kabupaten,
        'kecamatan': kecamatan,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
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
      User? user = _auth.currentUser;
      user!.updateDisplayName(username);
      await _firestore.collection('users').doc(user!.uid).update({
        'name': name,
        'email': email,
        'gender': gender,
        'province': province,
        'kabupaten': kabupaten,
        'kecamatan': kecamatan,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return response = {
        'status': true,
        'message': 'Data updated',
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
}
