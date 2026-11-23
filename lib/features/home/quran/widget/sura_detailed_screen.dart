import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/model/sura_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraDetailedScreen extends StatefulWidget {
  const SuraDetailedScreen({super.key, required this.suraDM});
  final SuraDM suraDM;
  @override
  State<SuraDetailedScreen> createState() => _SuraDetailedScreenState();
}

class _SuraDetailedScreenState extends State<SuraDetailedScreen> {
  String suraContent = "";
  @override
  void initState() {
    readSuraContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(widget.suraDM.suraNameEn, style: AppStyles.bold20Gold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Assets.imagesLeftCorner),
                Text(widget.suraDM.suraNameAr, style: AppStyles.bold24Gold),
                Image.asset(Assets.imagesRightCorner),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  suraContent,
                  style: AppStyles.bold20Gold,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Image.asset(Assets.imagesBottomDecoration),
          ],
        ),
      ),
    );
  }

  Future<void> readSuraContent() async {
    String fileName = "assets/files/suras/${widget.suraDM.index}.txt";
    Future<String> future = rootBundle.loadString(fileName);
    suraContent = await future;
    List<String> lines = suraContent.split("\n"); // number of aya
    for (int i = 0; i < lines.length; i++) {
      lines[i] += " {${i + 1}} ";
    }
    suraContent = lines.join();
    setState(() {});
  }
}
