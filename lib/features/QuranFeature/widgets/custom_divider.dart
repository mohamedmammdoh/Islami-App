import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorManager.white,
      endIndent: 50,
      indent: 50,
      thickness: 1.5,
    );
  }
}
