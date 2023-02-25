import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/space.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:bdphysicians/widget/main_button.dart';
import 'package:bdphysicians/widget/secondary_button.dart';
import 'package:bdphysicians/widget/text_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
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
    return Container(
      child: Column(
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
      ),
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
                textField(
                    controller: userName, image: '', hintText: 'First Nmae'),
                textField(
                    controller: lastName, image: '', hintText: 'Last Nmae'),
              ],
            ),
            textField(
                controller: userName,
                image: 'user.svg',
                hintText: 'UserNmae/Email'),
            textField(
                controller: userPhone,
                image: 'phone.svg',
                hintText: 'Phone',
                keyBoardType: TextInputType.phone),
            textField(
                controller: userPass, image: 'pass.svg', hintText: 'Password'),
            const SpaceVH(height: 10.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Mainbutton(
                    onTap: () {},
                    text: 'SIGN UP',
                    btnColor: blueButton,
                    textColor: whiteText,
                  )
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
