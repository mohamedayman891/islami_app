import 'package:islami_app/core/utils/shared_prefs.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraList extends StatelessWidget {
  const SuraList({super.key, required this.suraDM, required this.onBack});
  final SuraDM suraDM;
  final Function() onBack;

  Future<void> setSura() async {
    List<String> allSura = SharedPrefs.getStringList("mostRecently") ?? [];
    allSura.add(suraDM.index.toString()); // store sura
    allSura = allSura.toSet().toList(); //(toSet) remove the repeated sura
    SharedPrefs.setStringList("mostRecently", allSura); // store list
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoute.suraDetailed(suraDM)).then((value) {
          onBack();
        }); // then => بتشتغل كمان شويه
        setSura();
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesSuraNumber),
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
