import 'package:bdphysicians/core/style.dart';
import 'package:bdphysicians/firebase_options.dart';
import 'package:bdphysicians/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BD Physicians',
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(),
      home: const HomePage(),
    );
  }
}
