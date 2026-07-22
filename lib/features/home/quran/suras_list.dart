import 'package:flutter/material.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/core/routes/app_route.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key, required this.suraDM, required this.onBack});
  final SuraDM suraDM;
  final Function() onBack;
  Future<void> setSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> allSura = prefs.getStringList("mostRecently") ?? [];
    allSura.add(suraDM.index.toString());
    allSura = allSura.toSet().toList();
    prefs.setStringList("mostRecently", allSura);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoute.suraDetailed(suraDM)).then((value) {
          onBack();
        });
        setSura();
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesSureNumber),
              fit: BoxFit.contain,
            ),
          ),
          alignment: Alignment.center,
          child: Text("${suraDM.index}", style: AppStyles.bold16White),
        ),
        title: Text(suraDM.suraNameEn, style: AppStyles.bold20White),
        subtitle: Text("${suraDM.verses} verses", style: AppStyles.bold14White),
        trailing: Text(suraDM.suraNameAr, style: AppStyles.bold20White),
      ),
    );
  }
}
