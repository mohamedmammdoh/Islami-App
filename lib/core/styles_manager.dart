import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';

class StylesManager {
  static const TextStyle textStyle20BoldPrimary = TextStyle(
    fontSize: 20,
    color: ColorManager.goldColor,
    fontFamily: 'Janaa',
    fontWeight: FontWeight.w700,
  );
  static const textStyle16WG = TextStyle(
    color: ColorManager.whiteGld,
    fontFamily: 'Janaa',
    fontSize: 16,
  );
  static const textStyle16Primary = TextStyle(
    color: ColorManager.goldColor,
    fontFamily: 'Janaa',
    fontSize: 16,
  );
  static const textStyle16darkGray = TextStyle(
      color: ColorManager.darkGray,
      fontFamily: 'Janaa',
      fontSize: 16,
      fontWeight: FontWeight.bold);

  static const textStyle24Primary = TextStyle(
    fontSize: 24,
    color: ColorManager.goldColor,
    fontFamily: 'Janaa',
  );
  static const textStyles20White = TextStyle(
    color: ColorManager.white,
    fontSize: 20,
    fontFamily: 'Janaa',
  );
  static const textStyles14White = TextStyle(
    color: ColorManager.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Janaa',
  );
  static const textStyles24bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Janaa',
  );
  static const textStyles36White = TextStyle(
    color: ColorManager.white,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: 'Janaa',
  );
}
