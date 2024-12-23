import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/onBoarding/models/onboarding_model.dart';

class CustomPageviewbuilder extends StatelessWidget {
  const CustomPageviewbuilder(
      {super.key, required this.onPageChanged, required this.controller});
  final void Function(int)? onPageChanged;
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: OnboardingModel.pages.length,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Image.asset(OnboardingModel.pages[index].image),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            OnboardingModel.pages[index].text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorManager.goldColor,
              fontSize: 24,
              fontFamily: 'Janaa',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            textAlign: TextAlign.center,
            OnboardingModel.pages[index].description,
            style: const TextStyle(
              color: ColorManager.goldColor,
              fontSize: 20,
              fontFamily: 'Janaa',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}