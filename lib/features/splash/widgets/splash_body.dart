import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/features/layout/pages/layout_page.dart';
import 'package:islamiapp/features/onBoarding/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  bool _isFirstTime = true;
  @override
  void initState() {
    GoToOnBoardingPage();
    _checkFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssestsManager.backgroundSplash,
          ),
        ),
      ),
      child: Stack(
        children: [
          FadeInDown(
            child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(AssestsManager.lampaSplash)),
          ),
          FadeInDown(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Image.asset(AssestsManager.game3Top),
              ),
            ),
          ),
          FadeInDownBig(
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(AssestsManager.centerLogoSplash)),
          ),
          FadeInRight(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Image.asset(AssestsManager.shapeRight),
              ),
            ),
          ),
          FadeInLeft(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.3),
                child: Image.asset(AssestsManager.shapeLeft),
              ),
            ),
          ),
          FadeInUp(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.04),
                child: Image.asset(AssestsManager.bottomSplash),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void GoToOnBoardingPage() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context,
          _isFirstTime ? OnBoardingPage.routeName : LayoutPage.routeName),
    );
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {
      setState(() {
        _isFirstTime = false;
      });
    }
  }
}
