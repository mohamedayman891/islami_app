import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/onboarding_dm.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoardingDM});
  final OnBoardingDM onBoardingDM;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(onBoardingDM.image)),
        SizedBox(height: 10),
        Text(onBoardingDM.title, style: AppStyles.bold24Gold),
        SizedBox(height: 20),
        onBoardingDM.subtitle == null
            ? SizedBox.shrink()
            : Text(
                onBoardingDM.subtitle!,
                style: AppStyles.bold20Gold,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
      ],
    );
  }
}
