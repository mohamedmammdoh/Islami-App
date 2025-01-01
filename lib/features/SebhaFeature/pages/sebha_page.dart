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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 200),
          const Text(
            textAlign: TextAlign.center,
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: StylesManager.textStyles36White,
          ),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: incrementCounter,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    AssestsManager.sebhaRoatated,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    duas[currentDuaIndex],
                    style: StylesManager.textStyles36White,
                  ),
                  const SizedBox(height: 10),
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
