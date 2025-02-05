import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDRwKE1NSc879KndA3UmNYsqPeKE919Ajw",
            authDomain: "achei-no-jarbas-6060c.firebaseapp.com",
            projectId: "achei-no-jarbas-6060c",
            storageBucket: "achei-no-jarbas-6060c.firebasestorage.app",
            messagingSenderId: "550245684375",
            appId: "1:550245684375:web:747c1e26973e8a65f245d2",
            measurementId: "G-Q5KPENGCVK"));
  } else {
    await Firebase.initializeApp();
  }
}
