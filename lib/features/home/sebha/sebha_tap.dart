import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> tasbeehList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "صلي على رسول لله",
  ];
  int counter = 0;
  int showTasbeeh = 0;
  double turns = 0;
  void _updateTasbeh() {
    setState(() {
      turns += 0.03;
      counter++;
      if (counter == 33) {
        counter = 0;
        if (showTasbeeh < tasbeehList.length - 1) {
          showTasbeeh++;
        } else {
          showTasbeeh = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesSebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Row(),
                  Image.asset(
                    Assets.imagesSebhaHead,
                    height: size.height * 0.1,
                  ),
                  Positioned.fill(
                    top: size.height * 0.09,
                    child: InkWell(
                      onTap: () {
                        _updateTasbeh();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedRotation(
                            turns: turns,
                            duration: Duration(milliseconds: 200),
                            child: Image.asset(
                              Assets.imagesSebhaBody,
                              width: double.infinity,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tasbeehList[showTasbeeh],
                                style: AppStyles.bold36White,
                              ),
                              Text("$counter", style: AppStyles.bold36White),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
