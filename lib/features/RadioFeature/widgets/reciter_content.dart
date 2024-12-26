import 'package:flutter/material.dart';
import 'package:islamiapp/core/color_manager.dart';

class ReciterContent extends StatefulWidget {
  const ReciterContent({super.key});

  @override
  State<ReciterContent> createState() => _ReciterContentState();
}

class _ReciterContentState extends State<ReciterContent> {
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
                  'Ibrahim Al-Akdar',
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
                        isMutedList[index] = !isMutedList[index];
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
