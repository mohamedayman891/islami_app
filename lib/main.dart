import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/app_route.dart';
import 'package:islami_app/features/home/hadeeth/hadeeth_detailed_screen.dart';
import 'package:islami_app/features/home/home_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        AppRoute.hadeethDetailedRouteName: (context) => HadeethDetailedScreen(),
      },
    );
  }
}
