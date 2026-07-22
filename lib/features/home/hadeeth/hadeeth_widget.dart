import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/model/hadeeth_dm.dart';
import 'package:islami_app/core/routes/app_route.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class HadeethWidget extends StatefulWidget {
  const HadeethWidget({super.key, required this.index});
  final int index;
  @override
  State<HadeethWidget> createState() => _HadeethWidgetState();
}

class _HadeethWidgetState extends State<HadeethWidget> {
  String title = "";
  String content = "";
  @override
  void initState() {
    readHadeethContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.hadeethDetailedRouteName,
          arguments: HadeethDm(
            title: title,
            content: content,
            index: widget.index,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(right: 12, left: 12, top: 10),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(Assets.imagesHadethCardBackground),
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.imagesLeftCorner,
                      color: AppColors.black,
                    ),
                    Image.asset(
                      Assets.imagesRightCorner,
                      color: AppColors.black,
                    ),
                  ],
                ),
                Text(title, style: AppStyles.bold24Black),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppStyles.bold16Black,
                  ),
                ),
              ),
            ),
            Image.asset(Assets.imagesBottomDecoration, color: AppColors.black),
          ],
        ),
      ),
    );
  }

  Future<void> readHadeethContent() async {
    String fileName = "assets/files/hadeeth/h${widget.index + 1}.txt";
    final String fileContent = await rootBundle.loadString(fileName);
    final List<String> lines = fileContent.split("\n");
    title = lines[0];
    lines.removeAt(0);
    content = lines.join();
    setState(() {});
  }
}
