import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GrafikAnakService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addDataAnak(
    String namaBayi,
    int indexGender,
    String tanggalLahir,
    String bulanLahir,
    String tahunLahir,
    String bulanCek,
    String tahunCek,
    String tinggiBadan,
    String beratBadan,
    String lingkarKepala,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('anak')
            .doc(user.uid)
            .collection('data_anak')
            .add({
          'nama_bayi': namaBayi,
          'indexGender': indexGender,
          'tanggal_lahir': tanggalLahir,
          'bulan_lahir': bulanLahir,
          'tahun_lahir': tahunLahir,
          'data_pertumbuhan': [
            {
              'bulan_cek': bulanCek,
              'tahun_cek': tahunCek,
              'tinggi_badan': tinggiBadan,
              'berat_badan': beratBadan,
              'lingkar_kepala': lingkarKepala,
            }
          ],
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return {'status': true};
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  Future updateDataAnak(
    String id,
    String namaBayi,
    int indexGender,
    String tanggalLahir,
    String bulanLahir,
    String tahunLahir,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('anak')
            .doc(user.uid)
            .collection('data_anak')
            .doc(id)
            .update({
          'nama_bayi': namaBayi,
          'indexGender': indexGender,
          'tanggal_lahir': tanggalLahir,
          'bulan_lahir': bulanLahir,
          'tahun_lahir': tahunLahir,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return {'status': true};
      } else {
        return {'status': false, 'message': 'User not found'};
      }
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  Future getAnakList() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore
            .collection('anak')
            .doc(user.uid)
            .collection('data_anak')
            .get();
        if (data.docs.isNotEmpty) {
          // menambahkan id key pada data
          var listData = data.docs.map((e) {
            return {
              'id': e.id,
              'data': e.data(),
            };
          }).toList();
          return {
            'status': true,
            'data': listData,
          };
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

  Future getAnakById(String id) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore
            .collection('anak')
            .doc(user.uid)
            .collection('data_anak')
            .doc(id)
            .get();
        if (data.exists) {
          return {
            'status': true,
            'data': data.data(),
          };
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

  Future getDataPertumbuhanByBulan(
      String id, String bulan, String tahun) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final data = await _firestore
            .collection('anak')
            .doc(user.uid)
            .collection('data_anak')
            .doc(id)
            .get();
        if (data.exists) {
          var dataPertumbuhan = data.data()!['data_pertumbuhan'];
          var dataByBulan = dataPertumbuhan.where((element) {
            return element['bulan_cek'] == bulan &&
                element['tahun_cek'] == tahun;
          }).toList();
          if (dataByBulan.isNotEmpty) {
            return {
              'status': true,
              'data': dataByBulan[0],
            };
          } else {
            return {'status': false, 'message': 'Data not found'};
          }
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

  Future updateDataPertumbuhanByBulan(
    String id,
    String bulanCek,
    String tahunCek,
    String tinggiBadan,
    String beratBadan,
    String lingkarKepala,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // kondisi ketika bulan cek dan tahun cek sudah ada
        final data = await _firestore
            .collection('anak')
            .doc(user.uid)
            .collection('data_anak')
            .doc(id)
            .get();
        if (data.exists) {
          var dataPertumbuhan = data.data()!['data_pertumbuhan'];
          var dataByBulan = dataPertumbuhan.where((element) {
            return element['bulan_cek'] == bulanCek &&
                element['tahun_cek'] == tahunCek;
          }).toList();
          if (dataByBulan.isNotEmpty) {
            var indexData = dataPertumbuhan.indexOf(dataByBulan[0]);
            dataPertumbuhan[indexData] = {
              'bulan_cek': bulanCek,
              'tahun_cek': tahunCek,
              'tinggi_badan': tinggiBadan,
              'berat_badan': beratBadan,
              'lingkar_kepala': lingkarKepala,
            };
            await _firestore
                .collection('anak')
                .doc(user.uid)
                .collection('data_anak')
                .doc(id)
                .update({
              'updatedAt': FieldValue.serverTimestamp(),
              'data_pertumbuhan': dataPertumbuhan,
            });
            return {'status': true};
          } else {
            // kondisi ketika bulan cek dan tahun cek belum ada
            await _firestore
                .collection('anak')
                .doc(user.uid)
                .collection('data_anak')
                .doc(id)
                .update({
              'updatedAt': FieldValue.serverTimestamp(),
              'data_pertumbuhan': FieldValue.arrayUnion([
                {
                  'bulan_cek': bulanCek,
                  'tahun_cek': tahunCek,
                  'tinggi_badan': tinggiBadan,
                  'berat_badan': beratBadan,
                  'lingkar_kepala': lingkarKepala,
                }
              ])
            });
            return {'status': true};
          }
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
}
