import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/HadithFeature/pages/hadith_page.dart';
import 'package:islamiapp/features/QuranFeature/pages/quran_page.dart';
import 'package:islamiapp/features/RadioFeature/pages/radio_page.dart';
import 'package:islamiapp/features/SebhaFeature/pages/sebha_page.dart';
import 'package:islamiapp/features/TimeFeature/pages/time_page.dart';

class LayoutBody extends StatefulWidget {
  const LayoutBody({super.key});

  @override
  State<LayoutBody> createState() => _LayoutBodyState();
}

class _LayoutBodyState extends State<LayoutBody> {
  static int currentIndex = 0;
  List<String> backGrounds = [
    AssestsManager.quranBg,
    AssestsManager.hadethBg,
    AssestsManager.seb7aBg,
    AssestsManager.radioBg,
    AssestsManager.timeBg,
  ];
  List<Widget> pages = [
    const QuranPage(),
    const HadithPage(),
    const SebhaPage(),
    const RadioPage(),
    const TimePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backGrounds[currentIndex]),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(AssestsManager.appBarBg),
              )),
          Scaffold(
            backgroundColor: ColorManager.transperent,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: customBottomNavigationBarItem(
                        index: 0, image: AssestsManager.quranIcn),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: customBottomNavigationBarItem(
                        index: 1, image: AssestsManager.hadethIcn),
                    label: 'Hadith'),
                BottomNavigationBarItem(
                    icon: customBottomNavigationBarItem(
                        index: 2, image: AssestsManager.seb7aaIcn),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: customBottomNavigationBarItem(
                        index: 3, image: AssestsManager.radioIcn),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: customBottomNavigationBarItem(
                        index: 4, image: AssestsManager.timeIcn),
                    label: 'Time'),
              ],
            ),
            body: pages[currentIndex],
          ),
        ],
      ),
    );
  }

  Widget customBottomNavigationBarItem({
    required int index,
    required String image,
  }) {
    var mediaQuery = MediaQuery.of(context).size;
    return currentIndex == index
        ? Container(
            width: mediaQuery.width * 0.17,
            height: mediaQuery.height * 0.034,
            decoration: const BoxDecoration(
                color: ColorManager.bottomNavBarSelectedColor,
                borderRadius: BorderRadius.all(Radius.circular(66))),
            child: ImageIcon(AssetImage(image)),
          )
        : ImageIcon(AssetImage(image));
  }
}
