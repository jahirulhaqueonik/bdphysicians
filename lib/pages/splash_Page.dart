import 'dart:async';

import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/space.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:bdphysicians/pages/login_page.dart';
import 'package:bdphysicians/widget/main_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
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
                SpaceVH(height: 20.0),
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
