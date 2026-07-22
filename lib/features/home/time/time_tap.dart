import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';

class TimeTap extends StatelessWidget {
  const TimeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesQuranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Text("Time")),
    );
  }
}
