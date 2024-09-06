import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResepService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getCatergory() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final kategori = await _firestore.collection('categoryResep').get();
        if (kategori.docs.isNotEmpty) {
          return {
            'status': true,
            'data': kategori.docs.map((e) {
              return {
                'category': e.data()['category'],
              };
            }).toList()
          };
        } else {
          return {'status': false, 'message': 'Kategori not found'};
        }
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  Future getAllResep() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final resep = await _firestore.collection('reseps').get();
        if (resep.docs.isNotEmpty) {
          var listData = resep.docs.map((e) {
            return {
              'id': e.id,
              'data': e.data(),
            };
          }).toList();
          return {'status': true, 'data': listData};
        } else {
          return {'status': false, 'message': 'Resep not found'};
        }
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  Future getResepById(String id) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final resep = await _firestore.collection('reseps').doc(id).get();
        if (resep.exists) {
          return {
            'status': true,
            'data': {
              'id': resep.id,
              'data': resep.data(),
            }
          };
        } else {
          return {'status': false, 'message': 'Resep not found'};
        }
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  Future updateJumlahPengunjung(String id) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final resep = await _firestore.collection('reseps').doc(id).get();
        if (resep.exists) {
          var jumlahPengunjung = resep.data()!['jumlahPengunjung'] ?? 0;
          var jumlahPengunjungBaru = jumlahPengunjung + 1;
          await _firestore.collection('reseps').doc(id).update({
            'jumlahPengunjung': jumlahPengunjungBaru,
          });
          return {
            'status': true,
            'message': 'Jumlah pengunjung updated',
            'data': {'jumlahPengunjung': jumlahPengunjungBaru}
          };
        } else {
          return {'status': false, 'message': 'Resep not found'};
        }
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }
}
