import 'package:flutter/material.dart';
import 'package:islamiapp/features/QuranFeature/widgets/custom_mostrecentlycard.dart';

class CustomListViewMostRecently extends StatelessWidget {
  const CustomListViewMostRecently({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const CustomMostrecentlycard(),
      ),
    );
  }
}
