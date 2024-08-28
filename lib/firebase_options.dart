// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAINJp2riJLmX285P_4iarXDHM9VYvllRU',
    appId: '1:298854154272:android:6223185d8887dab04dbc45',
    messagingSenderId: '298854154272',
    projectId: 'stunting-app-e14eb',
    databaseURL: 'https://stunting-app-e14eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'stunting-app-e14eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyBhBpLnt8BzTnz4ZsheluDbYURyHOYhk',
    appId: '1:298854154272:ios:e2f7edc50ac034f44dbc45',
    messagingSenderId: '298854154272',
    projectId: 'stunting-app-e14eb',
    databaseURL: 'https://stunting-app-e14eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'stunting-app-e14eb.appspot.com',
    iosClientId: '298854154272-60ri3c0qaog0o0mhlmjogm4h4mghtf8d.apps.googleusercontent.com',
    iosBundleId: 'com.example.stuntingApp',
  );
}