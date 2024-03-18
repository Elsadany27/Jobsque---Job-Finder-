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
    apiKey: 'AIzaSyCAOlYYaeTrmGAKgF3VM9aYAj8EWeJCUSI',
    appId: '1:872931771220:web:8b0cf0e2b5bc545e06bec1',
    messagingSenderId: '872931771220',
    projectId: 'chat-app-8c20d',
    authDomain: 'chat-app-8c20d.firebaseapp.com',
    storageBucket: 'chat-app-8c20d.appspot.com',
    measurementId: 'G-8QQQX8DMWG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByweIFw70LzSsuDvTHDKKcIHWQ9w1I76o',
    appId: '1:872931771220:android:c423bc38eed747c006bec1',
    messagingSenderId: '872931771220',
    projectId: 'chat-app-8c20d',
    storageBucket: 'chat-app-8c20d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMCXbmTE-kEN2tJxpwNQ4JIHurYoWegzo',
    appId: '1:872931771220:ios:6f9b69d165dde43606bec1',
    messagingSenderId: '872931771220',
    projectId: 'chat-app-8c20d',
    storageBucket: 'chat-app-8c20d.appspot.com',
    iosBundleId: 'com.example.firebaseChat',
  );
}