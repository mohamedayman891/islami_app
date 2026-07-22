import 'package:flutter/material.dart';
import 'package:islami_app/core/model/onboarding_dm.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/features/on_boarding/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  static List<OnBoardingDm> onBoardingItem = [
    OnBoardingDm(
      image: Assets.imagesOnBoarding1,
      title: "Welcome To Islami App",
      subtitle: "",
    ),
    OnBoardingDm(
      image: Assets.imagesOnBoarding2,
      title: "Welcome To Islami",
      subtitle: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingDm(
      image: Assets.imagesOnBoarding3,
      title: "Reading the Quran",
      subtitle: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingDm(
      image: Assets.imagesOnBoarding3,
      title: "Bearish",
      subtitle: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingDm(
      image: Assets.imagesOnBoarding3,
      title: "Holy Quran Radio",
      subtitle:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
      itemCount: onBoardingItem.length,
      itemBuilder: (context, index) {
        return OnBoardingItem(
          pageController: pageController,
          onBoardingDm: onBoardingItem[index],
          currentPage: currentPage,
          length: onBoardingItem.length,
        );
      },
    );
  }
}
