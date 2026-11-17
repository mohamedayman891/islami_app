import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/azkar_dm.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key, required this.azkar});
  final AzkarDM azkar;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoute.azkarDetailed(azkar));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size.width * 0.4,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Image.asset(azkar.image, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  azkar.azkarEn,
                  style: AppStyles.bold16White,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
