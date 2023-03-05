import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/space.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:bdphysicians/pages/signup_page.dart';
import 'package:bdphysicians/widget/main_button.dart';
import 'package:bdphysicians/widget/text_field.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        width: 360,
        height: 800,
        child: Material(
          color: const Color(0xfffafafa),
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.only(left: 36, top: 30, bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24.22,
                  height: 24.22,
                  child: Material(
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SpaceVH(height: 33.11),
                const SizedBox(
                  width: 290,
                  child: Text(
                    "Type your E-mail/Phone Number, or Username",
                    style: headline1,
                  ),
                ),
                const SpaceVH(height: 33.11),
                const SizedBox(
                  width: 290,
                  height: 30,
                  child: Text(
                    "Help us to find your Account",
                    style: headline2,
                  ),
                ),
                const SpaceVH(height: 33.11),
                Container(
                  width: 283,
                  height: 207,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      Image.asset('assets/images/undraw_forgot_password.png'),
                ),
                const SpaceVH(height: 33.11),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textField(
                        hintText: 'Email Adderess',
                        image: 'user.svg',
                        controller: userEmail),
                    const SpaceVH(height: 33.11),
                    Mainbutton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      text: 'Reset Password',
                      btnColor: blueButton,
                      textColor: whiteText,
                    ),
                  ],
                ),
                const SpaceVH(height: 55.11),
                SizedBox(
                  width: 300,
                  height: 53,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 50,
                        height: 50,
                      ),
                      const SpaceVH(width: 10.0),
                      const Text(
                        'BD PHYSICIANS',
                        style: bdtitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
