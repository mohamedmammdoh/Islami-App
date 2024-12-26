import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';

class RadioContent extends StatefulWidget {
  const RadioContent({super.key});

  @override
  State<RadioContent> createState() => _RadioContentState();
}

class _RadioContentState extends State<RadioContent> {
  List<bool> isMutedList = List.generate(30, (index) => false);
  List<bool> isPlayedList = List.generate(30, (index) => false);
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) => Container(
        height: mediaQuery.height * 0.17,
        decoration: BoxDecoration(
          color: ColorManager.goldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Radio Ibrahim Al-Akdar',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isPlayedList[index] = !isPlayedList[index];
                      });
                    },
                    icon: Icon(
                      isPlayedList[index] ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: ColorManager.darkGray,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isMutedList[index] =
                            !isMutedList[index]; // تغيير الحالة للعنصر الحالي
                      });
                    },
                    icon: Icon(
                      isMutedList[index]
                          ? Icons.volume_off_outlined
                          : Icons.volume_up_rounded,
                      size: 32,
                      color: ColorManager.darkGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: isMutedList.length,
    );
  }
}
