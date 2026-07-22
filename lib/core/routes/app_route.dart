import 'package:flutter/material.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/features/home/home_screen.dart';
import 'package:islami_app/features/home/quran/sura_detailed_screen.dart';
import 'package:islami_app/features/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/features/splash/splash_screen2.dart';

abstract final class AppRoute {
  static final splashScreen2 = MaterialPageRoute(
    builder: (context) => SplashScreen2(),
  );
  static final onBoarding = MaterialPageRoute(
    builder: (context) => OnBoardingScreen(),
  );
  static final homeScreen = MaterialPageRoute(
    builder: (context) => HomeScreen(),
  );
  static MaterialPageRoute<dynamic> suraDetailed(SuraDM sura) =>
      MaterialPageRoute(builder: (context) => SuraDetailedScreen(suraDM: sura));

  // static MaterialPageRoute<dynamic> hadeethDetailed({
  //   required HadeethDetailedDm a,
  //   required int index,
  // }) => MaterialPageRoute(
  //   builder: (context) =>
  //       HadeethDetailedScreen(index: index, hadeethDetailedDm: a),
  // );
  static const String hadeethDetailedRouteName = "hadeethDetailed";
}
