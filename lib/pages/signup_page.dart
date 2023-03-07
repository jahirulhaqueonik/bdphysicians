import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/space.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:bdphysicians/pages/login_page.dart';
import 'package:bdphysicians/services/firebase_auth_service.dart';
import 'package:bdphysicians/widget/customized_button.dart';
import 'package:bdphysicians/widget/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPass = TextEditingController();
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
              myController: userEmail,
              hintText: 'Email',
              isPassword: false,
            ),
            CustomizedTextField(
                myController: userPhone, hintText: 'Phone', isPassword: false),
            CustomizedTextField(
              myController: userPass,
              hintText: 'Password',
              isPassword: true,
            ),
            const SpaceVH(height: 10.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  CustomizedButton(
                      buttonText: 'SIGN UP',
                      btnColor: blueButton,
                      textColor: whiteText,
                      onPressed: () async {
                        try {
                          await FirebaseAuthService().signup(
                              userEmail.text.trim(), userPass.text.trim());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        } on FirebaseException catch (e) {
                          print(e.message);
                        }
                      })
                ],
              ),
            ),
            const SpaceVH(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: headline1.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                  TextSpan(
                      text: 'Sign In',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      )),
                ]),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Column(
            //     children: [
            //       SecondaryButton(
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //         text: 'BACK TO SIGN IN',
            //         btnColor: blueButton,
            //         textColor: blueText,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
