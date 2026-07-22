import 'package:flutter/material.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/core/routes/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class MostRecentlyItem extends StatelessWidget {
  const MostRecentlyItem({super.key, required this.suraDM});
  final SuraDM suraDM;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoute.suraDetailed(suraDM));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * .7,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text(
                      suraDM.suraNameEn,
                      style: AppStyles.bold24Black,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      suraDM.suraNameAr,
                      style: AppStyles.bold24Black,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "${suraDM.verses} Verses",
                      style: AppStyles.bold14Black,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(Assets.imagesMostRecent),
          ],
        ),
      ),
    );
  }
}
