import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              ZoomIn(
                duration: Duration(seconds: 1),
                child: Hero(
                  tag: "logo",
                  child: Image.asset(Assets.imagesSplash2),
                ),
              ),
              const Spacer(),
              FadeInUp(
                onFinish: (direction) {
                Future.delayed(Duration(seconds: 1), (){
                  if(context.mounted)Navigator.pushReplacement(context, AppRoute.onBoardingScreen);
                  });
                },
                delay: Duration(seconds: 1),
                child: Text(
                  "Supervised by Mohamed Ayman",
                  style: AppStyles.bold16Gold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
