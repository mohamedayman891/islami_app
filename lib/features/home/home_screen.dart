import 'package:flutter/material.dart';
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

  int selectedIndex = 0;
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gold,
      selectedItemColor: Colors.white,
      selectedLabelStyle: AppStyles.bold12White,
      // unselectedIconTheme: IconThemeData(size: 24),
      items: [
        BottomNavigationBarItem(
          icon: buildNavigationIcon(Assets.imagesIcQuran, selectedIndex == 0),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationIcon(Assets.imagesIcHadeth, selectedIndex == 1),
          label: "Hadeth",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationIcon(Assets.imagesIcSebha, selectedIndex == 2),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationIcon(Assets.imagesIcRadio, selectedIndex == 3),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildNavigationIcon(Assets.imagesIcTime, selectedIndex == 4),
          label: "Time",
        ),
      ],
    );
  }

  Widget buildNavigationIcon(String icon, bool isSelected) {
    return Container(
      padding: isSelected
          ? EdgeInsets.symmetric(vertical: 6, horizontal: 20)
          : null,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.black.withValues(alpha: 0.6)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(66),
      ),
      child: Image.asset(
        icon,
        height: 25,
        width: 25,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
