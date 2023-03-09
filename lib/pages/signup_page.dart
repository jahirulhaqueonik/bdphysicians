import 'package:bdphysicians/auth_controller.dart';
import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/space.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:bdphysicians/pages/login_page.dart';
import 'package:bdphysicians/services/firebase_auth_service.dart';
import 'package:bdphysicians/widget/customized_button.dart';
import 'package:bdphysicians/widget/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController _userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController _userPass = TextEditingController();
  TextEditingController userConfirmPass = TextEditingController();

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Widget _welcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Do not have an account?\nCreate your account',
          style: headline1,
        ),
        SpaceVH(height: 10.0),
        Text(
          'It/s a quick and easy',
          style: subheadline,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 70.0,
        ),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildLogo(),
            const SpaceVH(height: 20.0),
            _welcomeText(),
            const SpaceVH(height: 30.0),
            Column(
              children: [
                CustomizedTextField(
                  myController: firstName,
                  hintText: 'First Nmae',
                  isPassword: false,
                ),
                CustomizedTextField(
                  myController: lastName,
                  hintText: 'Last Nmae',
                  isPassword: false,
                ),
              ],
            ),
            CustomizedTextField(
              myController: _userEmail,
              hintText: 'Email',
              isPassword: false,
            ),
            CustomizedTextField(
                myController: userPhone, hintText: 'Phone', isPassword: false),
            CustomizedTextField(
              myController: _userPass,
              hintText: 'Password',
              isPassword: true,
            ),
            const SpaceVH(height: 10.0),
            GestureDetector(
              onTap: () {
                AuthController.instance.register(
                  _userEmail.text.trim(),
                  _userPass.text.trim(),
                );
              },
              child: const CustomizedButton(
                buttonText: 'SIGN UP',
                btnColor: blueButton,
                textColor: whiteText,
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Column(
            //     children: [
            //       CustomizedButton(
            //           buttonText: 'SIGN UP',
            //           btnColor: blueButton,
            //           textColor: whiteText,
            //           onPressed: () async {
            //             try {
            //               await FirebaseAuthService().signup(
            //                   _userEmail.text.trim(), _userPass.text.trim());
            //               if (!mounted) return;
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => const LoginPage()));
            //             } on FirebaseException catch (e) {
            //               debugPrint(e.message);
            //             }
            //           })
            //     ],
            //   ),
            // ),
            const SpaceVH(height: 10.0),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already Have An Ac count?',
                  style: headline1.copyWith(
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                        text: 'Sign In',
                        style: headlineDot.copyWith(
                          fontSize: 14.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          })
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
