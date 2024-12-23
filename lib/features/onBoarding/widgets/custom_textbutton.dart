import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.alignment});
  final void Function()? onPressed;
  final String text;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: ColorManager.goldColor,
          ),
        ),
      ),
    );
  }
}
