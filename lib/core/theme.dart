import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';

class ThemeManager {
  static ThemeData theme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.goldColor,
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.darkGray,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontFamily: 'Janaa'),
    ),
    scaffoldBackgroundColor: ColorManager.transperent,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.darkGray,
      iconTheme: IconThemeData(
        color: ColorManager.goldColor,
      ),
    ),
    fontFamily: 'Janaa',
  );
}
