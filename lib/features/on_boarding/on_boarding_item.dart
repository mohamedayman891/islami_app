import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/onboarding_dm.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoarding});
  final OnBoardingDM onBoarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(onBoarding.image)),
        SizedBox(height: 10),
        Text(onBoarding.title, style: AppStyles.bold24Gold),
        SizedBox(height: 20),
        onBoarding.subtitle == null
            ? SizedBox.shrink()
            : Text(
                onBoarding.subtitle!,
                style: AppStyles.bold20Gold,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
      ],
    );
  }
}
