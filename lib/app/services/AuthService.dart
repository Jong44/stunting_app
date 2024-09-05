import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var response = {
    'status': false,
    'message': '',
    'data': null,
  };

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return response = {
        'status': true,
        'message': 'Sign in success',
        'data': user,
      };
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return response = {
            'status': false,
            'message': 'User Tidak Ditemukan',
            'data': null,
          };
        case 'wrong-password':
          return response = {
            'status': false,
            'message': 'Password Salah',
            'data': null,
          };
        default:
          return response = {
            'status': false,
            'message': 'Error: ${e.code}',
            'data': null,
          };
      }
    }
  }

  Future signUpWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      await user.updateDisplayName(name);
      return response = {
        'status': true,
        'message': 'Sign up success',
        'data': user,
      };
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return response = {
            'status': false,
            'message': 'Email Sudah Digunakan',
            'data': null,
          };
        default:
          return response = {
            'status': false,
            'message': 'Error: ${e.code}',
            'data': null,
          };
      }
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      return response = {
        'status': true,
        'message': 'Sign out success',
        'data': null,
      };
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      await user!.sendEmailVerification();
      return response = {
        'status': true,
        'message': 'Email verification sent',
        'data': null,
      };
    } on FirebaseAuthException catch (e) {
      return response = {
        'status': false,
        'message': 'Error: ${e.code}',
        'data': null,
      };
    }
  }

  Future checkEmailVerified() async {
    try {
      User? user = _auth.currentUser;
      await user!.reload();
      if (user.emailVerified) {
        return response = {
          'status': true,
          'message': 'Email verified',
          'data': user,
        };
      } else {
        return response = {
          'status': false,
          'message': 'Email not verified',
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
