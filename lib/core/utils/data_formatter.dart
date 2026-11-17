import 'package:intl/intl.dart';
import 'package:islami_app/core/model/prayer_times_dm.dart';

class DataFormatter {
  static String formateGregorian(Gregorian gregorian) {
    return '${gregorian.day} ${gregorian.month!.en!.substring(0, 3)}, \n ${gregorian.year}';
  }

  static String formateHijri(Hijri hijri) {
    return '${hijri.day} ${hijri.month!.en!.substring(0, 3)}, \n ${hijri.year}';
  }

  static String formateTime(String time) {
    DateTime dateTime = DateFormat('HH:mm').parse(time);
    return DateFormat('hh:mm \n  a').format(dateTime);
  }

  static Map<String, dynamic> sortPrayerTimes(
    Map<String, dynamic> prayerTimes,
  ) {
    final DateTime now = DateTime.now();
    // final DateTime now = DateTime(2026, 9, 26, 17, 30);

    final entries = prayerTimes.entries.map((entry) {
      final timeParts = entry.value.toString().split(":");
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      DateTime prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        hour,
        minute,
      );
      if (prayerDateTime.isBefore(now) ||
          prayerDateTime.isAtSameMomentAs(now)) {
        prayerDateTime = prayerDateTime.add(Duration(days: 1));
      }
      /// {"key" : "fajr" , }
      /// "time" : Today 2:30 pm  /// value
      /// "original" : "14:30" } /// value
      return MapEntry(entry.key, {
        "time": prayerDateTime,
        "originalString": entry.value,
      });
    }).toList();

    entries.sort(
      (prayer1, prayer2) =>
          prayer1.value['time'].compareTo(prayer2.value['time']),
    );

    return Map.fromEntries(
      entries.map((e) => MapEntry(e.key, e.value['originalString'])),
    );
  }

  static Map<String, Duration> getNextPrayerCountDown(
    Map<String, dynamic> prayerTimes,
  ) {
    final DateTime now = DateTime.now();
    final Map<String, Duration> timeDifference = {};

    prayerTimes.forEach((prayerName, prayerTimeString) {
      final timeParts = prayerTimeString.toString().split(":");
      DateTime prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(timeParts[0]),
        int.parse(timeParts[1]),
      );

      if (!prayerDateTime.isAfter(now)) {
        prayerDateTime = prayerDateTime.add(Duration(days: 1));
      }
      timeDifference[prayerName] = prayerDateTime.difference(now);
    });
    return timeDifference;

  }
}