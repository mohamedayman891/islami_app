import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/home/hadeeth/hadeeth_tap.dart';
import 'package:islami_app/features/home/quran/quran_tap.dart';
import 'package:islami_app/features/home/radio/radio_tap.dart';
import 'package:islami_app/features/home/sebha/sebha_tap.dart';
import 'package:islami_app/features/home/time/time_tap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationBar(),
        body: taps[selectedIndex],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.white,
      selectedLabelStyle: AppStyles.regular12White,
      items: [
        BottomNavigationBarItem(
          icon: buildNavigationBarIcon(
            Assets.imagesIcQuran,
            selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationBarIcon(
            Assets.imagesIcHadeth,
            selectedIndex == 1,
          ),
          label: "Hadeeth",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationBarIcon(
            Assets.imagesIcSebha,
            selectedIndex == 2,
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationBarIcon(
            Assets.imagesIcRadio,
            selectedIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationBarIcon(Assets.imagesIcTime, selectedIndex == 4),
          label: "Time",
        ),
      ],
    );
  }

  Widget buildNavigationBarIcon(String icon, bool isSelected) {
    return Container(
      padding: isSelected
          ? EdgeInsets.symmetric(vertical: 6, horizontal: 20)
          : null,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.black.withValues(alpha: 0.6)
            : AppColors.transparent,
        borderRadius: BorderRadius.circular(66),
      ),
      child: Image.asset(
        icon,
        height: 25,
        width: 25,
        color: isSelected ? AppColors.white : AppColors.black,
      ),
    );
  }
}
