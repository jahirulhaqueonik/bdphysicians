import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:flutter/material.dart';

bool isObs = true;

Widget passField({
  required String hintText,
  required TextEditingController controller,
  TextInputType? keyBoardType,
}) {
  return Container(
    height: 60.0,
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    margin: const EdgeInsets.symmetric(
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
        SizedBox(
          width: 200.0,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBoardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
              suffixIcon: const InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  Icons.visibility,
                ),
              ),
              //    contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            style: headline2,
          ),
        ),
      ],
    ),
  );
}

void _togglePasswordView() {
  if (isObs == true) {
    isObs = false;
  } else {
    isObs = true;
  }
}
