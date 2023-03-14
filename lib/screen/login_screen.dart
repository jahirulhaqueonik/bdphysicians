import 'package:bdphysicians/auth_controller.dart';
import 'package:bdphysicians/constants/colors.dart';
import 'package:bdphysicians/constants/space.dart';
import 'package:bdphysicians/constants/text_style.dart';
import 'package:bdphysicians/screen/main_screen.dart';
import 'package:bdphysicians/screen/signup_screen.dart';
import 'package:bdphysicians/services/firebase_auth_service.dart';
import 'package:bdphysicians/components/customized_button.dart';
import 'package:bdphysicians/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPass = TextEditingController();
  final bool _rememberMe = false;

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
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome to BD Physicians',
            style: headline1,
          ),
          SpaceVH(height: 10.0),
          Text(
            'Before Continue, Please Sign in First.',
            style: subheadline,
          ),
        ],
      ),
    );
  }

  Widget _loginPageImage() {
    return Container(
      alignment: Alignment.center,
      height: 150.0,
      child: Image.asset('assets/images/login_page.png'),
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
            _loginPageImage(),
            const SpaceVH(height: 10.0),
            CustomizedTextField(
              myController: _userEmail,
              hintText: 'abc@example.com',
              isPassword: false,
            ),
            CustomizedTextField(
              myController: _userPass,
              hintText: 'Your Password',
              isPassword: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: subheadline,
                  ),
                ),
              ),
            ),
            const SpaceVH(height: 10.0),
            GestureDetector(
              onTap: () {
                AuthController.instance.login(
                  _userEmail.text.trim(),
                  _userPass.text.trim(),
                );
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: const [
                    CustomizedButton(
                      buttonText: 'SIGN IN',
                      btnColor: blueButton,
                      textColor: whiteText,
                    )
                  ],
                ),
              ),
            ),
            const SpaceVH(height: 10.0),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Don\'t have an account?',
                  style: headline1.copyWith(
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                        text: 'Sign Up',
                        style: headlineDot.copyWith(
                          fontSize: 14.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          })
                  ],
                ),
              ]),
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (builder) => const SignUpPage()));
            //   },
            //   child: RichText(
            //     text: TextSpan(children: [
            //       TextSpan(
            //         text: 'Do not have an account?',
            //         style: headline1.copyWith(
            //           fontSize: 14.0,
            //         ),
            //       ),
            //       TextSpan(
            //           text: 'Sign Up',
            //           style: headlineDot.copyWith(
            //             fontSize: 14.0,
            //           )),
            //     ]),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
