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
    apiKey: 'AIzaSyC3eWo8Y8Wlspt6x61SAv4LheeH4keZLmA',
    appId: '1:828400671833:web:5b866232bfb88dfedd6548',
    messagingSenderId: '828400671833',
    projectId: 'khata-tracker',
    authDomain: 'khata-tracker.firebaseapp.com',
    storageBucket: 'khata-tracker.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7cdYBao8wdJGbsS-hnbQaa87hTl3Wx8Y',
    appId: '1:828400671833:android:b83be831796a404add6548',
    messagingSenderId: '828400671833',
    projectId: 'khata-tracker',
    storageBucket: 'khata-tracker.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClLe3tkxHsDz2ZzxhOqXRFDaDW1kjd7_0',
    appId: '1:828400671833:ios:97cec7a042974a50dd6548',
    messagingSenderId: '828400671833',
    projectId: 'khata-tracker',
    storageBucket: 'khata-tracker.firebasestorage.app',
    iosClientId:
        '828400671833-n7n4mu1jkj6dch1phnsfmbu1aof1kr95.apps.googleusercontent.com',
    iosBundleId: 'com.example.khataTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClLe3tkxHsDz2ZzxhOqXRFDaDW1kjd7_0',
    appId: '1:828400671833:ios:97cec7a042974a50dd6548',
    messagingSenderId: '828400671833',
    projectId: 'khata-tracker',
    storageBucket: 'khata-tracker.firebasestorage.app',
    iosClientId:
        '828400671833-n7n4mu1jkj6dch1phnsfmbu1aof1kr95.apps.googleusercontent.com',
    iosBundleId: 'com.example.khataTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3eWo8Y8Wlspt6x61SAv4LheeH4keZLmA',
    appId: '1:828400671833:web:af793aec2c2a3d09dd6548',
    messagingSenderId: '828400671833',
    projectId: 'khata-tracker',
    authDomain: 'khata-tracker.firebaseapp.com',
    storageBucket: 'khata-tracker.firebasestorage.app',
  );
}
