import 'package:bdphysicians/pages/login_page.dart';
import 'package:bdphysicians/pages/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //AuthController.instance..
  static AuthController instance = Get.find();

  //email, password, name...
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  get user => null;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user will be notifieded when user changes
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => const LoginPage());
    } else {
      print("Welcome Page");
      Get.offAll(() => const MainScreen());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10.0),
        titleText: const Text(
          "Account Creation Failed",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        messageText: const Text(
          "Require Email or Password",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10.0),
        titleText: const Text(
          "Login Failed",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        messageText: const Text(
          "Incorrect Email or Password",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  void logedOut() async {
    await auth.signOut();
  }
}
