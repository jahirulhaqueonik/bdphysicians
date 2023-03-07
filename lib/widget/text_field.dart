import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomizedTextField extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  const CustomizedTextField({
    Key? key,
    required this.myController,
    required this.hintText,
    this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: whiteTextFild,
        borderRadius: BorderRadius.circular(25.0),
      ),
      // child: (
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //  children: [
      // SizedBox(
      //  width: 250.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: myController,
        obscureText: isPassword ?? true,
        decoration: InputDecoration(
          suffixIcon: isPassword!
              ? IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {},
                )
              : null,
          border: InputBorder.none,
          // filled: true,
          hintText: hintText,
          hintStyle: hintStyle,
        ),
        style: headline2,
        //   ),
        //  ),
        // SvgPicture.asset(
        //   'assets/icon/$image',
        //   height: 20.0,
        //   //color: grayText,
        // )
        //   ],
      ),
    );
  }
}
