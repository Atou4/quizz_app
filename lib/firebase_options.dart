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
    apiKey: 'AIzaSyCGH5XCrOx4AHn4kqYb7zKRkuT3NfEWOCs',
    appId: '1:725991535297:web:1e6b05ab7d2188403b1a40',
    messagingSenderId: '725991535297',
    projectId: 'quizzy-4352c',
    authDomain: 'quizzy-4352c.firebaseapp.com',
    storageBucket: 'quizzy-4352c.appspot.com',
    measurementId: 'G-E23CK5YM7E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAU2GOcHJMkXk32nE5LpcaQqCIpDCOzlpc',
    appId: '1:725991535297:android:89d0b1965e146bb73b1a40',
    messagingSenderId: '725991535297',
    projectId: 'quizzy-4352c',
    storageBucket: 'quizzy-4352c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDn_1Hcn7VI0ld8lGiwCVHfVwUeNj7SQ_I',
    appId: '1:725991535297:ios:f144652d01df88af3b1a40',
    messagingSenderId: '725991535297',
    projectId: 'quizzy-4352c',
    storageBucket: 'quizzy-4352c.appspot.com',
    iosClientId: '725991535297-odmopg8ecl9d81s5c7bv3ec4efjmjf6i.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizzApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDn_1Hcn7VI0ld8lGiwCVHfVwUeNj7SQ_I',
    appId: '1:725991535297:ios:f144652d01df88af3b1a40',
    messagingSenderId: '725991535297',
    projectId: 'quizzy-4352c',
    storageBucket: 'quizzy-4352c.appspot.com',
    iosClientId: '725991535297-odmopg8ecl9d81s5c7bv3ec4efjmjf6i.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizzApp',
  );
}
