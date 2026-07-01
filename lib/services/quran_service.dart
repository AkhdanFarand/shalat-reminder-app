import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/surah_model.dart';
import '../models/verse_model.dart';

class QuranService {
  static Future<List<SurahModel>> getSurah() async {
    final response = await http.get(
      Uri.parse(
        "https://api.alquran.cloud/v1/surah",
      ),
    );

    final json = jsonDecode(response.body);

    List data = json["data"];

    return data
        .map((e) => SurahModel.fromJson(e))
        .toList();
  }

  static Future<List<VerseModel>> getVerses(
    int surahNumber,
  ) async {

    final response = await http.get(
      Uri.parse(
        "https://api.alquran.cloud/v1/surah/$surahNumber/editions/quran-uthmani,id.indonesian",
      ),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      List arab =
          data["data"][0]["ayahs"];

      List indo =
          data["data"][1]["ayahs"];

      List<VerseModel> verses = [];

      for (int i = 0; i < arab.length; i++) {

        verses.add(
          VerseModel(
            number:
                arab[i]["numberInSurah"],

            arab:
                arab[i]["text"],

            translation:
                indo[i]["text"],
          ),
        );
      }

      return verses;
    }

    throw Exception("Failed");
  }
}