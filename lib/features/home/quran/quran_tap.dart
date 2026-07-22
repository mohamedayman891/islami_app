import 'package:flutter/material.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_constants.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/home/quran/most_recently_item.dart';
import 'package:islami_app/features/home/quran/suras_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  TextEditingController controller = TextEditingController();
  List<String> mostRecentlyIds = [];
  Future<void> getMostRecently() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentlyIds = prefs.getStringList("mostRecently") ?? [];
    setState(() {});
  }

  List<SuraDM> suraSearch = [];
  void search(String q) {
    suraSearch = suras.where((element) {
      return element.suraNameAr.toLowerCase().contains(q) ||
          element.suraNameEn.toLowerCase().contains(q);
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    getMostRecently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesQuranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                Assets.imagesIslamiLogo,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Expanded(flex: 1, child: buildSearchTextField()),
            const SizedBox(height: 16),
            Text("Most Recently ", style: AppStyles.bold16White),
            const SizedBox(height: 10),
            Expanded(flex: 2, child: buildMostRecentlySura()),
            const SizedBox(height: 10),
            Text("Suras List ", style: AppStyles.bold16White),
            const SizedBox(height: 10),
            Expanded(flex: 5, child: buildSuraListView()),
          ],
        ),
      ),
    );
  }

  TextField buildSearchTextField() => TextField(
    controller: controller,
    onChanged: (value) {
      search(value);
    },
    cursorColor: AppColors.gold,
    style: AppStyles.bold16White,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 12),
      labelText: "Sura Name",
      labelStyle: AppStyles.bold16White,
      prefixIcon: Image.asset(Assets.imagesSearchFieldIcon),
      suffix: IconButton(
        onPressed: () {
          suraSearch = [];
          controller.clear();
          setState(() {});
        },
        icon: Icon(Icons.close, color: AppColors.gold),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
    ),
  );

  ListView buildMostRecentlySura() => ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: mostRecentlyIds.length,
    itemBuilder: (context, index) {
      List<SuraDM> mostRecent = suras.where((element) {
        return mostRecentlyIds.contains(element.index.toString());
      }).toList();
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: MostRecentlyItem(suraDM: mostRecent[index]),
      );
    },
  );
  ListView buildSuraListView() => ListView.separated(
    itemCount: (suraSearch.isEmpty && controller.text.trim().isEmpty)
        ? suras.length
        : suraSearch.length,
    itemBuilder: (context, index) {
      return SurasList(
        suraDM: suraSearch.isEmpty ? suras[index] : suraSearch[index],
        onBack: getMostRecently,
      );
    },
    separatorBuilder: (context, index) {
      return Divider(indent: 45, endIndent: 45);
    },
  );
}
