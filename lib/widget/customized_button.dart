import 'package:bdphysicians/core/text_style.dart';
import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? btnColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CustomizedButton({
    Key? key,
    this.buttonText,
    this.btnColor,
    this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          // width: 320,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              buttonText!,
              style: textColor != null
                  ? headline2.copyWith(color: textColor)
                  : headline2,
            ),
          ),
        ),
      ),
    );
  }
}
