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
    apiKey: 'AIzaSyBwx9KI2e0BVfzzpstPPI9KOpVfMCWgmkY',
    appId: '1:137419813462:web:f1286a4a0ac3af6b5401f7',
    messagingSenderId: '137419813462',
    projectId: 'reddit-app-clone-4215b',
    authDomain: 'reddit-app-clone-4215b.firebaseapp.com',
    storageBucket: 'reddit-app-clone-4215b.appspot.com',
    measurementId: 'G-KNDTP322YB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaBvXYx0dTG-sSki4_FP1r7wZWxblr9vA',
    appId: '1:137419813462:android:562055e46d769b845401f7',
    messagingSenderId: '137419813462',
    projectId: 'reddit-app-clone-4215b',
    storageBucket: 'reddit-app-clone-4215b.appspot.com',
  );
}
