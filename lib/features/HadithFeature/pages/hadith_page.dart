import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/core/styles_manager.dart';
import 'package:islamiapp/features/HadithFeature/models/hadeth_model.dart';

class HadithPage extends StatefulWidget {
  const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  List<HadethModel> hadethList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    readHadethContent();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                // Show loading indicator while data is loading
                child: CircularProgressIndicator(
                  color: ColorManager.goldColor,
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 140),
                  CarouselSlider.builder(
                    itemCount: hadethList.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          color: ColorManager.goldColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(AssestsManager.cornerRight),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Image.asset(AssestsManager.cornerLeft),
                              ),
                              Align(
                                child: Image.asset(
                                  AssestsManager.hadethBG,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: ListView(
                                  children: [
                                    Text(
                                      hadethList[index].hadethName,
                                      textAlign: TextAlign.center,
                                      style: StylesManager.textStyles24bold,
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        hadethList[index]
                                            .hadethContent
                                            .join(''),
                                        textAlign: TextAlign.center,
                                        style:
                                            StylesManager.textStyle16darkGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 550,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  readHadethContent() async {
    for (var i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assests/Hadeeth/h$i.txt');
      List<String> hadethVerses = hadethContent.split('\n');
      String title = hadethVerses[0];
      hadethVerses.removeAt(0);
      HadethModel hadethModel =
          HadethModel(hadethName: title, hadethContent: hadethVerses);
      hadethList.add(hadethModel);
    }
    setState(() {
      isLoading = false;
    });
  }
}
