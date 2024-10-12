import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CommunityService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  var response = {
    'status': false,
    'message': '',
    'data': null,
  };

  Future getCategoryCommunity() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('categoryCommunity').get();
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

  Future uploadThread(
    String title,
    String content,
    String category,
    File image,
  ) async {
    if (File(image.path).existsSync()) {
      try {
        var ref = _storage.ref().child('community').child(image.path);
        await ref.putFile(image);
        var url = await ref.getDownloadURL();
        if (url.isNotEmpty) {
          return saveThread(title, content, category, url);
        } else {
          return response = {
            'status': false,
            'message': 'Error: Image not uploaded',
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
    } else {
      return saveThread(title, content, category, '');
    }
  }

  Future saveThread(
    String title,
    String content,
    String category,
    String imageURL,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('community').add({
          'title': title,
          'content': content,
          'category': category,
          'image': imageURL,
          'userId': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return response = {
          'status': true,
          'message': 'Thread created',
        };
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

  Future getThread() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('community').get();
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

  Future getThreadByCategory(String category) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore
            .collection('community')
            .where('category', isEqualTo: category)
            .get();
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

  Future getThreadById(String id) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore.collection('community').doc(id).get();
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

  Future sendComment(String id, String comment) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _database.ref().child('commentCommunity').child(id).push().set({
          'userId': user.uid,
          'photoURL': user.photoURL,
          'name': user.displayName,
          'comment': comment,
          'createdAt': DateTime.now().toIso8601String(),
        });
        return response = {
          'status': true,
          'message': 'Comment created',
        };
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
