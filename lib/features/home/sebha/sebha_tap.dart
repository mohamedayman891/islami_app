import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "صلي على رسول لله",
  ];
  int count = 0;
  int showZekr = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesSebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: Image.asset(Assets.imagesIslamiLogo)),
          Expanded(
            flex: 1,
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: AppStyles.bold36White,
            ),
          ),
          Expanded(
            flex: 7,
            child: InkWell(
              onTap: () {
                setState(() {
                  angle += 0.03;
                  count++;
                  if (count == 33) {
                    count = 0;
                    if (showZekr < azkar.length - 1) {
                      showZekr++;
                    } else {
                      showZekr = 0;
                    }
                  }
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedRotation(
                    turns: angle,
                    duration: Duration(milliseconds: 200),
                    child: Image.asset(Assets.imagesSebha),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(azkar[showZekr], style: AppStyles.bold36White),
                      Text("$count", style: AppStyles.bold36White),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
