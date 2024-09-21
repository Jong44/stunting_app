import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:iconify_flutter/icons/map.dart';

class TransaksiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getToken({
    required String idDoctor,
    required String email,
    required String nameUser,
    required String nameDoctor,
    required int price,
  }) async {
    var apiUrl = dotenv.env['BASE_URL'] ?? '';
    var url = Uri.parse('$apiUrl/token');

    var idOrder = DateTime.now().millisecondsSinceEpoch;

    var payload = {
      'idOrder': idOrder,
      'name': nameUser,
      'email': email,
      'idProduct': idDoctor,
      'price': price,
      'productName': 'Consultation with Doctor $nameDoctor',
      'quantity': 1,
    };

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return {
          'status': true,
          'message': 'Token created',
          'data': data,
        };
      } else {
        return {
          'status': false,
          'message': 'Error: ${response.statusCode}',
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

  Future saveTransaction({
    required String idDoctor,
    required String idUser,
    required int totalPayment,
    required dataPayment,
  }) async {
    try {
      var user = _auth.currentUser;
      if (user != null) {
        var data = {
          'idDoctor': idDoctor,
          'idUser': idUser,
          'payment': dataPayment,
          'total': totalPayment,
          'createdAt': FieldValue.serverTimestamp(),
        };
        await _firestore.collection('transactions').doc().set(data);
        return {
          'status': true,
          'message': 'Transaction saved',
          'data': null,
        };
      } else {
        return {
          'status': false,
          'message': 'User not found',
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
