import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      print("🦊This is Web");
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        print("🦊This is Android");
        return android;
      case TargetPlatform.iOS:
        print("🐹This is iOS");
        return ios;
      case TargetPlatform.macOS:
        print("🐝This is macOS");
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
        print("🐯Not supported");
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD2DcWvX9mT1RLecqMBlzXN9VpmZuk91Gs',
    appId: '1:661701596572:web:1f60660d790175e1fd6459',
    messagingSenderId: '661701596572',
    projectId: 'pwatesting-29f3c',
    authDomain: 'pwatesting-29f3c.firebaseapp.com',
    databaseURL: 'https://pwatesting-29f3c.firebaseio.com',
    storageBucket: 'pwatesting-29f3c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2DcWvX9mT1RLecqMBlzXN9VpmZuk91Gs',
    appId: '1:661701596572:web:1f60660d790175e1fd6459',
    messagingSenderId: '661701596572',
    projectId: 'pwatesting-29f3c',
    authDomain: 'pwatesting-29f3c.firebaseapp.com',
    databaseURL: 'https://pwatesting-29f3c.firebaseio.com',
    storageBucket: 'pwatesting-29f3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2DcWvX9mT1RLecqMBlzXN9VpmZuk91Gs',
    appId: '1:661701596572:web:1f60660d790175e1fd6459',
    messagingSenderId: '661701596572',
    projectId: 'pwatesting-29f3c',
    authDomain: 'pwatesting-29f3c.firebaseapp.com',
    databaseURL: 'https://pwatesting-29f3c.firebaseio.com',
    storageBucket: 'pwatesting-29f3c.appspot.com',
    androidClientId:
    '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
    iosClientId:
    '406099696497-irb7edfevfkhi6t5s9kbuq1mt1og95rg.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDooSUGSf63Ghq02_iIhtnmwMDs4HlWS6c',
    appId: '1:406099696497:ios:1b423b89c63b82053574d0',
    messagingSenderId: '406099696497',
    projectId: 'flutterfire-e2e-tests',
    databaseURL:
    'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterfire-e2e-tests.appspot.com',
    androidClientId:
    '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
    iosClientId:
    '406099696497-irb7edfevfkhi6t5s9kbuq1mt1og95rg.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );
}
