import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/core/styles_manager.dart';
import 'package:islamiapp/features/QuranFeature/models/sura_model.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});
  static const String routeName = '/Quran_Details';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> quranContent = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (quranContent.isEmpty) {
      readQuranContent(args.index);
    }
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
          ),
          quranContent.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        '[${index + 1}] ${quranContent[index]}',
                        style: StylesManager.textStyle20BoldPrimary,
                      ),
                    ),
                    itemCount: quranContent.length,
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  readQuranContent(int suraNumber) async {
    String suraContent =
        await rootBundle.loadString('assests/files/${suraNumber + 1}.txt');
    List<String> suraVerses = suraContent.split('\n');
    quranContent = suraVerses;
    setState(() {});
  }
}
