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
    apiKey: 'AIzaSyA-dDfqH-VOzZTIsaE2gVrcLCFqyGawzYM',
    appId: '1:77143866715:web:073e745af9eca7bf336e7e',
    messagingSenderId: '77143866715',
    projectId: 'slimsage-6d428',
    authDomain: 'slimsage-6d428.firebaseapp.com',
    storageBucket: 'slimsage-6d428.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCua-knZ5GCJ79TdIIx3xD1D5vyo5VIreM',
    appId: '1:77143866715:android:1bf08f1aef70d344336e7e',
    messagingSenderId: '77143866715',
    projectId: 'slimsage-6d428',
    storageBucket: 'slimsage-6d428.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-pEBdLVNWUhSHne2wPnh6x8K_wC_skG0',
    appId: '1:77143866715:ios:ed98e6a270bbdc64336e7e',
    messagingSenderId: '77143866715',
    projectId: 'slimsage-6d428',
    storageBucket: 'slimsage-6d428.appspot.com',
    iosBundleId: 'com.example.miniproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-pEBdLVNWUhSHne2wPnh6x8K_wC_skG0',
    appId: '1:77143866715:ios:e555aef8202fe3fb336e7e',
    messagingSenderId: '77143866715',
    projectId: 'slimsage-6d428',
    storageBucket: 'slimsage-6d428.appspot.com',
    iosBundleId: 'com.example.miniproject.RunnerTests',
  );
}
