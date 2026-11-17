import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_app/core/model/prayer_times_dm.dart';
import 'package:islami_app/core/model/radio_response_dm.dart';
import 'package:islami_app/core/model/reciter_response_dm.dart';

class ApiManager {
  static Future<RadioResponseDM> getRadioData() async {
    try {
      Uri uri = Uri.parse("https://www.mp3quran.net/api/v3/radios?language=en");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioResponseDM.fromJson(jsonResponse);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<ReciterResponseDM> getRecitersData() async {
    try {
      Uri uri = Uri.parse(
        "https://www.mp3quran.net/api/v3/reciters?language=en",
      );
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return ReciterResponseDM.fromJson(jsonResponse);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<PrayerTimesDM> getPrayer() async {
    var date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    try {
      Uri uri = Uri.parse(
        "https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt",
      );
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return PrayerTimesDM.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }
}
