import 'dart:io';
import 'package:app/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyC4dqDLfQHEOUC3H-cD-ggp_ibze6WQqOo',
              appId: '1:658512394722:android:fb9fc5dfe8efbce7d861bb',
              messagingSenderId: '658512394722',
              projectId: 'signin-example-47df8',
              storageBucket: 'gs://signin-example-47df8.appspot.com'),
        )
      : await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignInScreen());
  }
}
