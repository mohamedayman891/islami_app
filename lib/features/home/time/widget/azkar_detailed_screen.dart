import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/model/azkar_dm.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/home/time/widget/azkar_item.dart';

class AzkarDetailedScreen extends StatefulWidget {
  const AzkarDetailedScreen({super.key, required this.azkarDM});
  final AzkarDM azkarDM;

  @override
  State<AzkarDetailedScreen> createState() => _AzkarDetailedScreenState();
}

class _AzkarDetailedScreenState extends State<AzkarDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(widget.azkarDM.azkarEn, style: AppStyles.bold20Gold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Assets.imagesLeftCorner),
                Text(widget.azkarDM.azkarAr, style: AppStyles.bold24Gold),
                Image.asset(Assets.imagesRightCorner),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder(
                future: widget.azkarDM.loadAzkar(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Something went wrong",
                          style: AppStyles.bold16White,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            widget.azkarDM.loadAzkar();
                            setState(() {});
                          },
                          child: const Text("Try Again"),
                        ),
                      ],
                    );
                  }
                  final azkarList = snapshot.data ?? [];
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: azkarList.length,
                    itemBuilder: (context, index) {
                      return AzkarItem(
                        zekrData: azkarList[index],
                        zekrNum: index,
                        totalAzkar: azkarList.length,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  );
                },
              ),
            ),
            Image.asset(Assets.imagesBottomDecoration),
          ],
        ),
      ),
    );
  }
}
