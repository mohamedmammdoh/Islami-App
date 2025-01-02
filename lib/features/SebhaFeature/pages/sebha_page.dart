import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/styles_manager.dart';

class SebhaPage extends StatefulWidget {
  const SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  int counter = 0;
  int currentDuaIndex = 0;
  double rotationAngle = 0;
  void rotateImage() {
    setState(() {
      rotationAngle += 90 * 3.14159 / 180;
    });
  }

  final List<String> duas = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'اللهم صلِّ على محمد',
  ];

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter == 30) {
        counter = 0;
        currentDuaIndex = (currentDuaIndex + 1) % duas.length;
      }
      rotateImage();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQurey = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: mediaQurey.height * 0.24),
          const Text(
            textAlign: TextAlign.center,
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: StylesManager.textStyles36White,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: incrementCounter,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 380,
                      height: 470, //450,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssestsManager.sebhaRoatated))),
                      child: Image.asset(
                        alignment: Alignment.topCenter,
                        AssestsManager.sebhaaa,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    duas[currentDuaIndex],
                    style: StylesManager.textStyles36White,
                  ),
                  SizedBox(height: mediaQurey.height * 0.03),
                  Text(
                    counter.toString(),
                    style: StylesManager.textStyles36White,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
