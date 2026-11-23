import 'package:dots_indicator/dots_indicator.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/onboarding_dm.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/on_boarding/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    pageController.addListener(() {
      currentPage = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: Image.asset(Assets.imagesIslamiLogo)),
            Expanded(
              flex: 6,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: pageController,
                itemCount: OnBoardingDM.onBoardingData.length,
                itemBuilder: (context, index) {
                  return OnBoardingItem(
                    onBoardingDM: OnBoardingDM.onBoardingData[index],
                  );
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Visibility(
                      visible: currentPage == 0 ? false : true,
                      child: Text("Back", style: AppStyles.bold16Gold),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: 5,
                    animate: true,
                    position: currentPage.toDouble(),
                    decorator: DotsDecorator(
                      color: AppColors.greyDots,
                      activeColor: AppColors.primaryColor,
                      size: const Size(7, 7),
                      activeSize: const Size(18, 7),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentPage ==
                          OnBoardingDM.onBoardingData.length - 1) {
                        Navigator.push(context, AppRoute.homeScreen);
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentPage == OnBoardingDM.onBoardingData.length - 1
                          ? "Finish"
                          : "Next",
                      style: AppStyles.bold16Gold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
