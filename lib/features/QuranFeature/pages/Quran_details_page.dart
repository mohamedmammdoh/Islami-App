import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/core/styles_manager.dart';
import 'package:islamiapp/features/QuranFeature/models/sura_model.dart';

class QuranDetails extends StatelessWidget {
  const QuranDetails({super.key});
  static const String routeName = '/Quran_Details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return Scaffold(
      backgroundColor: ColorManager.darkGray,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args.suraNameEn,
          style: StylesManager.textStyle16Primary,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                args.suraNameAr,
                style: StylesManager.textStyle24Primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  readQuran() {}
}
