import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/core/styles_manager.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: ColorManager.white,
      style: StylesManager.textStyle16WG,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: ColorManager.goldColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: ColorManager.goldColor,
          ),
        ),
        prefixIcon: ImageIcon(
          AssetImage(AssestsManager.quranIcn),
          color: ColorManager.goldColor,
        ),
        hintText: 'Sura Name',
        hintStyle: StylesManager.textStyle16WG,
      ),
    );
  }
}
