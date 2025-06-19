import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyC3eWo8Y8Wlspt6x61SAv4LheeH4keZLmA",
    authDomain: "khata-tracker.firebaseapp.com",
    projectId: "khata-tracker",
    storageBucket: "khata-tracker.firebasestorage.app",
    messagingSenderId: "828400671833",
    appId: "1:828400671833:web:5b866232bfb88dfedd6548",
  );
}
