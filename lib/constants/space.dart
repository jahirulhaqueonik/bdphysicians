import 'package:flutter/material.dart';

class SpaceVH extends StatelessWidget {
  // const SpaceVH({super.key});
  final double? width;
  final double? height;
  const SpaceVH({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0.0,
      width: width ?? 0.0,
    );
  }
}
