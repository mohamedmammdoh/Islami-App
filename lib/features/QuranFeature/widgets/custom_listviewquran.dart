import 'package:flutter/material.dart';
import 'package:islamiapp/core/assests_manager.dart';
import 'package:islamiapp/core/color_manager.dart';
import 'package:islamiapp/features/QuranFeature/models/sura_model.dart';
import 'package:islamiapp/features/QuranFeature/pages/Quran_details_page.dart';

class CustomListviewquran extends StatelessWidget {
  const CustomListviewquran({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              QuranDetails.routeName,
              arguments: SuraModel.getSuraModel(index: index),
            );
          },
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AssestsManager.suraNumber),
                  Text(
                    '${index + 1}',
                    style: const TextStyle(
                        color: ColorManager.white,
                        fontSize: 20,
                        fontFamily: 'Janaa'),
                  ),
                ],
              ),
              SizedBox(width: mediaQuery.width * 0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SuraModel.englishQuranSurahs[index],
                    style: const TextStyle(
                      color: ColorManager.white,
                      fontFamily: 'Janaa',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${SuraModel.ayaNumber[index]} verses',
                    style: const TextStyle(
                      color: ColorManager.white,
                      fontFamily: 'Janaa',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                SuraModel.arabicAuranSuras[index],
                style: const TextStyle(
                  color: ColorManager.white,
                  fontFamily: 'Janaa',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: ColorManager.white,
          endIndent: 50,
          indent: 50,
          thickness: 1.5,
        ),
        itemCount: SuraModel.ayaNumber.length,
      ),
    );
  }
}
