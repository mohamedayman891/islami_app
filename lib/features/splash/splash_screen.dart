import 'package:islami_app/core/utils/shared_prefs.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      bool isFirstTime = SharedPrefs.getBool('firstTime') ?? true;
      if (isFirstTime) {
        SharedPrefs.setBool('firstTime', false);
        Navigator.pushReplacement(context, AppRoute.splashScreen2);
      } else {
        Navigator.pushReplacement(context, AppRoute.homeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.imagesSplashBackground, fit: BoxFit.cover),
          Positioned(
            left: 0,
            top: 214,
            child: Image.asset(Assets.imagesSplashLeft),
          ),
          Positioned(
            right: 0,
            bottom: 114,
            child: Image.asset(Assets.imagesSplashRight),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(child: Image.asset(Assets.imagesMosque)),
          ),
          Positioned(
            top: 0,
            right: 25,
            child: Image.asset(Assets.imagesLantern),
          ),
          Center(child: Image.asset(Assets.imagesSplashLogo, width: 180)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.imagesRouteLogo),
                const SizedBox(height: 6),
                Text(
                  "Supervised by Mohamed Ayman",
                  style: AppStyles.regular16White.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
