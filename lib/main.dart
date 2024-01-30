import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Ui/Navigator/MainNavigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDfYLfAUSEF6xDR6ABunYlUbr9C8M-OXVI',
        appId: '1:817339218625:android:c4db60edbdc4a9d398f240',
        messagingSenderId: '817339218625' ,
        projectId: 'testui-11a5e',
        storageBucket: 'testui-11a5e.appspot.com',)
  ) : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainNavigator().initialRoute,
      routes: MainNavigator().routes,
    );
  }
}
