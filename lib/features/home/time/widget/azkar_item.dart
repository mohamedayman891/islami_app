import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({
    super.key,
    required this.zekrData,
    required this.zekrNum,
    required this.totalAzkar,
  });
  final Map<String, dynamic> zekrData;
  final int zekrNum;
  final int totalAzkar;

  @override
  Widget build(BuildContext context) {
    final displayNumber = zekrData['count']?.toString() ?? '$zekrNum';
    final content = zekrData['content']?.toString() ?? '';
    final description = zekrData['description']?.toString();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                ),
                child: Text(
                  "الذكر $displayNumber من $totalAzkar",
                  style: AppStyles.bold12Gold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Text("{ $displayNumber }", style: AppStyles.bold12Gold),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            content,
            style: AppStyles.bold20Gold,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          if (description != null && description.trim().isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              description,
              style: AppStyles.regular16White.copyWith(
                color: AppColors.white.withValues(alpha:0.8),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ],
        ],
      ),
    );
  }
}
