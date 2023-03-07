import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  final Function? onPressed;
  final String text;
  final String? images;
  final Color? textColor;
  final Color btnColor;
  const Mainbutton({
    Key? key,
    this.onPressed,
    required this.text,
    this.images,
    this.textColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: blueButton,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (images != null)
              Image.asset(
                'assets/images/$images',
                height: 25.0,
                width: 60.0,
              ),
            Text(
              text,
              style: textColor != null
                  ? headline2.copyWith(color: textColor)
                  : headline2,
            )
          ],
        ),
      ),
    );
  }
}
