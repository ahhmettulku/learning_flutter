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
    apiKey: 'AIzaSyB8u5jTJDeidcvSvNn8np-MR8SOccEKPck',
    appId: '1:1062839427745:web:bdec1704d3a005db1586e0',
    messagingSenderId: '1062839427745',
    projectId: 'learning-flatter',
    authDomain: 'learning-flatter.firebaseapp.com',
    storageBucket: 'learning-flatter.appspot.com',
    measurementId: 'G-FP3NZKFJ70',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXrXzfQMlvV2vk671oLNbRHzjsCFq1vj0',
    appId: '1:1062839427745:android:9d78edd5a071e58c1586e0',
    messagingSenderId: '1062839427745',
    projectId: 'learning-flatter',
    storageBucket: 'learning-flatter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdfkLKQcJgEs18dGwyqt6HMREUxwS3y64',
    appId: '1:1062839427745:ios:c0f5a547299e3ace1586e0',
    messagingSenderId: '1062839427745',
    projectId: 'learning-flatter',
    storageBucket: 'learning-flatter.appspot.com',
    iosClientId:
        '1062839427745-13uqouc9cnm5dopog6tuboa26j9v6mcm.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdfkLKQcJgEs18dGwyqt6HMREUxwS3y64',
    appId: '1:1062839427745:ios:c0f5a547299e3ace1586e0',
    messagingSenderId: '1062839427745',
    projectId: 'learning-flatter',
    storageBucket: 'learning-flatter.appspot.com',
    iosClientId:
        '1062839427745-13uqouc9cnm5dopog6tuboa26j9v6mcm.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningFlutter',
  );
}
