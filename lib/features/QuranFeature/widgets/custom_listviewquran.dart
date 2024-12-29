import 'package:flutter/material.dart';
import 'package:islamiapp/features/QuranFeature/models/sura_model.dart';
import 'package:islamiapp/features/QuranFeature/widgets/custom_divider.dart';
import 'package:islamiapp/features/QuranFeature/widgets/sura_item.dart';

class CustomListviewquran extends StatelessWidget {
  const CustomListviewquran({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) => SuraItem(index: index),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: SuraModel.ayaNumber.length,
      ),
    );
  }
}
