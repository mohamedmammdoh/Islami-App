import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/QuranFeature/widgets/custom_listviewmostrecently.dart';
import 'package:islamiapp/features/QuranFeature/widgets/custom_listviewquran.dart';
import 'package:islamiapp/features/layout/widgets/custom_textfield.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: mediaQuery.height * 0.25),
          const CustomTextFiled(),
          SizedBox(height: mediaQuery.height * 0.02),
          const Text(
            'Most Recently',
            style: TextStyle(
              color: ColorManager.whiteGld,
              fontFamily: 'Janaa',
              fontSize: 16,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          const CustomListViewMostRecently(),
          SizedBox(height: mediaQuery.height * 0.02),
          const Text(
            'Suras List',
            style: TextStyle(
              color: ColorManager.whiteGld,
              fontFamily: 'Janaa',
              fontSize: 16,
            ),
          ),
          // ListView.builder(itemBuilder: )
          SizedBox(height: mediaQuery.height * 0.01),
          const CustomListviewquran(),
        ]));
  }
}
