// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBbgXj_F6f-afhT1fPKXbpmaUf98j26U78',
    appId: '1:423720830831:web:13e676b3c2645501d3ca9a',
    messagingSenderId: '423720830831',
    projectId: 'spending-manager-996ac',
    authDomain: 'spending-manager-996ac.firebaseapp.com',
    storageBucket: 'spending-manager-996ac.appspot.com',
    measurementId: 'G-E67J0Q76JZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBj-9A5JseQckninN4mSvBFucE4whY0AQ0',
    appId: '1:423720830831:android:4aec2d900fd42dc6d3ca9a',
    messagingSenderId: '423720830831',
    projectId: 'spending-manager-996ac',
    storageBucket: 'spending-manager-996ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHCbxreh8ATM_uRqRjhGv2lozdNjXbcWs',
    appId: '1:423720830831:ios:9c5b14ed03eb0fe3d3ca9a',
    messagingSenderId: '423720830831',
    projectId: 'spending-manager-996ac',
    storageBucket: 'spending-manager-996ac.appspot.com',
    iosClientId: '423720830831-nqm5jqm0r0j3qab61qpajmtmo1r6pndt.apps.googleusercontent.com',
    iosBundleId: 'com.example.spendingManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHCbxreh8ATM_uRqRjhGv2lozdNjXbcWs',
    appId: '1:423720830831:ios:9c5b14ed03eb0fe3d3ca9a',
    messagingSenderId: '423720830831',
    projectId: 'spending-manager-996ac',
    storageBucket: 'spending-manager-996ac.appspot.com',
    iosClientId: '423720830831-nqm5jqm0r0j3qab61qpajmtmo1r6pndt.apps.googleusercontent.com',
    iosBundleId: 'com.example.spendingManager',
  );
}
