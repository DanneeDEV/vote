import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjia1PaDM_zylS5HFLP-iLggQIoNipTN0",
            authDomain: "vote-ssn8ol.firebaseapp.com",
            projectId: "vote-ssn8ol",
            storageBucket: "vote-ssn8ol.appspot.com",
            messagingSenderId: "35514987069",
            appId: "1:35514987069:web:ccc3413212414b0a80f054"));
  } else {
    await Firebase.initializeApp();
  }
}
