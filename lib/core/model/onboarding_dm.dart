import 'package:islami_app/core/utils/app_images.dart';

class OnBoardingDM {
  final String image;
  final String title;
  String? subtitle;

  OnBoardingDM({required this.image, required this.title, this.subtitle});
  static List<OnBoardingDM> onBoardingData = [
    OnBoardingDM(
      image: Assets.imagesOnBoarding1,
      title: "Welcome To Islami App",
      subtitle: "",
    ),
    OnBoardingDM(
      image: Assets.imagesOnBoarding2,
      title: "Welcome To Islami",
      subtitle: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingDM(
      image: Assets.imagesOnBoarding3,
      title: "Reading the Quran",
      subtitle: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingDM(
      image: Assets.imagesOnBoarding4,
      title: "Bearish",
      subtitle: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingDM(
      image: Assets.imagesOnBoarding5,
      title: "Holy Quran Radio",
      subtitle:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
