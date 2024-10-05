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
    apiKey: 'AIzaSyDefaoOuKn9whAtIxn1AXIEAjAefJvkKUk',
    appId: '1:839259054814:web:0449014c340a7a79d6184f',
    messagingSenderId: '839259054814',
    projectId: 'gyrored-dfca6',
    authDomain: 'gyrored-dfca6.firebaseapp.com',
    databaseURL: 'https://gyrored-dfca6-default-rtdb.firebaseio.com',
    storageBucket: 'gyrored-dfca6.appspot.com',
    measurementId: 'G-XT6ZD6X1TB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDe-AwAry4Q_NqtQsGg6Q9kc8_SMx9kp9M',
    appId: '1:839259054814:android:e325e579a2e3302dd6184f',
    messagingSenderId: '839259054814',
    projectId: 'gyrored-dfca6',
    databaseURL: 'https://gyrored-dfca6-default-rtdb.firebaseio.com',
    storageBucket: 'gyrored-dfca6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwP5WVjpROxuKxMdBWN9UwlOjWSGfMjRw',
    appId: '1:839259054814:ios:ff72732d41bd4e51d6184f',
    messagingSenderId: '839259054814',
    projectId: 'gyrored-dfca6',
    databaseURL: 'https://gyrored-dfca6-default-rtdb.firebaseio.com',
    storageBucket: 'gyrored-dfca6.appspot.com',
    iosBundleId: 'com.example.nasaApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwP5WVjpROxuKxMdBWN9UwlOjWSGfMjRw',
    appId: '1:839259054814:ios:ff72732d41bd4e51d6184f',
    messagingSenderId: '839259054814',
    projectId: 'gyrored-dfca6',
    databaseURL: 'https://gyrored-dfca6-default-rtdb.firebaseio.com',
    storageBucket: 'gyrored-dfca6.appspot.com',
    iosBundleId: 'com.example.nasaApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4WqOSPRS3dq8nIOT1yF2_dScMixpQfuw',
    appId: '1:839259054814:web:ed12d276d8f5e4bcd6184f',
    messagingSenderId: '839259054814',
    projectId: 'gyrored-dfca6',
    authDomain: 'gyrored-dfca6.firebaseapp.com',
    databaseURL: 'https://gyrored-dfca6-default-rtdb.firebaseio.com',
    storageBucket: 'gyrored-dfca6.appspot.com',
    measurementId: 'G-DTT0T3YZ54',
  );
}
