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
    apiKey: 'AIzaSyCsTVuQE1FKUj8ev5mWTlw3sn1q8ZQM_30',
    appId: '1:910229994723:web:a3fe413ec40dd9c47199d6',
    messagingSenderId: '910229994723',
    projectId: 'blink-eye-ytu',
    authDomain: 'blink-eye-ytu.firebaseapp.com',
    storageBucket: 'blink-eye-ytu.appspot.com',
    measurementId: 'G-Z5DEELFN3V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz_hUrEt4JlijhxgxRAPsZlTZb5wef48Q',
    appId: '1:910229994723:android:49e36004382dd36e7199d6',
    messagingSenderId: '910229994723',
    projectId: 'blink-eye-ytu',
    storageBucket: 'blink-eye-ytu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDY6WUYf4kLL7yPqMWN2ud9cjF1QRJamDk',
    appId: '1:910229994723:ios:6e7d41756d6f067e7199d6',
    messagingSenderId: '910229994723',
    projectId: 'blink-eye-ytu',
    storageBucket: 'blink-eye-ytu.appspot.com',
    iosBundleId: 'com.msolak.blinkEyeYtu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDY6WUYf4kLL7yPqMWN2ud9cjF1QRJamDk',
    appId: '1:910229994723:ios:4c6cca2e6fd736d57199d6',
    messagingSenderId: '910229994723',
    projectId: 'blink-eye-ytu',
    storageBucket: 'blink-eye-ytu.appspot.com',
    iosBundleId: 'com.msolak.blinkEyeYtu.RunnerTests',
  );
}
