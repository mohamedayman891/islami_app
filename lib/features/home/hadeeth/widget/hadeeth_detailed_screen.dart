import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/hadeeth_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class HadeethDetailedScreen extends StatefulWidget {
  const HadeethDetailedScreen({super.key, required this.hadeethDM});
  final HadeethDM hadeethDM;
  @override
  State<HadeethDetailedScreen> createState() => _HadeethDetailedScreenState();
}

class _HadeethDetailedScreenState extends State<HadeethDetailedScreen> {
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
        title: Text("Hadith ${widget.hadeethDM.index + 1}", style: AppStyles.bold20Gold),
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
                  Text(widget.hadeethDM.title, style: AppStyles.bold24Gold),
                  Image.asset(Assets.imagesRightCorner),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.hadeethDM.content,
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
}
