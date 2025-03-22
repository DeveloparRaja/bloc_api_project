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
        return windows;
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
    apiKey: 'AIzaSyAMYa14fjQznP83EH5NeQXWtzn1E-okdZc',
    appId: '1:879633935678:web:0e40bead10c3da0d2d106f',
    messagingSenderId: '879633935678',
    projectId: 'new-firebase-6d2de',
    authDomain: 'new-firebase-6d2de.firebaseapp.com',
    databaseURL: 'https://new-firebase-6d2de-default-rtdb.firebaseio.com',
    storageBucket: 'new-firebase-6d2de.firebasestorage.app',
    measurementId: 'G-08SVZ2ZNDK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMJomBSWWWR_XEkWNzaU8i_HkspTLe3xY',
    appId: '1:879633935678:android:c227ee18f8fe105e2d106f',
    messagingSenderId: '879633935678',
    projectId: 'new-firebase-6d2de',
    databaseURL: 'https://new-firebase-6d2de-default-rtdb.firebaseio.com',
    storageBucket: 'new-firebase-6d2de.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD21834-7WQKCrH657w20SKaUuUBFEbmcw',
    appId: '1:879633935678:ios:9e47f053bf60db6e2d106f',
    messagingSenderId: '879633935678',
    projectId: 'new-firebase-6d2de',
    databaseURL: 'https://new-firebase-6d2de-default-rtdb.firebaseio.com',
    storageBucket: 'new-firebase-6d2de.firebasestorage.app',
    iosBundleId: 'com.example.blocFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD21834-7WQKCrH657w20SKaUuUBFEbmcw',
    appId: '1:879633935678:ios:9e47f053bf60db6e2d106f',
    messagingSenderId: '879633935678',
    projectId: 'new-firebase-6d2de',
    databaseURL: 'https://new-firebase-6d2de-default-rtdb.firebaseio.com',
    storageBucket: 'new-firebase-6d2de.firebasestorage.app',
    iosBundleId: 'com.example.blocFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAMYa14fjQznP83EH5NeQXWtzn1E-okdZc',
    appId: '1:879633935678:web:21ea865ab33448ad2d106f',
    messagingSenderId: '879633935678',
    projectId: 'new-firebase-6d2de',
    authDomain: 'new-firebase-6d2de.firebaseapp.com',
    databaseURL: 'https://new-firebase-6d2de-default-rtdb.firebaseio.com',
    storageBucket: 'new-firebase-6d2de.firebasestorage.app',
    measurementId: 'G-ZZB6N65JXG',
  );
}
