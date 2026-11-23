import 'package:islami_app/core/utils/shared_prefs.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_constants.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/home/quran/widget/most_recently_sura.dart';
import 'package:islami_app/features/home/quran/widget/sura_list.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  TextEditingController controller = TextEditingController();

  List<String> mostRecentlyIds = [];
  Future<void> getMostRecently() async {
    mostRecentlyIds = SharedPrefs.getStringList("mostRecently") ?? [];
    setState(() {});
  }

  List<SuraDM> suraSearch = [];
  void search(String q) {
    suraSearch = suras.where((element) {
      return element.suraNameAr.toLowerCase().contains(q.toLowerCase()) ||
          element.suraNameEn.toLowerCase().contains(q.toLowerCase());
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
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesQuranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.15,
              child: Image.asset(
                Assets.imagesIslamiLogo,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            SizedBox(height: height * 0.08, child: buildSearchTextField()),
            const SizedBox(height: 16),
            Text("Most Recently ", style: AppStyles.bold16White),
            const SizedBox(height: 10),
            SizedBox(height: height * 0.15, child: buildMostRecentlySura()),
            const SizedBox(height: 10),
            Text("Suras List ", style: AppStyles.bold16White),
            const SizedBox(height: 5),
            buildSuraListView(),
          ],
        ),
      ),
    );
  }

  Widget buildSearchTextField() => TextField(
    controller: controller,
    onChanged: (value) {
      search(value);
    },
    cursorColor: AppColors.primaryColor,
    style: AppStyles.bold20White,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      labelText: "Sura Name",
      labelStyle: AppStyles.bold16White,
      prefixIcon: Image.asset(Assets.imagesSearchFieldIcon),
      suffix: IconButton(
        onPressed: () {
          suraSearch = [];
          controller.clear();
          setState(() {});
        },
        icon: Icon(Icons.close, color: AppColors.primaryColor),
      ),
      border: border,
      focusedBorder: border,
      enabledBorder: border,
    ),
  );
  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
  );

  Widget buildMostRecentlySura() {
    if (mostRecentlyIds.isEmpty) {
      return Center(
        child: Text('no recent sura', style: AppStyles.bold20White),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mostRecentlyIds.length,
      itemBuilder: (context, index) {
        List<SuraDM> mostRecent = suras.where((element) {
          return mostRecentlyIds.contains(element.index.toString());
        }).toList();
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: MostRecentlySura(suraDM: mostRecent[index]),
        );
      },
    );
  }

  Widget buildSuraListView() {
    if (suraSearch.isEmpty && controller.text.trim().isNotEmpty) {
      return Center(
        child: Text('no sura found', style: AppStyles.bold20White),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemCount: (suraSearch.isEmpty && controller.text.trim().isEmpty)
            ? suras.length
            : suraSearch.length,
        itemBuilder: (context, index) {
          return SuraList(
            suraDM: (suraSearch.isEmpty && controller.text.trim().isEmpty)
                ? suras[index]
                : suraSearch[index],
            onBack: getMostRecently,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(indent: 45, endIndent: 45);
        },
      ),
    );
  }
}
