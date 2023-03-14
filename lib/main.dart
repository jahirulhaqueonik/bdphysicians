import 'package:bdphysicians/auth_controller.dart';
import 'package:bdphysicians/constants/style.dart';
import 'package:bdphysicians/screen/login_screen.dart';
import 'package:bdphysicians/screen/main_screen.dart';
import 'package:bdphysicians/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BD Physicians',
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
 // stream: FirebaseAuth.instance.authStateChanges(),
        // builder: (context, snapshot) {
        //   if (snapshot.hasData) {
        //     return const MainScreen();
        //   } else {
        //     return const LoginPage();
        //   }
        // },