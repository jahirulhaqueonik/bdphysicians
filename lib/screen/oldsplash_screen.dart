import 'package:bdphysicians/screen/login_screen.dart';
import 'package:bdphysicians/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bdphysicians/constants/space.dart';
import 'package:bdphysicians/constants/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 50)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    });

    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const LoginPage(),
    //       ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png'),
                const SpaceVH(height: 20.0),
                const Text(
                  'Welcome To BD Physicians',
                  style: headline1,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Text(
              'Developed by appsus.io v1.0',
              textAlign: TextAlign.center,
              style: hintStyle,
            ),
          ),
        ],
      ),
    );
  }
}
