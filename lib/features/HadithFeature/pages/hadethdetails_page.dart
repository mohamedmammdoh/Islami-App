import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/core/styles_manager.dart';
import 'package:islamiapp/features/HadithFeature/models/hadeth_model.dart';

class HadethDetailsPage extends StatelessWidget {
  const HadethDetailsPage({super.key});
  static const String routeName = 'HadethDetailsPage';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorManager.darkGray,
      appBar: AppBar(
        title: Text(
          'Hadeth ${args.index + 1}',
          style: StylesManager.textStyle20BoldPrimary,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AssestsManager.groupBg,
            width: double.infinity,
            height: double.infinity,
            // fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Text(
                  args.hadethName,
                  style: StylesManager.textStyle20BoldPrimary,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      args.hadethContent.join(''),
                      textAlign: TextAlign.center,
                      style: StylesManager.textStyle16Primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
