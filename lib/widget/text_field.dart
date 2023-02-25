import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget textField({
  required String hintText,
  required String image,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBoardType,
}) {
  return Container(
    height: 60.0,
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 5.0,
    ),
    decoration: BoxDecoration(
      color: whiteTextFild,
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200.0,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBoardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
            ),
            style: headline2,
          ),
        ),
        SvgPicture.asset(
          'assets/icon/$image',
          height: 20.0,
          //color: grayText,
        )
      ],
    ),
  );
}
