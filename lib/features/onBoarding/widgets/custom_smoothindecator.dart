import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/onBoarding/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothindecator extends StatelessWidget {
  const CustomSmoothindecator({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: OnboardingModel.pages.length,
      effect: const ExpandingDotsEffect(
        dotHeight: 7,
        dotWidth: 7,
        activeDotColor: ColorManager.goldColor,
      ),
    );
  }
}
