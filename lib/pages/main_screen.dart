import 'package:bdphysicians/auth_controller.dart';
import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/pages/login_page.dart';
import 'package:bdphysicians/widget/customized_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => {
                      AuthController().logedOut(),
                    },
                child: const CustomizedButton(
                  buttonText: "Sign Out",
                  btnColor: blueButton,
                  textColor: whiteText,
                ))
          ],
        ),
      ),
    );
  }
}
