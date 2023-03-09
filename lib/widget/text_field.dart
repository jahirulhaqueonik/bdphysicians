import 'package:bdphysicians/core/colors.dart';
import 'package:bdphysicians/core/text_style.dart';
import 'package:flutter/material.dart';

class CustomizedTextField extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  final VoidCallback? onBlur;
  const CustomizedTextField({
    Key? key,
    required this.myController,
    required this.hintText,
    this.isPassword,
    this.onBlur,
    // required IconData prefixIcon,
  }) : super(key: key);
  @override
  _CustomizedTextFieldState createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  bool _isPasswordVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _isPasswordVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
      child: TextField(
        keyboardType: widget.isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: widget.isPassword! ? false : true,
        autocorrect: widget.isPassword! ? false : true,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.myController,
        obscureText: _isPasswordVisible && widget.isPassword! ? false : true,
        focusNode: _focusNode,
        decoration: InputDecoration(
          suffix: widget.isPassword!
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: hintStyle,
        ),
        style: headline2,
        // onTap: () {
        //   if (widget.isPassword! && _isPasswordVisible) {
        //     setState(() {
        //       _isPasswordVisible = !_isPasswordVisible;
        //     });
        //   }
        // },
        // onEditingComplete: widget.onBlur,
        // onSubmitted: (value) {
        //   if (widget.isPassword! && _isPasswordVisible) {
        //     setState(() {
        //       _isPasswordVisible = !_isPasswordVisible;
        //     });
        //   }
        // },
      ),
    );
  }
}
