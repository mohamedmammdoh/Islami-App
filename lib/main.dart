import 'package:flutter/material.dart';
import 'package:islamiapp/core/theme.dart';
import 'package:islamiapp/features/QuranFeature/pages/Quran_details_page.dart';
import 'package:islamiapp/features/layout/pages/layout_page.dart';
import 'package:islamiapp/features/onBoarding/pages/onboarding_page.dart';
import 'package:islamiapp/features/splash/pages/splash_page.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      theme: ThemeManager.theme,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        OnBoardingPage.routeName: (context) => const OnBoardingPage(),
        LayoutPage.routeName: (context) => const LayoutPage(),
        QuranDetails.routeName: (context) => const QuranDetails(),
      },
    );
  }
}
