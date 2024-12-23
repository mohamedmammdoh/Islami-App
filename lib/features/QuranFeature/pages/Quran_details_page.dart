import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/QuranFeature/models/sura_model.dart';

class QuranDetails extends StatelessWidget {
  const QuranDetails({super.key});
  static const String routeName = '/Quran_Details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args.suraNameEn,
          style: const TextStyle(
            fontSize: 20,
            color: ColorManager.goldColor,
            fontFamily: 'Janaa',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssestsManager.groupBg,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              args.suraNameAr,
              style: const TextStyle(
                fontSize: 24,
                color: ColorManager.goldColor,
                fontFamily: 'Janaa',
              ),
            ),
          )
        ],
      ),
    );
  }

  readQuran() {}
}
