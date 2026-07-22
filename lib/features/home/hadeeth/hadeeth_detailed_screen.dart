import 'package:flutter/material.dart';
import 'package:islami_app/core/model/hadeeth_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class HadeethDetailedScreen extends StatefulWidget {
  const HadeethDetailedScreen({super.key});
  @override
  State<HadeethDetailedScreen> createState() => _HadeethDetailedScreenState();
}

class _HadeethDetailedScreenState extends State<HadeethDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeethDm;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text("Hadith ${args.index + 1}", style: AppStyles.bold20Gold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.imagesLeftCorner),
                  Text(args.title, style: AppStyles.bold24Gold),
                  Image.asset(Assets.imagesRightCorner),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    args.content,
                    style: AppStyles.bold20Gold,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
            Image.asset(Assets.imagesBottomDecoration),
          ],
        ),
      ),
    );
  }
}
