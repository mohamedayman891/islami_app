import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/api/api_manager.dart';
import 'package:islami_app/core/model/prayer_times_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/data_formatter.dart';
import 'package:islami_app/features/home/time/widget/next_prayer_timer.dart';

class PrayerTimeBuilder extends StatefulWidget {
  const PrayerTimeBuilder({super.key});

  @override
  State<PrayerTimeBuilder> createState() => _PrayerTimeBuilderState();
}

class _PrayerTimeBuilderState extends State<PrayerTimeBuilder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: ApiManager.getPrayer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Something went wrong"),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getPrayer();
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        PrayerTimesDM data = snapshot.data!;
        Map<String, dynamic> prayerTimes = DataFormatter.sortPrayerTimes(
          data.data!.timings!.toJson(),
        );
        Map<String, dynamic> prayerCountDown =
            DataFormatter.getNextPrayerCountDown(prayerTimes);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.brownColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.imagesPrayTime),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 10,
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DataFormatter.formateGregorian(
                        data.data!.date!.gregorian!,
                      ),
                      style: AppStyles.bold16White,
                    ),
                    Column(
                      children: [
                        Text(
                          "Prayer Time",
                          style: AppStyles.bold20White.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        Text(
                          data.data!.date!.gregorian!.weekday!.en!,
                          style: AppStyles.bold16White.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DataFormatter.formateHijri(data.data!.date!.hijri!),
                      style: AppStyles.bold16White,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: size.height * 0.15,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.15,
                      viewportFraction: 0.25,
                    ),
                    itemCount: prayerTimes.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: 95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.backgroundColor,
                              AppColors.goldColor,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              prayerTimes.keys.elementAt(index).toString(),
                              style: AppStyles.bold16White,
                            ),
                            Text(
                              DataFormatter.formateTime(
                                prayerTimes.values.elementAt(index).toString(),
                              ),
                              style: AppStyles.bold20White,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  NextPrayerTimer(
                    timeRemaining: prayerCountDown[prayerTimes.keys.first],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
