import 'package:islami_app/core/model/hadeeth_dm.dart';
import 'package:islami_app/features/home/hadeeth/widget/hadeeth_detailed_screen.dart';
import 'package:islami_app/features/home/quran/widget/sura_detailed_screen.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/azkar_dm.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/features/home/home_screen.dart';
import 'package:islami_app/features/home/time/widget/azkar_detailed_screen.dart';
import 'package:islami_app/features/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/features/splash/splash_screen2.dart';

abstract final class AppRoute {
  static final splashScreen2 = MaterialPageRoute(
    builder: (context) => SplashScreen2(),
  );
  static final onBoardingScreen = MaterialPageRoute(
    builder: (context) => OnBoardingScreen(),
  );
  static final homeScreen = MaterialPageRoute(
    builder: (context) => HomeScreen(),
  );
  static MaterialPageRoute<dynamic> suraDetailed(SuraDM suraDM) =>
      MaterialPageRoute(
        builder: (context) => SuraDetailedScreen(suraDM: suraDM),
      );

  static MaterialPageRoute<dynamic> azkarDetailed(AzkarDM azkarDM) =>
      MaterialPageRoute(
        builder: (context) => AzkarDetailedScreen(azkar: azkarDM),
      );

  static MaterialPageRoute<dynamic> hadeethDetailed(
     HadeethDM hadeethDM) => MaterialPageRoute(
    builder: (context) =>
        HadeethDetailedScreen(hadeethDM: hadeethDM),
  );
}
