import 'package:islamiapp/core/assests_manager.dart';

class OnboardingModel {
  final String text;
  final String description;
  final String image;
  OnboardingModel(
      {required this.image, required this.text, required this.description});

  static List<OnboardingModel> pages = [
    OnboardingModel(
      image: AssestsManager.tar3ebOnBoarding,
      text: 'Welcome To Islmi App',
      description: '',
    ),
    OnboardingModel(
      image: AssestsManager.game3OnBoarding,
      text: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingModel(
      image: AssestsManager.mos7afOnBoarding,
      text: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      image: AssestsManager.do3aaOnBoarding,
      text: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      image: AssestsManager.radioOnBoarding,
      text: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
