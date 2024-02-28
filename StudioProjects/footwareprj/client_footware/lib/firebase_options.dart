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
    apiKey: 'AIzaSyBW7AGqXkBDRMku5SZZjlsCPioDQyQitB8',
    appId: '1:849804799292:web:65bf57b80187b12c2a4239',
    messagingSenderId: '849804799292',
    projectId: 'rapid-project-f247b',
    authDomain: 'rapid-project-f247b.firebaseapp.com',
    storageBucket: 'rapid-project-f247b.appspot.com',
    measurementId: 'G-YXS8R7F7NY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLReDJzeAwb2d1MlDPd80J3CpjvECcUCA',
    appId: '1:849804799292:android:56c1c55a7510be422a4239',
    messagingSenderId: '849804799292',
    projectId: 'rapid-project-f247b',
    storageBucket: 'rapid-project-f247b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKLPlBTiOs5YK-eRvsFxm31WhoZdHZvcw',
    appId: '1:849804799292:ios:e96cf3bd43ffe5342a4239',
    messagingSenderId: '849804799292',
    projectId: 'rapid-project-f247b',
    storageBucket: 'rapid-project-f247b.appspot.com',
    iosBundleId: 'com.example.clientFootware',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKLPlBTiOs5YK-eRvsFxm31WhoZdHZvcw',
    appId: '1:849804799292:ios:fac39954fbe0c3272a4239',
    messagingSenderId: '849804799292',
    projectId: 'rapid-project-f247b',
    storageBucket: 'rapid-project-f247b.appspot.com',
    iosBundleId: 'com.example.clientFootware.RunnerTests',
  );
}
