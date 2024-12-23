import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/layout/pages/layout_page.dart';
import 'package:islamiapp/features/onBoarding/models/onboarding_model.dart';
import 'package:islamiapp/features/onBoarding/widgets/custom_pageviewbuilder.dart';
import 'package:islamiapp/features/onBoarding/widgets/custom_smoothindecator.dart';
import 'package:islamiapp/features/onBoarding/widgets/custom_textbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGray,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(AssestsManager.appBarBg),
              )),
          Align(
              child: CustomPageviewbuilder(
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  controller: _pageController)),
          Visibility(
            visible: _currentIndex == 0 ? false : true,
            child: CustomTextButton(
              onPressed: goToPreviousPage,
              text: 'Back',
              alignment: Alignment.bottomLeft,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CustomSmoothindecator(pageController: _pageController),
            ),
          ),
          CustomTextButton(
            onPressed: goToNextPage,
            text: 'Next',
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }

  void goToPreviousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToNextPage() async {
    if (_currentIndex < OnboardingModel.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasSeenOnboarding', true);
    }
    if (_currentIndex == OnboardingModel.pages.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        LayoutPage.routeName,
      );
    }
  }
}
