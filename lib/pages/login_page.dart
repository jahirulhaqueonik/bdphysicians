import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/space.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:bdphysicians/pages/signup_page.dart';
import 'package:bdphysicians/widget/main_button.dart';
import 'package:bdphysicians/widget/password_textfield.dart';
import 'package:bdphysicians/widget/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  final bool _rememberMe = false;

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
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
            textField(
                controller: userName,
                image: 'user.svg',
                hintText: 'UserName/email'),
            passField(controller: userPass, hintText: 'Password'),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Mainbutton(
                    onTap: () {},
                    text: 'SIGN IN',
                    btnColor: blueButton,
                    textColor: whiteText,
                  )
                ],
              ),
            ),
            const SpaceVH(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignUpPage()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Do not have an account?',
                    style: headline1.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                  TextSpan(
                      text: 'Sign Up',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
