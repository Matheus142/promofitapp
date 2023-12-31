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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBwfMqw7N5Djjl515YeopZRvxklnwd0uTI',
    appId: '1:469151015814:web:2612e493ebc1c633de4207',
    messagingSenderId: '469151015814',
    projectId: 'agoravai3-842f7',
    authDomain: 'agoravai3-842f7.firebaseapp.com',
    storageBucket: 'agoravai3-842f7.appspot.com',
    measurementId: 'G-1B2MDDTHXL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2p50O8GMs_xF7d1fc2dTtw9G8srt8tiU',
    appId: '1:469151015814:android:53a5b939161f1478de4207',
    messagingSenderId: '469151015814',
    projectId: 'agoravai3-842f7',
    storageBucket: 'agoravai3-842f7.appspot.com',
  );
}
