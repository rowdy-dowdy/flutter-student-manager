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
    apiKey: 'AIzaSyDX1THdZvYgZotQ63gaIfwcP9JC9BWVYUw',
    appId: '1:273383696499:web:c254383edbec7c1e2ea206',
    messagingSenderId: '273383696499',
    projectId: 'trung-tam-353af',
    authDomain: 'trung-tam-353af.firebaseapp.com',
    storageBucket: 'trung-tam-353af.appspot.com',
    measurementId: 'G-0NHY0KC5MB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzhKr4abH7VK53nzzNCv5Z7hGmN7I-JQ0',
    appId: '1:273383696499:android:58eefdc465fbd8f32ea206',
    messagingSenderId: '273383696499',
    projectId: 'trung-tam-353af',
    storageBucket: 'trung-tam-353af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh3VQucEH7ITMnb_UsqFyA9L-YV_MRQZE',
    appId: '1:273383696499:ios:fa3ed0adbc05a9e22ea206',
    messagingSenderId: '273383696499',
    projectId: 'trung-tam-353af',
    storageBucket: 'trung-tam-353af.appspot.com',
    iosClientId: '273383696499-elamtpa2a83hn7r3llu5et2ugeo366ld.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterStudentManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCh3VQucEH7ITMnb_UsqFyA9L-YV_MRQZE',
    appId: '1:273383696499:ios:fa3ed0adbc05a9e22ea206',
    messagingSenderId: '273383696499',
    projectId: 'trung-tam-353af',
    storageBucket: 'trung-tam-353af.appspot.com',
    iosClientId: '273383696499-elamtpa2a83hn7r3llu5et2ugeo366ld.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterStudentManager',
  );
}