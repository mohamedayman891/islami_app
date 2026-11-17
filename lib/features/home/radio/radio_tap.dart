import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/api/api_manager.dart';
import 'package:islami_app/core/model/radio_response_dm.dart';
import 'package:islami_app/core/model/reciter_response_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/home/radio/widget/radio_item.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesRadioBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Image.asset(Assets.imagesIslamiLogo, height: size.height * 0.25),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.backgroundColor,
                ),
                child: TabBar(
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primaryColor,
                  ),
                  labelStyle: AppStyles.bold16Gold.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                  unselectedLabelStyle: AppStyles.bold16Gold.copyWith(
                    color: AppColors.white,
                  ),
                  tabs: [
                    Tab(child: Text('Radio')),
                    Tab(child: Text('Reciters')),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder(
                      future: ApiManager.getRadioData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Column(
                            children: [
                              Text("Something Went Wrong"),
                              ElevatedButton(
                                onPressed: () {
                                  ApiManager.getRadioData();
                                  setState(() {});
                                },
                                child: Text("Try Again"),
                              ),
                            ],
                          );
                        }
                        RadioResponseDM radio = snapshot.data!;
                        return ListView.builder(
                          itemCount: radio.radios?.length,
                          itemBuilder: (context, index) => RadioItem(
                            name: radio.radios?[index].name ?? "N/A",
                            url: radio.radios?[index].url ?? '',
                          ),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: ApiManager.getRecitersData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Column(
                            children: [
                              Text("Something Went Wrong"),
                              ElevatedButton(
                                onPressed: () {
                                  ApiManager.getRecitersData();
                                  setState(() {});
                                },
                                child: Text("Try Again"),
                              ),
                            ],
                          );
                        }
                        ReciterResponseDM reciter = snapshot.data!;
                        return ListView.builder(
                          itemCount: reciter.reciters?.length,
                          itemBuilder: (context, index) => RadioItem(
                            name: reciter.reciters?[index].name ?? 'N/A',
                            url:
                                "${reciter.reciters?[index].moshaf?[0].server}002.mp3",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
