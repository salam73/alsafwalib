// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:fire
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
      /*apiKey: 'AIzaSyCsLjjiVtrNztAojGjGPe2hQlWIisud8r4',
    appId: '1:882135383969:web:0b4e9c93fe87477e6495e0',
    messagingSenderId: '882135383969',
    projectId: 'iraq-yellow-pages',
    authDomain: 'iraq-yellow-pages.firebaseapp.com',
    databaseURL: 'https://iraq-yellow-pages.firebaseio.com',
    storageBucket: 'iraq-yellow-pages.appspot.com',
    measurementId: 'G-TREH976YJN',
*/

      apiKey: "AIzaSyCsLjjiVtrNztAojGjGPe2hQlWIisud8r4",
      authDomain: "iraq-yellow-pages.firebaseapp.com",
      databaseURL: "https://iraq-yellow-pages.firebaseio.com",
      projectId: "iraq-yellow-pages",
      storageBucket: "iraq-yellow-pages.appspot.com",
      messagingSenderId: "882135383969",
      appId: "1:882135383969:web:85193d17d38c21d56495e0",
      measurementId: "G-N0GDKKMDGN"

      /* apiKey: "AIzaSyDp7pksy1VtC383QNrLBXM4p2vTO0a14O8",
      authDomain: "almerro-be66e.firebaseapp.com",
      databaseURL: 'almerro-be66e.firebaseapp.firebaseio.com',
      projectId: "almerro-be66e",
      storageBucket: "almerro-be66e.appspot.com",
      messagingSenderId: "498327141371",
      appId: "1:498327141371:web:fa3b124d0017fa317fe95e",
      measurementId: "G-9J2SV9S7YQ"*/
      );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7ODbc1-ob0ssnZxmEfR3x9KBX-rKrKeE',
    appId: '1:882135383969:android:c1f985644bebf88f6495e0',
    messagingSenderId: '882135383969',
    projectId: 'iraq-yellow-pages',
    databaseURL: 'https://iraq-yellow-pages.firebaseio.com',
    storageBucket: 'iraq-yellow-pages.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR5xoIKSsjxu2GqaHnnKVCXds1HKa4jak',
    appId: '1:882135383969:ios:2aa224a273a5c9986495e0',
    messagingSenderId: '882135383969',
    projectId: 'iraq-yellow-pages',
    databaseURL: 'https://iraq-yellow-pages.firebaseio.com',
    storageBucket: 'iraq-yellow-pages.appspot.com',
    androidClientId:
        '882135383969-b2e4gfr24mpmqmrqft1bnk95h6bpgq6t.apps.googleusercontent.com',
    iosClientId:
        '882135383969-gi5abeho270f1c8pcj5ttd3dcqtlfs6g.apps.googleusercontent.com',
    iosBundleId: 'com.alsafwa.lib.alsafwalib',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR5xoIKSsjxu2GqaHnnKVCXds1HKa4jak',
    appId: '1:882135383969:ios:2aa224a273a5c9986495e0',
    messagingSenderId: '882135383969',
    projectId: 'iraq-yellow-pages',
    databaseURL: 'https://iraq-yellow-pages.firebaseio.com',
    storageBucket: 'iraq-yellow-pages.appspot.com',
    androidClientId:
        '882135383969-b2e4gfr24mpmqmrqft1bnk95h6bpgq6t.apps.googleusercontent.com',
    iosClientId:
        '882135383969-gi5abeho270f1c8pcj5ttd3dcqtlfs6g.apps.googleusercontent.com',
    iosBundleId: 'com.alsafwa.lib.alsafwalib',
  );
}
