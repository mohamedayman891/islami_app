import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/azkar_dm.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/home/time/widget/azkar_card.dart';
import 'package:islami_app/features/home/time/widget/prayer_time_builder.dart';

class TimeTap extends StatefulWidget {
  const TimeTap({super.key});

  @override
  State<TimeTap> createState() => _TimeTapState();
}

class _TimeTapState extends State<TimeTap> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesTimeBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              Assets.imagesIslamiLogo,
              height: size.height * 0.2,
              width: double.infinity,
            ),
            SizedBox(
              height: size.height * 0.33,
              child: const PrayerTimeBuilder(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("Azkar", style: AppStyles.bold20White)],
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AzkarDM.azkarCategories.length,
                itemBuilder: (context, index) {
                  return AzkarCard(azkarDM: AzkarDM.azkarCategories[index]);
                },
              ),
            ),
            // const SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
