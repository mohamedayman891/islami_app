import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, AppRoute.onBoarding);
            },
            child: Center(child: Image.asset(Assets.imagesSplash2)),
          ),
          Spacer(),
          Image.asset(Assets.imagesRouteLogo),
          Text("Supervised by Mohamed Ayman", style: AppStyles.bold16Gold),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
