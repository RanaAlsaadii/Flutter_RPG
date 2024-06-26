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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD99JgZo62z9yz5GiQtmaL7KJXhTPdgyCs',
    appId: '1:191946425948:android:ad1c3a0567682d459c0899',
    messagingSenderId: '191946425948',
    projectId: 'flutter-rpg-54343',
    storageBucket: 'flutter-rpg-54343.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClQ8KrX3o0w6SYstPJBGx5rBgiE9ND6Eo',
    appId: '1:191946425948:ios:9ff536b592e62e689c0899',
    messagingSenderId: '191946425948',
    projectId: 'flutter-rpg-54343',
    storageBucket: 'flutter-rpg-54343.appspot.com',
    iosBundleId: 'com.example.flutterRpg',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlBuLYVTMLxrB8OH8vlbxLWJKTElXDrCQ',
    appId: '1:191946425948:web:933454f6edfc70779c0899',
    messagingSenderId: '191946425948',
    projectId: 'flutter-rpg-54343',
    authDomain: 'flutter-rpg-54343.firebaseapp.com',
    storageBucket: 'flutter-rpg-54343.appspot.com',
  );

}