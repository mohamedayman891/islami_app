import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/model/onboarding_dm.dart';
import 'package:islami_app/core/routes/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.length,
    required this.onBoardingDm,
  });
  final OnBoardingDm onBoardingDm;
  final PageController pageController;
  final int currentPage;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Image.asset(Assets.imagesIslamiLogo)),
            Expanded(flex: 6, child: Image.asset(onBoardingDm.image)),
            Text(onBoardingDm.title, style: AppStyles.bold24Gold),
            SizedBox(height: 20),
            currentPage == 0
                ? SizedBox.shrink()
                : Text(
                    onBoardingDm.subtitle,
                    style: AppStyles.bold20Gold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Visibility(
                    visible: currentPage == 0 ? false : true,
                    child: Text("Back", style: AppStyles.bold16Gold),
                  ),
                ),
                DotsIndicator(
                  dotsCount: 5,
                  position: currentPage.toDouble(),
                  decorator: DotsDecorator(
                    color: Color(0xff707070),
                    activeColor: AppColors.gold,
                    size: const Size(7, 7),
                    activeSize: const Size(18, 7),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentPage == length - 1) {
                      Navigator.pushReplacement(context, AppRoute.homeScreen);
                    } else {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    currentPage == length - 1 ? "Finish" : "Next",
                    style: AppStyles.bold16Gold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
