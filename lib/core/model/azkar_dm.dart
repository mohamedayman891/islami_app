import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_images.dart';

class AzkarDM {
  final String azkarEn;
  final String azkarAr;
  final String image;
  final String azkarType;

  const AzkarDM({
    required this.azkarEn,
    required this.azkarAr,
    required this.image,
    required this.azkarType,
  });

  Future<List<Map<String, dynamic>>> loadAzkar() async {
    const String fileName = "assets/files/azkar/azkar.json";
    final azkarContent = await rootBundle.loadString(fileName);
    final jsonContent = jsonDecode(azkarContent) as Map<String, dynamic>;
    if (jsonContent[azkarType] is List) {
      return List<Map<String, dynamic>>.from(
        (jsonContent[azkarType] as List).map(
          (e) => Map<String, dynamic>.from(e),
        ),
      );
    }
    return [];
  }

  static const List<AzkarDM> azkarCategories = [
    AzkarDM(
      azkarEn: "Morning Azkar",
      azkarAr: "أذكار الصباح",
      image: Assets.imagesMorningAzkar,
      azkarType: "أذكار الصباح",
    ),
    AzkarDM(
      azkarEn: "Evening Azkar",
      azkarAr: "أذكار المساء",
      image: Assets.imagesEveningAzkar,
      azkarType: "أذكار المساء",
    ),
    AzkarDM(
      azkarEn: "Post-Prayer Azkar",
      azkarAr: "أذكار بعد الصلاة",
      image: Assets.imagesPostPrayerAzkar,
      azkarType: "أذكار بعد السلام من الصلاة المفروضة",
    ),
    AzkarDM(
      azkarEn: "Tasabeeh",
      azkarAr: "تسابيح",
      image: Assets.imagesTasabeehAzkar,
      azkarType: "تسابيح",
    ),
    AzkarDM(
      azkarEn: "Sleeping Azkar",
      azkarAr: "أذكار النوم",
      image: Assets.imagesSleepingAzkar,
      azkarType: "أذكار النوم",
    ),
    AzkarDM(
      azkarEn: "Waking Up Azkar",
      azkarAr: "أذكار الاستيقاظ",
      image: Assets.imagesWakingUpAzkar,
      azkarType: "أذكار الاستيقاظ",
    ),
    AzkarDM(
      azkarEn: "Quranic Duas",
      azkarAr: "أدعية قرآنية",
      image: Assets.imagesQuranicDuas,
      azkarType: "أدعية قرآنية",
    ),
    AzkarDM(
      azkarEn: "Prophets Duas",
      azkarAr: "أدعية الأنبياء",
      image: Assets.imagesProphetsDuas,
      azkarType: "أدعية الأنبياء",
    ),
  ];
}
