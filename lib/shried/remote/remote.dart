import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../model/Radio_Response.dart';

class ApiManager {

  static Future<RadioResponse> getRadio() async {
    var url = Uri.https(
        "api.mp3quran.net","/radios/radio_arabic.json");
    try {
      Response sources = await http.get(url);
      var json = jsonDecode(utf8.decode(sources.bodyBytes));
      RadioResponse sourcesResponse = RadioResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      rethrow;
    }
  }
}