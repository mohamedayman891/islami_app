import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/features/home/hadeeth/widget/hadeeth_widget.dart';

class HadeethTap extends StatefulWidget {
  const HadeethTap({super.key});

  @override
  State<HadeethTap> createState() => _HadeethTapState();
}

class _HadeethTapState extends State<HadeethTap> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesHadethBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              Assets.imagesIslamiLogo,
              height: height * 0.2,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 5,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
                height: double.infinity,
                enlargeCenterPage: true,
              ),
              itemCount: 50,
              itemBuilder: (context, index, realIndex) {
                return HadeethWidget(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
